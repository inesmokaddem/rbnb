class AddAvatarToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :avatar, :string
  end
end
