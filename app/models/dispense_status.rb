class DispenseStatus < ApplicationRecord
  belongs_to :generic
  validates :detailed_description, length: { minimum: 16, maximum: 5000 }
  def prohibited_discontinued?
    # if both are false then its prohibited
    !(pom && otc)
  end

  def detailed_status?
    # if both are true then it must have some detailed status
    pom && otc
  end

  def otc_only?
    otc && !pom
  end

  def pom_only?
    pom && !otc
  end

  def dispense_status
    'POM Only' if pom_only?
    'OTC Only' if otc_only?
    "#{detailed_description}" if detailed_status?
    'Prohibited or Discontinued' if prohibited_discontinued?
  end
end
