class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :place_id
      t.string :name
      t.string :photo
      t.string :formatted_address
      t.float :rating
      t.integer :user_ratings_total
      t.string :formatted_phone_number
      t.float :lat
      t.float :lng
      t.string :url
      t.string :website

      t.timestamps
    end
  end
end
