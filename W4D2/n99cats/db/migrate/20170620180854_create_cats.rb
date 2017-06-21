class CreateCats < ActiveRecord::Migration[5.0]
  def change
    create_table :cats do |t|
      t.date :birth_date, null: false
      t.string :color, null: false
      t.string :name, null: false
      t.text :description
      t.string :gender, limit: 1, null: false
      t.timestamps
    end
  end
end