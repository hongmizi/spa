class Listing < ActiveRecord::Base
  attr_accessible :name, :product_id, :stock

  belongs_to :product

  validates :stock, numericality: {greater_than_or_equal_to: 0}
  validates :product, presence: true
end
