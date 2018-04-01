class Unit < ApplicationRecord
  belongs_to :drug_generic
  validates :name, presence: true, uniqueness: true
  
  def to_s
    "#{name}"
  end
end
