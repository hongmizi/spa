class OptionValue < ActiveRecord::Base
  attr_accessible :name, :option_type_id
  belongs_to :option_type

  validates :name, presence: true
  validates_uniqueness_of :name, :scope => [:option_type_id]
end
