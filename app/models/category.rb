class Category < ApplicationRecord
  belongs_to :parent, :class_name => "Category", :foreign_key => "parent_category_id"
  has_many :sub_categories, :class_name => "Category", :foreign_key => "parent_category_id"
  validates :name, presence: true, uniqueness: true, length: { minimum:2, maximum:256 }

  has_many :drug_categories
  has_many :drugs, through: :drug_categories
end
