class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :listings, through: :line_items
  belongs_to :user
  scope :shopping, where(state: :shopping)

  state_machine :state, initial: :shopping do
    event :checkout do
      transition :shopping => :completed
    end
  end
end
