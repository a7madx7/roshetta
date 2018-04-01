module DrugSeed
  # creates generics, and drugs.
  def drug_seed
    puts 'Started seeding drugs...'
    read(DRUG_DB_FILE) do |d|
    # d is a decoded json line representing a drug object
      begin
        unless d['name'].nil? # if the json line contains a name for that drug
          @drug = Drug.where(name: d['name'].downcase).first_or_create! do |m|
            # create this drug
            m.name = d['name'].downcase

            # country
            m.country = Country.where("lower(name) = 'egypt'").first

            # company
            if d['company'].nil?  
              m.company = Company.where(name: 'UNKNOWN OR IMPORTED').first
            else # if json line contains a company just add it
              m.company = Company.where(name: d['company'].chomp).first
            end
        
            # form
            unless d['form'].nil?
              m.form = Form.where('name like ?', "%#{d['form']}%").first_or_create
            end

            # # contents
            # unless d['contents'].nil?
            #   drug.contents = d['contents'].to_f
            # end

            # price
            unless d['price'].nil?
              m.price = d['price'].to_s.to_f * 1.5 # new price factor
            end
          end

           # categories

          if @cat = Category.where(name: d['category'].to_s.downcase).first
            @drug.categories << @cat
          elsif @cat = Category.where(name: d['parent_category'].to_s.downcase).first
            @drug.categories << @cat
          else
            @cat = Category.where(name: 'UNKNOWN OR IMPORTED').first
            @drug.categories << @cat
          end
            
          # Start seeding the generics to the drugs.
          begin
            # d is a single decoded json line
            unless d['active_ingredient'].nil?
              d['active_ingredient'].each do |ac|
                begin
                  g = Generic.where(name: ac['name'].downcase).first_or_create

                  @drug.generics << g
                  @drug.save
                rescue Exception => ex
                  puts "Generic loading inside drug error: #{ex.message}"
                  next
                ensure
                  
                end
              end
            end
          rescue Exception => err
            puts "Error loading whole generics: #{err.message}"
            next
          end
          # find the drug that has the same drug id as the current one
          # loop through its generics
          # assign a unit and concentration value to them
          begin
           unless d['active_ingredient'].nil?
            d['active_ingredient'].each do |ai|
              db_generic = Generic.where(name: ai['name'].downcase).first
              DrugGeneric.where(drug_id: @drug.id, generic_id: db_generic.id).first.tap do |medicine|
                begin
                  unit = Unit.where(name: ai['unit'].downcase).first_or_create
                  medicine.unit_id = unit.id
                rescue Exception => ex
                  puts "Error while assigning unit id to the drug generic object: #{ex.message}"
                  puts "DrugGeneric Object: #{medicine.to_s}"
                  puts "ai: #{ai.to_s}"
                  puts "unit: #{ai['unit']}"
                  raise
                end

                begin
                  # todo: bug -> assigns wrong concentration to the wrong generic
                  medicine.concentration = ai['concentration'].to_f
                rescue Exception => ex
                  puts puts "Error while assigning concentration to the drug generic object: #{ex.message}"
                end

                medicine.save
              end
            end
          end
          rescue Exception => ex
            puts "Error updating DrugGeneric unit and concentration: #{ex.message}"
            break
          end
        end
      rescue Exception => ex
        puts "Error while creating the drug object: #{ex.message}"
        next
        # break
      end
    puts "Created #{drug}"
    end
    puts 'Finished seeding drugs.'
  end
end