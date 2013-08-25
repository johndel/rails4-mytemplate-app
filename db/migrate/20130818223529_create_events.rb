class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :place
      t.text :comments
      t.date :date
      t.time :time
      t.integer :business_id
      t.integer :artist_id

      t.timestamps
    end
    add_index :events, :business_id
    add_index :events, :artist_id
  end
end
