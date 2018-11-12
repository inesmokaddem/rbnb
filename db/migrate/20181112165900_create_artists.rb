class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :description
      t.string :address
      t.integer :hour_rate
      t.references :category, foreign_key: true
      t.references :public, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
