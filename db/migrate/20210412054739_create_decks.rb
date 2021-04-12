class CreateDecks < ActiveRecord::Migration[6.0]
  def change
    create_table :decks do |t|
      t.string :name, null: false
      t.references :user, null: false, foreign_key: true
      t.text :description, null: false
      t.references :deck_category, null: false, foreign_key: true
      t.integer :difficulty, limit: 1, null: false

      t.timestamps
    end
    add_index :decks, :difficulty
  end
end
