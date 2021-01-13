class Shirt < ApplicationRecord
  validates :name, :description, :price, :color, :size, presence: true

  belongs_to :shop

  def price
    self.price_in_cents / 100
  end
end
