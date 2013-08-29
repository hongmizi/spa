class Product < ActiveRecord::Base
  attr_accessible :brand_id, :description, :name

  has_many :images, as: :imageable, dependent: :destroy

  validates :stock, :numericality => {:greater_than_or_equal_to => 0}

  state_machine :state, initial: :off_shelved do
    event :shelve do
      transition :off_shelved => :shelved
    end

    event :off_shelve do
      transition :shelved => :off_shelved
    end
  end
end
