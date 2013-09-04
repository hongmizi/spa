class GiftCertificate < ActiveRecord::Base
  default_scope order('created_at')

  attr_accessible :brand_id, :description, :name

  has_many :images, as: :imageable, dependent: :destroy
  has_many :listtings, as: :purchasable

  scope :shelved, where(state: 'shelved')

  state_machine :state, initial: :off_shelved do
    event :shelve do
      transition :off_shelved => :shelved
    end

    event :off_shelve do
      transition :shelved => :off_shelved
    end
  end
end
