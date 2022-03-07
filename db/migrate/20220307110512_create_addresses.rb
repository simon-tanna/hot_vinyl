class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :suburb
      t.string :state
      t.string :postcode
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
