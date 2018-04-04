class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :encrypted_password
      t.string :authentication_token
      t.string :role
      t.string :full_name
      t.string :avatar
      t.string :position

      t.timestamps null: false

      t.index :authentication_token, unique: true
    end
  end
end
