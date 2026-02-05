class ArtworksController < ApplicationController
  include AccountableResource

  permitted_accountable_attributes(
    :author, :acquisition_price, :acquisition_source, :image
  )
end
