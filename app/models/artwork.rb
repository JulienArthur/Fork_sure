class Artwork < ApplicationRecord
  include Accountable

  monetize :acquisition_price_cents, allow_nil: true
  has_one_attached :image

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
