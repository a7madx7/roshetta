class Country < ApplicationRecord
  validates_presence_of :name, on: :create, message: "A country name can't be empty"
  
  has_many :companies
  has_many :drugs
end
