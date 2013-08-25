class CreateOccasionsArtists < ActiveRecord::Migration
  def change
    create_table :occasions_artists, id: false do |t|
      t.references :artist
      t.references :occasion
    end
    add_index :occasions_artists, :artist_id
    add_index :occasions_artists, :occasion_id
  end
end
