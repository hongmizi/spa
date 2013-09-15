class CreateOptionTypes < ActiveRecord::Migration
  def change
    create_table :option_types do |t|
      t.integer :purchasable_id
      t.string :purchasable_type
      t.string :name

      t.timestamps
    end
    add_index :option_types, :purchasable_id
    add_index :option_types, :purchasable_type
  end
end
