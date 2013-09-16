class OptionType < ActiveRecord::Base
  attr_accessible :name, :purchasable_id, :purchasable_type, :option_values_attributes

  belongs_to :purchasable, polymorphic: true
  has_many :option_values
  accepts_nested_attributes_for :option_values, allow_destroy: true, reject_if: lambda {|a| a[:name].blank? }

  validates :name, presence: true
  validates_uniqueness_of :name, :scope => [:purchasable_id, :purchasable_type]
end
