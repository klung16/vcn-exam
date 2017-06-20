class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :message

      t.timestamps
    end
  end
end
