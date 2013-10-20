class Order < ActiveRecord::Base
  attr_accessible :address, :name

  default_scope order('created_at')

  state_machine :state, initial: :pending do
    event :pay do
      transition pending: :paid
    end
    event :deliver do
      transition paid: :delivered
    end

    event :close do
      transition pending: :closed
    end
  end

  has_many :line_items
  belongs_to :user
  validates :line_items, :name, :address, presence: true

  def total
    line_items.inject(0) do | res, i|
      res + i.quantity * i.price
    end
  end
end
