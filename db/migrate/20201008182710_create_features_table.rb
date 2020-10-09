class CreateFeaturesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.string :song
      t.string :artist1
      t.string :artist2
      t.integer :user_id
    end
  end
end
