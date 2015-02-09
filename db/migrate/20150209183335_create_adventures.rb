class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.string :name
      t.string :address
      t.integer :phone
      t.text :meal_description
      t.belongs_to :journal, index: true

      t.timestamps null: false
    end
    add_foreign_key :adventures, :journals
  end
end
