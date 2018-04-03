class Company < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  
  belongs_to :country
  has_many :drugs

  scope :popular, -> { order(:visit_count, :desc) }
end
