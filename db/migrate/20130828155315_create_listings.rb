class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :product_id
      t.string :name
      t.integer :stock

      t.timestamps
    end

    add_index :listings, :product_id
  end
end
