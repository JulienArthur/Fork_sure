class Artwork < ApplicationRecord
  include Accountable, Monetizable

  monetize :acquisition_price
  has_one_attached :image

  def monetizable_currency
    acquisition_price_currency
  end

  class << self
    def color
      "#9B59B6"
    end

    def icon
      "palette"
    end

    def classification
      "asset"
    end
  end
end
