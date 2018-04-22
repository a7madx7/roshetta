# rails db:drop && rails db:migrate && rails db:seed
require_relative File.dirname(__FILE__) + '/seed_constants.rb'
require_relative File.dirname(__FILE__) + '/db_readers.rb'
require_relative File.dirname(__FILE__) + '/company_seed.rb'
require_relative File.dirname(__FILE__) + '/category_seed.rb'
require_relative File.dirname(__FILE__) + '/simple_attribute_seed.rb'
require_relative File.dirname(__FILE__) + '/drug_seed.rb'
require_relative File.dirname(__FILE__) + '/search_engine_seed.rb'
country_seed
user_seed
unit_seed
form_seed


include SearchEngineSeeder
search_seeder

include CategorySeed
category_seed
include CompanySeed
company_seed

include DrugSeed
drug_seed