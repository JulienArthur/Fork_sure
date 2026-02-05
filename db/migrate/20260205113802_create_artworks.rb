class CreateArtworks < ActiveRecord::Migration[7.2]
  def change
    create_table :artworks, id: :uuid do |t|
      t.timestamps
    end
  end
end
