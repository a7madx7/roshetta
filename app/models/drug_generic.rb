class DrugGeneric < ApplicationRecord
  belongs_to :generic
  belongs_to :drug

  has_one :unit

  def to_s
    "#{id} concentration: #{concentration}, unit: #{Unit.find(unit_id)}"
  end
end
