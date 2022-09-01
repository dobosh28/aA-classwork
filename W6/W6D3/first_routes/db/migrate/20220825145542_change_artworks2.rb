class ChangeArtworks2 < ActiveRecord::Migration[7.0]
  def change
    remove_column :artworks, :artist_id
    add_reference :artworks, :artist, foreign_key: {to_table: :users}
    add_index :artworks, [:artist_id, :title], unique: true
  end
end
