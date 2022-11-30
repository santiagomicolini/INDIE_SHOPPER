require 'faker'
require "open-uri"

User.destroy_all
Shop.destroy_all

# Create 50 users
50.times do
  file = URI.open("https://source.unsplash.com/random/?profile")
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    indie_coins: rand(2000)
  )
  user.photo.attach(io: file, filename: "#{user.name}.png", content_type: "image/png")
  user.save!
  puts "#{user.name} created!"
end

# Create 30 shops
30.times do
  file = URI.open("https://source.unsplash.com/random/?shop")
  shop = Shop.new(
    name: Faker::Company.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    website: Faker::Internet.url,
    user: User.all.sample,
    shop_category: ShopCategory.all.sample
  )
  shop.photo.attach(io: file, filename: "#{shop.name}.png", content_type: "image/png")
  shop.photo.attach(io: file, filename: "#{shop.name}.png", content_type: "image/png")
  shop.save!
  puts "#{shop.name} created!"
end

# Create 100 products
