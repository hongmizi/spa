class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :state
      t.text :address
      t.string :name

      t.timestamps
    end
  end
end
