class CreatePublics < ActiveRecord::Migration[5.2]
  def change
    create_table :publics do |t|
      t.string :label

      t.timestamps
    end
  end
end
