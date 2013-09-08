class GiftCertificate < ActiveRecord::Base
  default_scope order('created_at')

  attr_accessible :brand_id, :description, :name, :state, :listings_attributes, :avatar_attributes, :avatar


  has_many :images, as: :imageable, dependent: :destroy
  has_many :listings, as: :purchasable
  accepts_nested_attributes_for :listings, allow_destroy: true, reject_if: lambda {|a| a[:name].blank? }

  scope :shelved, where(state: 'shelved')

  has_one :avatar, as: :imageable, dependent: :destroy, class_name: "Image"
  accepts_nested_attributes_for :avatar, allow_destroy: true

  state_machine :state, initial: :off_shelved do
    event :shelve do
      transition :off_shelved => :shelved
    end

    event :off_shelve do
      transition :shelved => :off_shelved
    end
  end

  validates :listings, presence: true

  def avatar
    super || build_avatar
  end
end
