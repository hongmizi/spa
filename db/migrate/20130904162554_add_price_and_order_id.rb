class AddPriceAndOrderId < ActiveRecord::Migration
  def up
    add_column :line_items, :price, :decimal, precision:8, scale:2
    add_column :listings, :price, :decimal, precision:8, scale:2
    add_column :line_items, :order_id, :integer
  end

  def down
  end
end
