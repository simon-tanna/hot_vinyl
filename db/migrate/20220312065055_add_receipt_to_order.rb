class AddReceiptToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :receipt_url, :string
  end
end
