class FixArtworkAcquisitionPriceType < ActiveRecord::Migration[7.2]
  def change
    rename_column :artworks, :acquisition_price_cents, :acquisition_price
    change_column :artworks, :acquisition_price, :decimal, precision: 19, scale: 4
  end
end
