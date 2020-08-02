class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :doctor, foreign_key: true

      t.string :api_id
      t.timestamps
    end
  end
end
