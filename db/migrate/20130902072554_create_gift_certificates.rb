class CreateGiftCertificates < ActiveRecord::Migration
  def change
    create_table :gift_certificates do |t|
      t.string :name
      t.text :description
      t.integer :brand_id
      t.string :state
      t.integer :category_id

      t.timestamps
    end
  end
end
