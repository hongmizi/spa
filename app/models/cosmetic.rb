class Cosmetic < ActiveRecord::Base
  default_scope order('created_at')

  attr_accessible :brand_id, :description, :name, :state, :listings_attributes

  has_many :images, as: :imageable, dependent: :destroy
  has_many :listings, as: :purchasable
  belongs_to :brand
  accepts_nested_attributes_for :listings, allow_destroy: true, reject_if: lambda {|a| a[:name].blank? }

  scope :shelved, where(state: 'shelved')

  state_machine :state, initial: :off_shelved do
    event :shelve do
      transition :off_shelved => :shelved
    end

    event :off_shelve do
      transition :shelved => :off_shelved
    end
  end

  validates :listings, presence: true
end
