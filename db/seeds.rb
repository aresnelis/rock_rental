# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'uri'

rocks_data = [
  { rock_type: "Igneous", daily_price: 19.99, description: "Rocks formed from solidified molten material.", photo_url: "https://res.cloudinary.com/di8qjnwgb/image/upload/v1698916025/1_r3s6ld.jpg"},
  { rock_type: "Metamorphic", daily_price: 24.99, description: "Rocks that have undergone a change in texture and composition.", photo_url: "https://res.cloudinary.com/di8qjnwgb/image/upload/v1698916026/2_syieut.jpg" },
  { rock_type: "Granite", daily_price: 29.99, description: "A common type of igneous rock with a speckled appearance.", photo_url: "https://res.cloudinary.com/di8qjnwgb/image/upload/v1698916026/3_vxdhlf.jpg" },
  { rock_type: "Limestone", daily_price: 12.99, description: "A sedimentary rock composed of calcium carbonate.", photo_url: "https://res.cloudinary.com/di8qjnwgb/image/upload/v1698916026/4_ytefxb.jpg" },
  { rock_type: "Schist", daily_price: 22.99, description: "A metamorphic rock with a foliated texture.", photo_url: "https://res.cloudinary.com/di8qjnwgb/image/upload/v1698916025/5_jihzng.jpg" },
  { rock_type: "Basalt", daily_price: 18.99, description: "An igneous rock commonly found in volcanic areas.", photo_url: "https://res.cloudinary.com/di8qjnwgb/image/upload/v1698916026/6_qxpm5z.webp" },
  { rock_type: "Sandstone", daily_price: 14.99, description: "A sedimentary rock made up of sand-sized grains.", photo_url: "https://res.cloudinary.com/di8qjnwgb/image/upload/v1698916025/7_fnt0wy.webp" },
  { rock_type: "Marble", daily_price: 26.99, description: "A metamorphic rock known for its use in sculptures and buildings.", photo_url: "https://res.cloudinary.com/di8qjnwgb/image/upload/v1698916025/8_gocmly.jpg" },
  { rock_type: "Quartzite", daily_price: 21.99, description: "A hard and durable metamorphic rock composed of quartz grains.", photo_url: "https://res.cloudinary.com/di8qjnwgb/image/upload/v1698916025/9_pdrncl.jpg" },
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

  url = rock_data[:photo_url]
  file = URI.open(url)
  rock.photo.attach(io: file, filename: 'testphoto', content_type: 'photo/jpg')
  rock.save
end

puts "Created #{Rock.count} rocks"

puts 'Creating Bookings'

users = User.all
2.times do
  users.each do |user|
    start_time = Faker::Time.between(from: DateTime.now - 5, to: DateTime.now + 5)
    end_time = Faker::Time.between(from: DateTime.now + 6, to: DateTime.now + 20)
    rock = Rock.all.sample.id
    booking = Booking.new(start_time: start_time, end_time: end_time, rock_id: rock, user_id: user.id)
    booking.save!
  end
end

puts "creating past booking, to add reviews"

5.times do
  users.each do |user|
    start_time = Faker::Time.between(from: DateTime.now + 5, to: DateTime.now + 5)
    end_time = Faker::Time.between(from: DateTime.now - 6, to: DateTime.now - 20)
    rock = Rock.all.sample.id
    booking = Booking.new(start_time: start_time, end_time: end_time, rock_id: rock, user_id: user.id)
    booking.save!
  end
end

puts "Created #{Booking.count} bookings"

puts 'Creating Reviews'

comments = [
  "This rock is a work of art!",
  "I love the texture of this rock.",
  "A perfect addition to my garden.",
  "The colors in this rock are amazing.",
  "I found this rock on a hike.",
  "This rock has a unique shape.",
  "Great for landscaping projects.",
  "I collect rocks, and this is a gem.",
  "Small but beautiful rock.",
  "A lovely addition to my rock collection.",
  "This rock is so smooth to touch.",
  "The patterns in this rock are fascinating.",
  "Perfect for a paperweight.",
  "A charming little rock.",
  "I'm starting a rock garden with it.",
  "A great piece of nature.",
  "I'm fascinated by this rock's color.",
  "I found this rock near a river.",
  "It's a lovely piece of history.",
  "This rock has a story to tell.",
  "Alex said it taste like cherry and vinegar!",
  "My preciousssssss...",
  "Please I am trap underneath, call 911...",
  "One rock to rule them all.",
  "Some said it was the ROCK OF DESTINY, but it just a tribute.",
  "Is it a plane? Is it a bird? Maybe superman? no it's a flying rock, take cover!!!"
]

bookings = Booking.all
  bookings.each do |booking|
    review = Review.create!(content: comments.sample, rating: rand(6), booking_id: booking.id) if booking.end_time < Time.now
end

puts "Created #{Review.count} reviews"

puts 'All Done'
