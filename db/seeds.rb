# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

rocks_data = [
  { rock_type: "Igneous", daily_price: 19.99, description: "Rocks formed from solidified molten material." },
  { rock_type: "Metamorphic", daily_price: 24.99, description: "Rocks that have undergone a change in texture and composition." },
  { rock_type: "Granite", daily_price: 29.99, description: "A common type of igneous rock with a speckled appearance." },
  { rock_type: "Limestone", daily_price: 12.99, description: "A sedimentary rock composed of calcium carbonate." },
  { rock_type: "Schist", daily_price: 22.99, description: "A metamorphic rock with a foliated texture." },
  { rock_type: "Basalt", daily_price: 18.99, description: "An igneous rock commonly found in volcanic areas." },
  { rock_type: "Sandstone", daily_price: 14.99, description: "A sedimentary rock made up of sand-sized grains." },
  { rock_type: "Marble", daily_price: 26.99, description: "A metamorphic rock known for its use in sculptures and buildings." },
  { rock_type: "Quartzite", daily_price: 21.99, description: "A hard and durable metamorphic rock composed of quartz grains." },
]

puts 'Cleaning database'

User.destroy_all
Rock.destroy_all
Booking.destroy_all
Review.destroy_all

puts 'Creating Users'

5.times do
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 'qwerty123', host: Faker::Boolean.boolean(true_ratio: 0.2))
end

puts "Created #{User.count} users"

puts 'Creating Rocks'

rocks_data.each do |rock_data|
  userid = User.all.sample
  rock = Rock.new(rock_type: rock_data[:rock_type], daily_price: rock_data[:daily_price], description: rock_data[:description])
  rock.user = userid
  rock.save
end

puts "Created #{Rock.count} rocks"

puts 'Creating Bookings'

users = User.all
5.times do
  users.each do |user|
    start_time = Faker::Time.between(from: DateTime.now - 5, to: DateTime.now + 5)
    end_time = Faker::Time.between(from: DateTime.now + 6, to: DateTime.now + 20)
    rock = Rock.all.sample.id
    booking = Booking.new(start_time: start_time, end_time: end_time, rock_id: rock, user_id: user.id)
    booking.save!
  end
end

puts "Created #{Booking.count} bookings"

puts 'Creating Reviews'

# TODO Reviews Seeds

puts "Created #{Review.count} reviews"

puts 'All Done'
