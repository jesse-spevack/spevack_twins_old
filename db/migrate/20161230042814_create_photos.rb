class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :caption
      t.date :date

      t.timestamps
    end
  end
end
