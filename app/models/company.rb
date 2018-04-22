class Company < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  acts_as_votable

  belongs_to :country
  has_many :drugs

  scope :popular, -> { order(:visit_count, :desc) }
end
