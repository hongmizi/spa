class OptionType < ActiveRecord::Base
  attr_accessible :name, :purchasable_id, :purchasable_type

  belongs_to :purchasable, polymorphic: true
  has_many :opton_values
  accepts_nested_attributes_for :option_values, allow_destroy: true, reject_if: lambda {|a| a[:name].blank? }

  validates :name, presence: true
end
