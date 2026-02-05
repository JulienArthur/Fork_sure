class Artwork < ApplicationRecord
  include Accountable

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
