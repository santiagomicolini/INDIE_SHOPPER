require 'faker'
require "open-uri"

User.destroy_all
ShopCategory.destroy_all
Shop.destroy_all
ProductCategory.destroy_all
Product.destroy_all
Review.destroy_all

# Create 50 users
20.times do
  file = URI.open("https://source.unsplash.com/random/?face")
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456",
    indie_coins: rand(2000)
  )
  user.photo.attach(io: file, filename: "#{user.first_name}.png", content_type: "image/png")
  user.save!
  puts "#{user.first_name} created!"
end

# Create 30 shop categories
15.times do
  shop_category = ShopCategory.new(
    shop_category_name: Faker::Commerce.department
  )
  shop_category.save!
  puts "#{shop_category.shop_category_name} created!"
end

# Create 30 shops
30.times do
  shop = Shop.new(
    name: Faker::Company.name,
    address: Faker::Address.state,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    website: Faker::Internet.url,
    user: User.all.sample,
    shop_category: ShopCategory.all.sample
  )
  shop.save!
  shop.photos.attach(io: URI.open("https://source.unsplash.com/random/?shop"), filename: "#{shop.name}.png", content_type: "image/png")
  shop.photos.attach(io: URI.open("https://source.unsplash.com/random/?shop"), filename: "#{shop.name}.png", content_type: "image/png")
  puts "#{shop.name} created!"
end

# Create 100 product categories
100.times do
  product_category = ProductCategory.new(
    product_category_name: Faker::Commerce.material
  )
  product_category.save!
  puts "#{product_category.product_category_name} created!"
end

# Create 60 products
60.times do
  product = Product.new(
    name: Faker::Commerce.product_name,
    price: rand(1..500),
    info: Faker::Lorem.paragraph,
    shop: Shop.all.sample,
    product_category: ProductCategory.all.sample
  )
  arr = product.name.split(" ")
  product.photos.attach(io: URI.open("https://source.unsplash.com/random/?#{arr[2]}"), filename: "#{product.name}.png", content_type: "image/png")
  product.photos.attach(io: URI.open("https://source.unsplash.com/random/?#{arr[2]}"), filename: "#{product.name}.png", content_type: "image/png")
  product.save!
  puts "#{product.name} created!"
end

# Create 100 reviews
100.times do
  review = Review.new(
    rating: rand(1..5),
    content: Faker::Lorem.paragraph,
    user: User.all.sample,
    shop: Shop.all.sample
  )
  review.save!
  puts "#{review.content} created!"
end
