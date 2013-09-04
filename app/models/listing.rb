class Listing < ActiveRecord::Base
  attr_accessible :name, :purchasable_id, :purchasable_type, :stock, :price

  belongs_to :purchasable, polymorphic: true
  delegate :name, to: :purchasable, prefix: true

  validates :stock, numericality: {greater_than_or_equal_to: 0}
  validates :price, presence: true


  def can_purchase?
    stock > 1 && purchasable
  end
end
