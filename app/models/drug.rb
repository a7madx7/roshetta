class Drug < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum:2, maximum:256, too_short: 'Drug name needs to be more than 2 characters', too_long: 'Drug name can not be more than 256 characters in length' }

   validates :price, presence: true, numericality: { greater_than: 0.01, less_than: 10000000 }

   has_many :drug_categories
   has_many :categories, through: :drug_categories

   has_many :drug_generics
   has_many :generics, through: :drug_generics

   belongs_to :country
   belongs_to :company
   belongs_to :form

   scope :popular, -> { order(:visit_count, :desc) }
   
   def to_s
    "{ name: #{name}, company: #{company.name}, country: #{country.name}}"
   end
end
