class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.references :user, foreign_key: true
      t.text :content
      t.string :title
      t.string :link
      t.string :image

      t.timestamps
    end
  end
end
