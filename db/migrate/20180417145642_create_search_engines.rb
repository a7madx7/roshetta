class CreateSearchEngines < ActiveRecord::Migration[5.1]
  def change
    create_table :search_engines do |t|
      t.string :model
      t.string :regex

      t.timestamps
    end
  end
end
