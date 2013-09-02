class Order < ActiveRecord::Base
  attr_accessible :address, :name

  default_scope order('created_at')

  state_machine :state, initail: :pending do
    event :deliver do
      transaction pending: :delivered
    end

    event :close do
      transaction pending: :closed
    end
  end

  has_many :line_items
  belongs_to :user
end
