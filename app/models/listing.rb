class Listing < ActiveRecord::Base
  attr_accessible :purchasable_id, :purchasable_type, :stock, :price

  belongs_to :purchasable, polymorphic: true
  delegate :name, to: :purchasable, prefix: true

  validates :stock, numericality: {greater_than_or_equal_to: 0}
  validates :price, presence: true
  has_and_belongs_to_many :option_values

  def can_purchase?
    stock > 1 && purchasable
  end

  def types 
    option_values.inject("") do |res, i|
      res + i.name + " "
    end
  end
end
