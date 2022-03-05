class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :artist
      t.float :price
      t.integer :vinyl_weight
      t.string :catalog_number
      t.string :condition
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
