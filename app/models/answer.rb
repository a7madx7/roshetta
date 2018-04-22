class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  acts_as_votable

  validates_presence_of :title, :content
  validates_length_of :title, :content, length: { minimum: 3, maximum: 5000 }
end
