class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :user_id

  belongs_to :cart
  belongs_to :product
  belongs_to :user
end
