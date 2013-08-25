class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :contact_person
      t.string :name
      t.string :business_type_id
      t.string :website

      t.timestamps
    end

    add_index :businesses, :business_type_id
  end
end
