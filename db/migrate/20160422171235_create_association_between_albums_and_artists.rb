class CreateAssociationBetweenAlbumsAndArtists < ActiveRecord::Migration
  def change
    add_column :albums, :artist_id, :integer
    remove_column :albums, :artist
  end
end
