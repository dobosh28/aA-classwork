# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :image_url, :artist_id, presence: true, uniqueness: true
    validates :title, presence: true, uniqueness: {scope: :artist_id}

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User,
        inverse_of: :artworks

    has_many :artworks_share,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare,
        dependent: :destroy

    has_many :shared_viewers,
        through: :artworks_share,
        source: :viewer

    def self.artworks_for_user_id(user_id)
        viewed_art = self
            .select(:title, :artist_id, :viewer_id)
            .joins(:shared_viewers)
            .where("artwork_shares.viewer_id = (?)", user_id)

        user_art = self
            .select(:title, :artist_id)
            .where(artist_id: user_id)
        viewed_art.to_a + user_art.to_a
        
    end
    
        
end
