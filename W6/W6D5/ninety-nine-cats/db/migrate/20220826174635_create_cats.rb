class CreateCats < ActiveRecord::Migration[7.0]
  def change
    create_table :cats do |t|
      t.string :color, null: false
      t.string :name, null: false
      t.string :sex, null: false, :limit => 1
      t.text :description
      t.date :birth_date, null: false
      t.timestamps
    end
  end
end
