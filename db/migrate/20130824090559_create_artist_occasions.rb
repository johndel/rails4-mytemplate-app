class CreateArtistOccasions < ActiveRecord::Migration
  def change
    create_table :artist_occasions do |t|
      t.integer :artist_id
      t.integer :occasion_id

      t.timestamps
    end
    add_index :artist_occasions, :artist_id
    add_index :artist_occasions, :occasion_id
  end
end
