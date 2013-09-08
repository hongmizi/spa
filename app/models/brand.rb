class Brand < ActiveRecord::Base
  attr_accessible :description, :name, :avatar_attributes, :avatar

  has_one :avatar, as: :imageable, dependent: :destroy, class_name: "Image"
  accepts_nested_attributes_for :avatar, allow_destroy: true
  has_many :cosmetics

  def avatar
    super || build_avatar
  end

  validates :name, presence: true
end
