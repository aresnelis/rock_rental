# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
rocks_data = [
```{ rock_type: "Igneous", daily_price: 19.99, description: "Rocks formed from solidified molten material." },
  { rock_type: "Metamorphic", daily_price: 24.99, description: "Rocks that have undergone a change in texture and composition."},
  { rock_type: "Granite", daily_price: 29.99, description: "A common type of igneous rock with a speckled appearance." },
  { rock_type: "Limestone", daily_price: 12.99, description: "A sedimentary rock composed of calcium carbonate." },
  { rock_type: "Schist", daily_price: 22.99, description: "A metamorphic rock with a foliated texture." },
  { rock_type: "Basalt", daily_price: 18.99, description: "An igneous rock commonly found in volcanic areas." },
  { rock_type: "Sandstone", daily_price: 14.99, description: "A sedimentary rock made up of sand-sized grains." },
  { rock_type: "Marble", daily_price: 26.99, description: "A metamorphic rock known for its use in sculptures and buildings." },
  { rock_type: "Quartzite", daily_price: 21.99, description: "A hard and durable metamorphic rock composed of quartz grains." },
]
  { type: "Sedimentary", daily_price: 15.99, description: "A common rock type formed by the accumulation of sediments." },
  { type: "Igneous", daily_price: 19.99, description: "Rocks formed from solidified molten material." },
  { type: "Metamorphic", daily_price: 24.99, description: "Rocks that have undergone a change in texture and composition."},
  { type: "Granite", daily_price: 29.99, description: "A common type of igneous rock with a speckled appearance." },
  { type: "Limestone", daily_price: 12.99, description: "A sedimentary rock composed of calcium carbonate." },
  { type: "Schist", daily_price: 22.99, description: "A metamorphic rock with a foliated texture." },
  { type: "Basalt", daily_price: 18.99, description: "An igneous rock commonly found in volcanic areas." },
  { type: "Sandstone", daily_price: 14.99, description: "A sedimentary rock made up of sand-sized grains." },
  { type: "Marble", daily_price: 26.99, description: "A metamorphic rock known for its use in sculptures and buildings." },
  { type: "Quartzite", daily_price: 21.99, description: "A hard and durable metamorphic rock composed of quartz grains." },
]

puts 'Cleaning database'
Rock.destroy_all
rocks_data.each do |rock_data|
  puts rock_data[:type]
  Rock.create!(rock_type: rock_data[:type], daily_price: rock_data[:daily_price], description: rock_data[:description], user_id: 1)
end

puts "Finished"
