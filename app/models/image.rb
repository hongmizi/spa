class Image < ActiveRecord::Base
  attr_accessible :imageable_id, :imageable_type, :image

  belongs_to :imageable, polymorphic: true

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
