class AddVisitCountToCompany < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :visit_count, :integer
  end
end
