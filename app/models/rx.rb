class Rx < ApplicationRecord

  validates :password, presence: true, length: {minimum:4, maximum:64}

  has_many :rx_items
  has_many :drugs, through: :rx_items
end