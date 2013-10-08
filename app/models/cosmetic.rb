class Cosmetic < ActiveRecord::Base
  default_scope order('created_at')

  attr_accessible :brand_id, :description, :name, :state, :listings_attributes, :avatar_attributes, :avatar, :option_types_attributes

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

  def update_listings
    create_listing 0, option_types.count
  end


  after_save :update_listings

  private
  def create_listing m, n
    if n <= 0
      return
    elsif m >= n
      option_values = @data.inject({}) do |res, i|
        res.merge i
      end

      option_values = option_values.map do | k, v |
        v
      end

      if !exist_listing?(option_values)
        listing = listings.create price: 0, stock: 0
        option_values.each do |value|
          listing.option_values << value
        end
      end

      @data = []
      return;
    else
      @data = []
      sum = option_types[m].option_values.count
      for i in m...sum
        @data << { option_types[m] =>  option_types[m].option_values[i] }
        create_listing(m + 1, n)
      end
    end
  end

  def exist_listing? option_values
    return false if listings.blank?
    listings.each do |listing|
      option_values.each do |value|
        if !listing.option_values.include? value
          return false
        end
      end
    end
    return true
  end
end
