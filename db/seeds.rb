# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'clearing database'
Review.destroy_all
Wishlist.destroy_all
Gallery.destroy_all
Visit.destroy_all
Viewer.destroy_all
Art.destroy_all
puts 'database cleared'

puts 'creating viewer'
v1 = Viewer.create!(first_name: 'Sam', last_name: 'Robinson', password: '1234Test_', email: 'sam@sam.com', zip_code: '60608')
v2 = Viewer.create!(first_name: 'Tom', last_name: 'Robinson', password: '1234Test_', email: 'tom@tom.com', zip_code: '45356')
v3 = Viewer.create!(first_name: 'Weeb', last_name: 'Robinson', password: '1234Test_', email: 'weeb@weeb.com', zip_code: '60657')
v4 = Viewer.create!(first_name: 'Rem', last_name: 'Robinson', password: '1234Test_', email: 'rem@rem.com', zip_code: '60651')
v5 = Viewer.create!(first_name: 'Zeke', last_name: 'Robinson', password: '1234Test_', email: 'zeke@zeke.com', zip_code: '60647')
puts 'viewers seeded'

puts 'seed arts'
a1 = Art.create!(title: 'Monday')
a2 = Art.create!(title: 'Tuesday')
a3 = Art.create!(title: 'Wednesday')
puts 'arts seeded'

puts 'visits'
visit1 = Visit.create!(viewer_id: v1.id, date: '12/12/2014', art_id: a1.id)
visit2 = Visit.create!(viewer_id: v2.id, date: '12/13/1888', art_id: a2.id)
visit3 = Visit.create!(viewer_id: v3.id, date: '1/4/2022', art_id: a3.id)
puts 'visits seeded'

puts 'seed reviews'
r1 = Review.create!(content: 'eh', viewer: Viewer.first, art: Art.first, visit: Visit.first, rating: 3)
r2 = Review.create!(content: 'great', viewer: Viewer.third, art: Art.second, visit: Visit.second, rating: 2)
r3 = Review.create!(content: 'eh', viewer: Viewer.last, art: Art.third, visit: Visit.last, rating: 5)
r4 = Review.create!(content: 'eh', viewer: Viewer.second, art: Art.second, visit: Visit.third, rating: 2)
puts 'reviews seeded'

puts 'seed wishlist'
w1 = Wishlist.create!(viewer: Viewer.first, art: Art.first)
w2 = Wishlist.create!(viewer: Viewer.second, art: Art.second)
w3 = Wishlist.create!(viewer: Viewer.third, art: Art.third)
puts 'seeded wishlist'

puts 'seed gallery'
g1 = Gallery.create!(name: 'Modern')
g2 = Gallery.create!(name: 'Ancient')
g3 = Gallery.create!(name: 'Postwar')
puts 'gallery seeded'
