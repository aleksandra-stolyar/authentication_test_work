class CreateRoleServices < ActiveRecord::Migration[5.0]
  def change
    create_table :role_services do |t|
      t.integer :role_id
      t.integer :service_id

      t.timestamps
    end
  end
end
