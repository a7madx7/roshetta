class Price < ApplicationRecord
  belongs_to :drug
  validates :value, presence: true, numericality: {less_than: 10_000_000, greater_than: 0.01 }

  def to_s
    "Price: #{value}, from #{from_date}, to: #{to_date}"
  end
end
