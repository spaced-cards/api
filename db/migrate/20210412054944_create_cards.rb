class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.references :deck, null: false, foreign_key: true
      t.binary :question, null: false, limit: 1.megabyte
      t.text :answer, null: false

      t.timestamps
    end
  end
end
