# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks,
        foreign_key: :artist_id,
        class_name: :Artwork,
        inverse_of: :artist,
        dependent: :destroy

    has_many :shared_artworks,
        through: :artworks_share,
        source: :artwork

    has_many :artworks_share,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare,
        dependent: :destroy,
        inverse_of: :artworks
end
