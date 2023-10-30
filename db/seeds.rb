# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

rocks_data = [
  { rock_type: "Igneous", daily_price: 19.99, description: "Rocks formed from solidified molten material.", user_id: "Faker::Number.between(1, 5)" },
  { rock_type: "Metamorphic", daily_price: 24.99, description: "Rocks that have undergone a change in texture and composition.", user_id: "Faker::Number.between(1, 5)" },
  { rock_type: "Granite", daily_price: 29.99, description: "A common type of igneous rock with a speckled appearance.", user_id: "Faker::Number.between(1, 5)" },
  { rock_type: "Limestone", daily_price: 12.99, description: "A sedimentary rock composed of calcium carbonate.", user_id: "Faker::Number.between(1, 5)" },
  { rock_type: "Schist", daily_price: 22.99, description: "A metamorphic rock with a foliated texture.", user_id: "Faker::Number.between(1, 5)" },
  { rock_type: "Basalt", daily_price: 18.99, description: "An igneous rock commonly found in volcanic areas.", user_id: "Faker::Number.between(1, 5)" },
  { rock_type: "Sandstone", daily_price: 14.99, description: "A sedimentary rock made up of sand-sized grains.", user_id: "Faker::Number.between(1, 5)" },
  { rock_type: "Marble", daily_price: 26.99, description: "A metamorphic rock known for its use in sculptures and buildings.", user_id: "Faker::Number.between(1, 5)" },
  { rock_type: "Quartzite", daily_price: 21.99, description: "A hard and durable metamorphic rock composed of quartz grains.", user_id: "Faker::Number.between(1, 5)" },
]

# bookings_data = [

# ]

# reviews_data = [

# ]

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
  rock = Rock.create(rock_type: rock_data[:rock_type], daily_price: rock_data[:daily_price], description: rock_data[:description], user_id: rock_data[:user_id])
end

puts "Created #{Rock.count} rocks"

puts 'Creating Bookings'

rocks = Rock.all
rocks.each do |rock|
  user_id = rock.user_id
  rock_id = rock.id
  start_time = Faker::Time.between(from: DateTime.now - 5, to: DateTime.now + 5)
  end_time = Faker::Time.between(from: DateTime.now + 6, to: DateTime.now + 20)
  booking = Booking.new(start_time: start_time, end_time: end_time, rock_id: rock_id)
  booking.rock = rock
  booking.user = user_id
  booking.save
end

puts "Created #{Booking.count} rocks"

puts 'All Done'
