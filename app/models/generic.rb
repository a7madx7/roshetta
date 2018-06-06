class Generic < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  acts_as_votable

  has_many :drug_generics
  has_many :drugs, through: :drug_generics
  has_many :side_effects

  has_one :dispense_status
  # has_one :unit

  scope :least_visited, -> { order(visit_count: :desc) }
  scope :least_visited, -> { order(visit_count: :asc) }
  scope :most_shared, -> { }
  scope :least_shared, -> { }
  scope :most_liked, -> { order(cached_votes_up: :desc) }
  scope :least_liked, -> { order(cached_votes_up: :asc) }
  scope :most_hated, -> { order(cached_votes_down: :desc) }
  scope :least_hated, -> { order(cached_votes_down: :asc) }
  scope :popular, -> { order(prescribe_count: :desc) }
end
