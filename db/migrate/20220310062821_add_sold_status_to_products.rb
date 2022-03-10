class AddSoldStatusToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :sold_status, :boolean, default: false
  end
end
