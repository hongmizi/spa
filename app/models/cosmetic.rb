class Cosmetic < ActiveRecord::Base
  default_scope order('created_at')

  attr_accessible :brand_id, :description, :name, :state, :listings_attributes, :avatar_attributes, :avatar

  has_many :images, as: :imageable, dependent: :destroy

  has_one :avatar, as: :imageable, dependent: :destroy, class_name: "Image"
  accepts_nested_attributes_for :avatar, allow_destroy: true

  has_many :listings, as: :purchasable
  accepts_nested_attributes_for :listings, allow_destroy: true, reject_if: lambda {|a| a[:name].blank? }
  belongs_to :brand
  has_many :option_types, as: :purchasable
  accepts_nested_attributes_for :option_types, allow_destroy: true, reject_if: lambda {|a| a[:name].blank? }

  scope :shelved, where(state: 'shelved')

  state_machine :state, initial: :off_shelved do
    event :shelve do
      transition :off_shelved => :shelved
    end

    event :off_shelve do
      transition :shelved => :off_shelved
    end
  end

  def avatar
    super || build_avatar
  end


  validates :listings, presence: true
end
