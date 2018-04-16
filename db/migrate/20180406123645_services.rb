class Services < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :logo
      t.string :link

      t.timestamps null: false
    end
  end
end
