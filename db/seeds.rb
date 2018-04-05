# rails db:drop && rails db:migrate && rails db:seed
require_relative 'seed_constants.rb'
require_relative 'db_readers.rb'
require_relative 'company_seed.rb'
require_relative 'category_seed.rb'
require_relative 'simple_attribute_seed.rb'
require_relative 'drug_seed.rb'

country_seed
user_seed
unit_seed
form_seed

include CategorySeed
category_seed
include CompanySeed
company_seed

include DrugSeed
drug_seed