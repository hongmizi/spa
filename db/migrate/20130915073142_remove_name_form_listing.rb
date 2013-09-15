class RemoveNameFormListing < ActiveRecord::Migration
  def up
    remove_column :listings, :name
  end

  def down
  end
end
