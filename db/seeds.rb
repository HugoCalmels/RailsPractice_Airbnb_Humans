# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Reservation.destroy_all
Listing.destroy_all
User.destroy_all
City.destroy_all

def random_phone_number
  prefix = "0" + rand(1..5).to_s
  suffix = ""
  8.times do
    suffix += rand(0..10).to_s
  end
  result = prefix + suffix
  return result
end

20.times do 
  u = User.new(
    email: Faker::Internet.email,
    phone_number: random_phone_number,
    description: Faker::Lorem.paragraph_by_chars(number: 72, supplemental: false)
  )
  u.save
  u.errors.messages
end

20.times do 
  c = City.new(
    name: Faker::WorldCup.city,
    zip_code: rand(10000..99999)
  )
  c.save 
  c.errors.messages
end

20.times do 
  sample = User.all.sample
  l = Listing.new(
    available_beds: rand(1..10),
    price: rand(50..1000),
    description: Faker::Lorem.paragraph_by_chars(number: 160, supplemental: false),
    has_wifi: Faker::Boolean.boolean,
    welcome_message: Faker::ChuckNorris.fact,
    user: sample,
    admin: sample,
    city: City.all.sample
  )
  l.errors.messages
  l.save
end

20.times do 
  sample = User.all.sample
  r = Reservation.new(
    start_date: Time.now + rand(1000..5000),
    end_date: Time.now + rand(6000..70000),
    user: sample,
    guest: sample,
    listing: Listing.all.sample
  )
  r.errors.messages
  r.save
end



puts "%" * 20 
puts "%% Database filled! %%"
