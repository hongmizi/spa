class ChangeModels < ActiveRecord::Migration
  def up
    drop_table :products

    create_table :cosmetics do |t|
      t.string :name
      t.text :description
      t.integer :brand_id
      t.string :state
      t.integer :category_id

      t.timestamps
    end

    add_index :cosmetics, :brand_id
    add_index :cosmetics, :category_id


    remove_column :listings, :product_id
    add_column :listings, :purchasable_id, :integer
    add_column :listings, :purchasable_type, :string
    add_index :listings, :purchasable_id
    add_index :listings, :purchasable_type

    add_column :line_items, :listing_id, :integer
    add_index :line_items, :listing_id
    remove_column :line_items, :product_id

    add_column :carts, :state, :string
  end

  def down
  end
end
