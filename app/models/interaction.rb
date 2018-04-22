class Interaction < ApplicationRecord
  acts_as_votable
  validates_presence_of :title, :first_drug, :second_drug, :description
  validates_length_of :description, minimum: 16, maximum: 5000
end
