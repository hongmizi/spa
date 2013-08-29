class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :brand_id
      t.string :type
      t.string :state
      t.integer :stock
      t.integer :category_id

      t.timestamps
    end

    add_index :products, :brand_id
  end
end
