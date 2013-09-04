class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :user_id, :listing_id, :quantity

  belongs_to :cart
  belongs_to :user
  belongs_to :listing

  validates :quantity, presence: true
  validates :listing, presence: true
end
