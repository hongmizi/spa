class CreateOptionValues < ActiveRecord::Migration
  def change
    create_table :option_values do |t|
      t.integer :option_type_id
      t.string :name

      t.timestamps
    end
    add_index :option_values, :option_type_id
  end
end
