class CreateListingsOptionValuesTable < ActiveRecord::Migration
  def up
    create_table :listings_option_values do |t|
      t.integer :listing_id
      t.integer :option_value_id
    end
    add_index :listings_option_values, :listing_id
    add_index :listings_option_values, :option_value_id
  end

  def down
  end
end
