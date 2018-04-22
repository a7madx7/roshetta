class Generic < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  acts_as_votable

  has_many :drug_generics
  has_many :drugs, through: :drug_generics
  has_one :dispense_status
  # has_one :unit

  scope :most_visited, -> { order(:visit_count, :desc) }
  scope :least_visited, -> { }
  scope :most_shared, -> { }
  scope :least_shared, -> { }
  scope :most_liked, -> { }
  scope :least_liked, -> { }
  scope :popular, -> { order(prescribe_count: :desc) }
end
