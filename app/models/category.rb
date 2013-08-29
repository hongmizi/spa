class Category < ActiveRecord::Base
  act_as_nested_set
  attr_accessible :depth, :lft, :name, :parent_id, :rgt

  has_many :products
end
