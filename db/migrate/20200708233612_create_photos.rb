class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.references :doctor, foreign_key: true

      t.string :photo_reference
      t.string :slug

      t.timestamps
    end
  end
end
