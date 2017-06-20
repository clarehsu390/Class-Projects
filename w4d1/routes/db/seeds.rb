# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
user1 = User.create(username: 'Graham')
user2 = User.create(username: 'Clare')

Artwork.destroy_all
art1 = Artwork.create(title: 'Masterpice', image_url: 'a.com', artist_id: user1.id)
art2 = Artwork.create(title: 'Dogs playing poker', image_url: 'gif.com', artist_id: user2.id)

s1 = ArtworkShare.create(artwork_id: art1.id, viewer_id: user1.id)
s2 = ArtworkShare.create(artwork_id: art1.id, viewer_id: user2.id)
