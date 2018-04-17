class Generic < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :drug_generics
  has_many :drugs, through: :drug_generics
  has_one :dispense_status
  # has_one :unit

  scope :popular, -> { order(:visit_count, :desc) }
end
