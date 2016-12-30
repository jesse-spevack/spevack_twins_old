class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :image
      t.string :urls
      t.string :email
      t.string :token
      t.string :refresh_token
      t.datetime :expires_at
      t.boolean :expires
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
