class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :user_id, :listing_id, :quantity, :price

  belongs_to :cart
  belongs_to :user
  belongs_to :listing
  belongs_to :order
  delegate :purchasable_name, to: :listing
  delegate :price, to: :listing
  delegate :can_purchase?, to: :listing

  validates :quantity, :listing, :price, presence: true
end
