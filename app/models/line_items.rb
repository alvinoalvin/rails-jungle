class LineItem < ActiveRecord::Base
  belongs_to :orders
  belongs_to :product

  monetize :item_price_cents, numericality: true
  monetize :total_price_cents, numericality: true

  validates :order_id, presence: true
  validates :product_id, presence: true
  validates :quantity, presence: true
  validates :item_price_cents, presence: true
  validates :total_price_cents, presence: true

end
