class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.integer :artist_id
      t.string :youtube

      t.timestamps
    end
    add_index :videos, :artist_id
  end
end
