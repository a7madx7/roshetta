module CompanySeed
  def company_seed
    File.readlines(COMPANIES).each do |company|
      Company.create({
        name: company.chomp,
        country: Country.where("lower(name) = 'egypt'").first,
        reputation: 0.0
      })
    end
  end

  def company_seed_to_file
    puts 'Started seeding companies...'
    companies = []
    companies << 'UNKNOWN OR IMPORTED'
    read(DRUG_DB_FILE) do |d|
      begin
        companies << d['company']
      rescue Exception => ex
        puts "Error creating a company: #{ex.message}"
        next
      end
    end

    File.open(COMPANIES, 'w+') { |file|
        file.puts(companies.uniq.sort)  
    }
    puts 'Finished seeding companies.'
  end
end