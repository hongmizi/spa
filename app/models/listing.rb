class Listing < ActiveRecord::Base
  attr_accessible :name, :purchasable_id, :purchasable_type, :stock

  belongs_to :purchasable, polymorphic: true

  validates :stock, numericality: {greater_than_or_equal_to: 0}
end
