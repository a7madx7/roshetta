class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.references :question, foreign_key: true
      t.references :user, foreign_key: true
      t.text :content
      t.string :title
      t.string :link
      t.string :image

      t.timestamps
    end
  end
end
