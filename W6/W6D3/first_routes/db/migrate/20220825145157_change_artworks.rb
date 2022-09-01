class ChangeArtworks < ActiveRecord::Migration[7.0]
  def change
    remove_column :artworks, :artist_id
    add_reference :artworks, :artist, foreign_key: {to_table: :users}
  end
end
