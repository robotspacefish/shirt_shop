class Shirt < ApplicationRecord
  belongs_to :shop

  def price
    self.price_in_cents / 100
  end
end
