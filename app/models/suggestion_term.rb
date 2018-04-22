class SuggestionTerm < ApplicationRecord
  belongs_to :drug
  validates :term, length: { minimum: 3, maximum: 512 }
end
