class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :real_name
      t.string :nickname
      t.date :birth_date
      t.text :biography
      # t.boolean :contract_signed
      t.integer :country_id
      t.text :studies
      t.integer :act_id

      t.timestamps
    end

    add_index :artists, :act_id
    add_index :artists, :country_id  
  end
end
