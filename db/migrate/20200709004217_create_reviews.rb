class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :doctor, foreign_key: true
      t.string :place_id
      t.string :author_name
      t.string :author_url
      t.string :profile_photo_url
      t.integer :rating
      t.string :relative_time_description
      t.string :text
      t.integer :time

      t.timestamps
    end
  end
end
