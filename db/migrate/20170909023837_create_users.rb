class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :facebook_uid, limit: 8
      t.string :image_location


      t.timestamps
    end
  end
end
