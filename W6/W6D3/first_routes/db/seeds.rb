# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


ActiveRecord::Base.transaction do

    puts "Preparing #{Rails.env} environment"

    puts "Destroying tables..."
    ArtworkShare.destroy_all
    Artwork.destroy_all
    User.destroy_all

    puts "Resetting ID sequences..."

    %w(users artworks artwork_shares).each do |table_name|
        ApplicationRecord.connection.reset_pk_sequence!(table_name)
    end

    puts "Creating seed data..."

    dan = User.create(
        username: 'dantheman'
    )

    yosyp = User.create(
        username: 'globosh'
    )

    ronny = User.create(
        username: 'sir_ronny'
    )

    sheila = User.create(
        username: 'smellysheila'
    )

    art1 = Artwork.create(
        title: 'Mona Lisa',
        image_url: '9q384hg9q34hg9qh',
        artist_id: dan.id
    )

    art2 = Artwork.create(
        title: 'American Gothic',
        image_url: 'oibhvosfagi',
        artist_id: yosyp.id
    )

    art3 = Artwork.create(
        title: 'House On The Hill',
        image_url: 'hy9gh090h90hg90hg',
        artist_id: ronny.id
    )

    art4 = Artwork.create(
        title: 'Untitled',
        image_url: 'myartsucksssssss',
        artist_id: sheila.id
    )

    art_share1 = ArtworkShare.create(
        artwork_id: art1.id,
        viewer_id: yosyp.id
    )

    art_share2 = ArtworkShare.create(
        artwork_id: art4.id,
        viewer_id: ronny.id
    )

    puts "Done with #{Rails.env} environment!"
end
