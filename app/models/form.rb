class Form < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 56 }
    has_many :drugs
end
