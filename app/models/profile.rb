class Profile < ApplicationRecord
  belongs_to :user
  has_many :badges

  validates_presence_of :first_name, :last_name, on: :create, message: "Name can not be blank"

  def complete?
    mobile_phone.present? && address.present? && gender.present? &&
      profession.present? && speciality.present? && land_line.present?
  end

  def name
    "#{first_name unless first_name.empty?} #{middle_name unless middle_name.empty?} #{last_name unless last_name.empty?}"
  end
end
