class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      #Devise fields
      t.string   :email,              :null => false, :default => ""
      t.string   :encrypted_password, :null => false, :default => ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      #Custom fields
      t.string   :username
      t.string   :address
      t.string   :city
      t.integer  :country_id
      t.string   :zip
      t.string   :telephone
      t.string   :mobile_phone

      #Polymorphic association fields
      t.integer  :profile_id
      t.string   :profile_type

      #CanCan field
      t.integer  :role_id

      t.timestamps
    end

    add_index :users, :email,                       :unique => true
    add_index :users, :reset_password_token,        :unique => true
    add_index :users, :confirmation_token,          :unique => true
    add_index :users, [:profile_id, :profile_type], :unique => true
    add_index :users, :role_id
    add_index :users, :country_id
  end
end
