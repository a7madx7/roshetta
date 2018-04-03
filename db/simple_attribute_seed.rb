def form_seed
  puts 'Started seeding dosage forms...'
  begin
    ['amp', 'vial',
     'cap', 'tab', 'enteric coated tab', 'film coated tab', 'lozenges' , 'chew. tab', 'caplet', 'pilules', 'powder',
     'susp', 'emulsion', 'spray', 'syrup', 'tincture', 'decoction', 'infusion', 'bottle', 'elixir',
     'lotion','oil', 'serum', 'shampoo', 'lip stick', 'roll on',
     'granules', 'eff. granules', 'eff. tab',
     'spray', 'topical spray', 'neb. susp', 'oral spray',
     'turbohaler', 'evohaler', 'inhaled cap', 'novolet', 'inhaler', 'aerosol', 'discus',
     'drops', 'ear drops', 'eye drops', 'oral drops',
     'cream', 'ointment', 'gel', 'eye(ointment-gel)', 'cream gel', 'oral gel',
     'mouth wash (m.w.)', 'suppository',
     'vaginal suppository', 'vaginal cream', 'vaginal tab','vaginal douche', 'vaginal powder', 'vaginal gel',
     'rectal tube',
     'enema', 'soap', 'pack',
     'sachets',
     'patches', 'sheet', 'liniment',
     'pen', 'flexpen', 'prefilled pen', 'cartridges', 'carpule', 'syringe'].each do |df|
      begin
        Form.create!(name: df)
      rescue Exception => ex
        puts "Error creating a dosage form: #{ex.message}"
        next
      end
    end
  rescue Exception => ex
    puts ex.message
  end
  puts 'Finished seeding dosage forms.'
end

def unit_seed
 puts 'Started seeding concentration units...'
 begin
   ['ml', 'mg', '%', 'ppm', 'g', 'kg', 'mcgm', 'pico gram', 'nano gram', 'miu', 'million', 'billion', 'u/ml', 'unit', 'i.u.'].each do |unit|
     begin
       Unit.create(name: unit)
     rescue Exception => ex
       puts "Error creating a concentration unit: #{ex.message}"
       next
     end
   end
 rescue Exception => ex
   puts ex.message
 end
  puts 'Done seeding concentration units.'
end

def country_seed
  puts 'Started seeding countries...'
  Country.create({name: 'Universal'})
  ISO3166::Country.all.each do |country|
    Country.create({name: country.name})
  end
  puts 'Finished seeding countries.'
end

def user_seed
  puts 'Started seeding users...'
 begin
   profile = Profile.create!(
     mobile_phone: '00201140404660',
     address: 'Alexandria, Egypt',
     profession: 'Pharmacist',
     user_id: 1,
     reputation: 0
   )
   User.create!(password: '123testing', password_confirmation: '123testing', email: 'ahmad.hamdi.emara@gmail.com', profile: profile)

  #  User.create!(username: 'aug', password: '123testing', password_confirmation: '123testing', email: 'aug@gmail.com',
  #                       country_id: 70, first_name: 'Ahmad', last_name: 'El Gewaily', profession: 'Pharmacist', gender: 'male')
  #  User.create!(username: 'guest', password: '123testing', password_confirmation: '123testing', email: 'guest@gmail.com',
  #                       country_id: 70, first_name: 'Guest', last_name: 'User', profession: 'Physician', gender: 'female')
  #  User.create!(username: 'physician', password: '123testing', password_confirmation: '123testing', email: 'physician@gmail.com',
  #                       country_id: 70, first_name: 'Deyaa', last_name: 'Hamdi', profession: 'Physician', gender: 'male')
  #  User.create!(username: 'student', password: '123testing', password_confirmation: '123testing', email: 'student@gmail.com',
  #                       country_id: 70, first_name: 'sondos', last_name: 'farid', profession: 'Physician', gender: 'female')
  #  User.create!(username: 'company', password: '123testing', password_confirmation: '123testing', email: 'company@gmail.com',
  #                       country_id: 70, first_name: 'United', last_name: 'Pharma', profession: 'company', gender: 'male')
 rescue Exception => ex
   puts "User seeding error: #{ex.message}"
 end
  puts 'Finished seeding users.'
end 

def diagnoses_seed
  puts 'Started seeding diagnoses...'
  10.times do |n|
    begin
      Diagnosis.create!(name: "Diagnosis number #{n + 1}")
    rescue Exception => ex
      puts "Error creating a diagnosis: #{ex.message}"
    end
  end
  puts 'Finished seeding diagnoses.'
end

def articles_seed
  puts 'Started seeding articles...'
  # Article.all.each { |article| article.destroy; article.save }

  66.times do |n|
    begin
      a = Article.create!(title: "Title number #{n + 1} for this article",
                         content: "This should be the content of article number #{n + 1}",
                         user_id: Random.rand(1..6))

      begin
        a.categories << Category.first
      rescue
      end
    rescue Exception => ex
      puts "Article seeding error: #{ex.message}"
      next
    end
  end
  puts 'Finished seeding articles.'
end

def question_seed
  puts 'Started seeding questions...'
  999.times do |n|
    begin
      Question.create!(title: "#{n + 1} How can I become a pharmacist?",
                               content: "#{n + 1} I wish to be a successful pharmacist in the future, how can I do that?",
                               rating: 5,
                               user_id:  Random.rand(1..6))
    rescue Exception => ex
      puts ex.message
      next
    end
  end
  puts 'Finished seeding questions.'
end
