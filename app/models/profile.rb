class Profile < ApplicationRecord
  belongs_to :user
  has_many :badges

  def complete?
    mobile_phone.present? && address.present? && gender.present? &&
      profession.present? && speciality.present? && land_line.present?
  end
end
