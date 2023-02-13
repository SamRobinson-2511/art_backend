# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'clearing database'

Visit.destroy_all
Viewer.destroy_all
Art.destroy_all

puts 'database cleared'

puts 'creating viewer'
v1 = Viewer.create!(first_name:'Sam', last_name:'Robinson', password:'1234Test_', email: 'sam@sam.com', zip_code: '60608')
v2 = Viewer.create!(first_name:'Tom', last_name:'Robinson', password:'1234Test_', email: 'tom@tom.com', zip_code: '45356')
v3 = Viewer.create!(first_name:'Weeb', last_name:'Robinson', password:'1234Test_', email: 'weeb@weeb.com', zip_code: '60657')
v4 = Viewer.create!(first_name:'Rem', last_name:'Robinson', password:'1234Test_', email: 'rem@rem.com', zip_code: '60651')
v5 = Viewer.create!(first_name:'Zeke', last_name:'Robinson', password:'1234Test_', email: 'zeke@zeke.com', zip_code: '60647')
puts 'viewers seeded'

puts 'seed arts'
a1 = Art.create!(title: 'Monday')
a2 = Art.create!(title: 'Tuesday')
a3 = Art.create!(title: 'Wednesday')
puts 'arts seeded'


puts 'visits'
visit1 = Visit.create!(viewer_id: v1.id, date: '12/12/2014')
visit2 = Visit.create!(viewer_id: v2.id, date: '12/13/1888')
visit3 = Visit.create!(viewer_id: v3.id, date: '1/4/2022')

puts 'visits seeded'

