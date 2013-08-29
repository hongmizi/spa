class Brand < ActiveRecord::Base
  attr_accessible :description, :name

  has_one :image, as: :imageable, dependent: :destroy
end
