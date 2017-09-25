class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :guesses do |t|
      t.references :user, foreign_key: true

      t.references :category, foreign_key: true, index: true
      t.references :answer, index: true

      t.timestamps
    end

    add_foreign_key :guesses, :categories, column: :answer_id
  end
end
