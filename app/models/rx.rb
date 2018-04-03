class Rx < ApplicationRecord

  validates :password, presence: true, length: {minimum:4, maximum:64}
end64