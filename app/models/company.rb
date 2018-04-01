class Company < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  
  belongs_to :country
  has_many :drugs
end
