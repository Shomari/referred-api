class CreateRecommendations < ActiveRecord::Migration[5.1]
  def change
    create_table :recommendations do |t|
      t.belongs_to :user
      t.belongs_to :business
      t.text :text

      t.timestamps
    end
  end
end
