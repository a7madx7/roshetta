class CreateSuggestionTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestion_terms do |t|
      t.string :term
      t.references :drug, foreign_key: true

      t.timestamps
    end
  end
end
