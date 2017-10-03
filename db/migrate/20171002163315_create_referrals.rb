class CreateReferrals < ActiveRecord::Migration[5.1]
  def change
    create_table :referrals do |t|
      t.integer :business_id
      t.integer :referrer_id
      t.integer :referred_id

      t.timestamps
    end
  end
end
