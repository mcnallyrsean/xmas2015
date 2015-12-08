class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.string :image
      t.string :url

      t.timestamps null: false
    end
  end
end
