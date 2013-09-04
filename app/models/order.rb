class Order < ActiveRecord::Base
  attr_accessible :address, :name

  default_scope order('created_at')

  state_machine :state, initial: :pending do
    event :deliver do
      transition pending: :delivered
    end

    event :close do
      transition pending: :closed
    end
  end

  has_many :line_items
  belongs_to :user
  validates :line_items, presence: true

  def total
    line_item.inject(0) do | res, i|
      res + i.quantity * i.price
    end
  end
end
