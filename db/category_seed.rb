module CategorySeed
  #todo: bug fix the parent category seeding ## done ##
  def category_seed
    puts 'Started seeding categories...'
    @root_cat = Category.new(name: 'Drug')
    @root_cat.parent = @root_cat
    @root_cat.save

    read(DRUG_DB_FILE) do |d|
      # Categories
      begin

        if d['category'].present?
          @cat = Category.new(name: d['category'].to_s.downcase)
          @cat.parent = @root_cat
          @cat.save
        end

        if d['parent_category'].present?
            @parent_cat = Category.new(name: d['parent_category'].to_s.downcase)
            @parent_cat.parent = @root_cat
            @parent_cat.save
            @cat.parent = @parent_cat
            @cat.save
        end

        unless @cat
          @cat = Category.new(name: 'UNKNOWN')
          @cat.parent = @root_category
          @cat.save
        end

      rescue Exception => ex
        puts "Error creating a category: #{ex.message}"
        next
      end
    end
    puts 'Finished seeding categories.'
  end

  def category_seed_to_file
    puts 'Started seeding categories to file...'
    categories = Hash.new('')
    categories['UNKNOWN'] = ''
    read(DRUG_DB_FILE) do |d|
      begin
        if d['parent_category']
          categories[d['category'].downcase] = d['parent_category']
        elsif d['category'] and not d['parent_category']
            categories[d['category'].downcase] = ''
        end
      
        
      rescue Exception => ex
        puts "Error creating a company: #{ex.message}"
        next
      end
    end

    File.open(CATEGORIES, 'w+') { |file|
        file.puts(categories.uniq.sort)  
    }
    puts 'Finished seeding companies.'
  end

end