class Price < ApplicationRecord
  belongs_to :drug
  
  def to_s
    "Price: #{value}, from #{from_date}, to: #{to_date}"
  end
end
