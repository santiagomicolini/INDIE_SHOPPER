require 'faker'
require "open-uri"

User.destroy_all
ShopCategory.destroy_all
Shop.destroy_all
ProductCategory.destroy_all
Product.destroy_all
Review.destroy_all

# Create 50 users
5.times do
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


["Hats", "Hat", "Pants", "Shorts", "Tees", "Books", "Print", "Jumper", "Socks", "Shirt", "Plants"].each do |cat|
  ProductCategory.create(product_category_name: cat)
end

["Clothing", "Footwear", "Furniture", "Household", "Plants", "Decoration", "Jewelry", "Wineries", "Kitchen"].each do |shop|
  ShopCategory.create(shop_category_name: shop)
end

   laser = Shop.new(
    name: "LASER BARCELONA - EST.2010",
    address: "Carrer del Dr. Dou, 2, 08001 Barcelona",
    phone_number: "931059743",
    about: "I'm Justo Heras, Laser's creative director, a Barcelona brand founded in 2010. Our biggest motivation since the first day was being able to express our own idea of Barcelona and what it represents to us. We try to convey with each collection all these local concepts that may seem invisible to any citizen. Our philosophy takes care of every detail, doing the designs myself, screen-printing and distributing them. That way we keep the production as local as possible, with an independent distribution, and working without intermediaries to get anywhere in the world the best way we can.",
    website: "https://laser-bcn.com",
    user: User.all.sample,
    shop_category: ShopCategory.find_by(shop_category_name: "Clothing"),
  )
  laser.save!
  laser.photos.attach(io: URI.open("https://cdn.shopify.com/s/files/1/0449/4613/files/1_ebf27928-38a2-4615-afb9-e78396958702_1024x1024.JPG?v=1552569208"), filename: "#{laser.name}.jpg", content_type: "image/jpeg")
  laser.photos.attach(io: URI.open("https://cdn.shopify.com/s/files/1/0449/4613/files/5_064da9be-c43a-48f5-9a11-f175a1e46095_grande.JPG?v=1552569309"), filename: "#{laser.name}.jpg", content_type: "image/jpeg")
  puts "#{laser.name} created!"

   laser_hat = Product.new(
    name: "BARCELONETA PACKABLE 5 PANEL HAT OFF-CUTS",
    price: 49.00,
    info: "Inspired by the sea and the roots of sailor men who use to live in Barceloneta, the beach neighborhood of Barcelona. Made with British Millerain waxed cotton. Introducing our off-cuts program. This hat is made with fabric leftovers of other Barceloneta hats, extremely limited.",
    shop: laser,
    product_category: ProductCategory.find_by(product_category_name: "Hats")
  )
  arr = laser_hat.name.split(" ")
  laser_hat.photos.attach(io: URI.open("https://cdn.shopify.com/s/files/1/0449/4613/products/Barcelonetahat22multifront_1512x.jpg?v=1651158100#{arr[2]}"), filename: "#{laser_hat.name}.jpg", content_type: "image/jpeg")
  laser_hat.photos.attach(io: URI.open("https://cdn.shopify.com/s/files/1/0449/4613/products/Barcelonetahat22multimosaico_900x.jpg?v=1651739541#{arr[2]}"), filename: "#{laser_hat.name}.jpg", content_type: "image/jpeg")
  laser_hat.save!
  puts "#{laser_hat.name} created!"

  laser_print = Product.new(
    name: "LASER RAWAL ARTIST SERIES X AKACORLEONE PRINT",
    price: 80.00,
    info: "Original limited edition of 55 units, signed and numbered. 5 color screenprint by Barba Silkscreen Atelier in Valencia. 50x70 cm - 240gr Munken Pure paper",
    shop: laser,
    product_category: ProductCategory.find_by(product_category_name: "Print")
  )
  arr = laser_print.name.split(" ")
  laser_print.photos.attach(io: URI.open("https://cdn.shopify.com/s/files/1/0449/4613/products/IMG_7857_900x.jpg?v=1657114697#{arr[2]}"), filename: "#{laser_print.name}.jpg", content_type: "image/jpeg")
  laser_print.photos.attach(io: URI.open("https://cdn.shopify.com/s/files/1/0449/4613/products/IMG_7846_900x.jpg?v=1657114688#{arr[2]}"), filename: "#{laser_print.name}.jpg", content_type: "image/jpeg")
  laser_print.save!
  puts "#{laser_print.name} created!"

  laser_tee = Product.new(
    name: "RAWAL ARTIST SERIES X CRISTINA DAURA TEE PASTEL YELLOW",
    price: 49.00,
    info: "Rawal Artist Series is a project who invites artists not only from Barcelona but also from everywhere to represent the neighborhood where we opened our Flagship Store, where lots of different cultures are represented, making it one of the most charismatic neighborhoods of the city center.",
    shop: laser,
    product_category: ProductCategory.find_by(product_category_name: "Tees")
  )
  arr = laser_tee.name.split(" ")
  laser_tee.photos.attach(io: URI.open("https://cdn.shopify.com/s/files/1/0449/4613/products/cd_tee_pastel_yellow_back_da4cead4-63bd-4962-b311-4fef7661f240_1512x.jpg?v=1660229748#{arr[2]}"), filename: "#{laser_tee.name}.jpg", content_type: "image/jpeg")
  laser_tee.photos.attach(io: URI.open("https://cdn.shopify.com/s/files/1/0449/4613/products/cd_tee_pastel_yellow_front_bf165400-fec3-42a6-a44f-52579946f43c_1296x.jpg?v=1660229748#{arr[2]}"), filename: "#{laser_tee.name}.jpg", content_type: "image/jpeg")
  laser_tee.save!
  puts "#{laser_tee.name} created!"

  laser_socks = Product.new(
    name: "DOCTOR DOU SOCKS BLACK",
    price: 15.00,
    info: "Socks designed for daily use",
    shop: laser,
    product_category: ProductCategory.find_by(product_category_name: "Socks")
  )
  arr = laser_socks.name.split(" ")
  laser_socks.photos.attach(io: URI.open("https://cdn.shopify.com/s/files/1/0449/4613/products/socks.dou.black.last_1512x.jpg?v=1640783335#{arr[2]}"), filename: "#{laser_socks.name}.jpg", content_type: "image/jpeg")
  laser_socks.photos.attach(io: URI.open("https://cdn.shopify.com/s/files/1/0449/4613/products/mosaic.socks.dou.blk_900x.jpg?v=1640783335#{arr[2]}"), filename: "#{laser_socks.name}.jpg", content_type: "image/jpeg")
  laser_socks.save!
  puts "#{laser_socks.name} created!"

  twothirds = Shop.new(
    name: "TWOTHIRDS BCN",
    address: "Av. del Tibidabo, 49, 08035 Barcelona",
    phone_number: "934125371",
    about: "Founded in 2010 out of a deep love for the ocean, our brand has evolved into a community of like-minded people. Together, we want to create clothing with zero impact on the planet and its oceans. We use fabrics that save water, turn plastic waste into quality garments and wrap orders in paper packaging. Our products are all Climate Neutral.",
    website: "https://twothirds.com/",
    user: User.all.sample,
    shop_category: ShopCategory.find_by(shop_category_name: "Clothing")
  )
  twothirds.save!
  twothirds.photos.attach(io: URI.open("https://cdn.shopify.com/s/files/1/0995/5544/files/twothirds-mix-1_1920x.jpg"), filename: "#{twothirds.name}.jpg", content_type: "image/jpeg")
  twothirds.photos.attach(io: URI.open("https://cdn.shopify.com/s/files/1/0995/5544/files/twothirds-mix-1_1920x.jpg"), filename: "#{twothirds.name}.jpg", content_type: "image/jpeg")
  puts "#{twothirds.name} created!"

  twothirds_blue = Product.new(
    name: "FYN - BLUE",
    price: 109.60,
    info: "With its classic panel design and gentle colour palette, the Fyn always blends into its natural surroundings. Why not pair it with one of our equally eco-friendly long coats? A fairly loose fit that falls around the hips, the Fyn also has ribbed edges.",
    shop: twothirds,
    product_category: ProductCategory.find_by(product_category_name: "Jumper")
  )
  arr = twothirds_blue.name.split(" ")
  twothirds_blue.photos.attach(io: URI.open("https://cdn.shopify.com/s/files/1/0995/5544/products/2_e6584992-6f73-4150-babc-8728839b4fe6_400x.jpg?v=1666080832#{arr[2]}"), filename: "#{twothirds_blue.name}.jpg", content_type: "image/jpeg")
  twothirds_blue.photos.attach(io: URI.open("https://cdn.shopify.com/s/files/1/0995/5544/products/4_61b9e234-05f4-4b52-a32a-c7275e54086f_800x.jpg?v=1666080839#{arr[2]}"), filename: "#{twothirds_blue.name}.jpg", content_type: "image/jpeg")
  twothirds_blue.save!
  puts "#{twothirds_blue.name} created!"

  twothirds_ares = Product.new(
    name: "ARES — DEEP LAKE",
    price: 109.60,
    info: "With its classic panel design and gentle colour palette, the Fyn always blends into its natural surroundings. Why not pair it with one of our equally eco-friendly long coats? A fairly loose fit that falls around the hips, the Fyn also has ribbed edges.",
    shop: twothirds,
    product_category: ProductCategory.find_by(product_category_name: "Shirt")
  )
  arr = twothirds_ares.name.split(" ")
  twothirds_ares.photos.attach(io: URI.open("https://cdn.shopify.com/s/files/1/0995/5544/products/5_b4290e4d-a9d5-45d4-b4b2-0a9dd81a83be_400x.jpg?v=1660051649#{arr[2]}"), filename: "#{twothirds_ares.name}.jpg", content_type: "image/jpeg")
  twothirds_ares.photos.attach(io: URI.open("https://cdn.shopify.com/s/files/1/0995/5544/products/3_3d54c049-968d-4415-a9bf-ba5c1c970deb_400x.jpg?v=1660051666#{arr[2]}"), filename: "#{twothirds_ares.name}.jpg", content_type: "image/jpeg")
  twothirds_ares.save!
  puts "#{twothirds_ares.name} created!"

  twothirds_toku = Product.new(
    name: "TOKU — BLACK NEPS",
    price: 64.00,
    info: "The Toku is a soft and lightweight jersey shirt that provides the comfortable feel of a t-shirt, combined with the style of a shirt. Coloured neps and corozo buttons add extra flair",
    shop: twothirds,
    product_category: ProductCategory.find_by(product_category_name: "Shirt")
  )
  arr = twothirds_toku.name.split(" ")
  twothirds_toku.photos.attach(io: URI.open("https://cdn.shopify.com/s/files/1/0995/5544/products/3_bb300aa5-5af6-4113-b63e-7860ce96b87a_400x.jpg?v=1666339278#{arr[2]}"), filename: "#{twothirds_toku.name}.jpg", content_type: "image/jpeg")
  twothirds_toku.photos.attach(io: URI.open("https://cdn.shopify.com/s/files/1/0995/5544/products/4_629f4c72-4652-468b-b533-6f65220961b3_800x.jpg?v=1666339278#{arr[2]}"), filename: "#{twothirds_toku.name}.jpg", content_type: "image/jpeg")
  twothirds_toku.save!
  puts "#{twothirds_toku.name} created!"

  twothirds_ontong = Product.new(
    name: "ONTONG — Washed Green",
    price: 109.00,
    info: "When the weather changes, earthy coloured cords are set to storm beaches and streets everywhere. The Ontong provides homely comfort and tastefully embroidered back pockets.",
    shop: twothirds,
    product_category: ProductCategory.find_by(product_category_name: "Pants")
  )
  arr = twothirds_ontong.name.split(" ")
  twothirds_ontong.photos.attach(io: URI.open("https://cdn.shopify.com/s/files/1/0995/5544/products/1_df5df37c-865c-449b-a9c0-9db2c2f9ff47_800x.jpg?v=1666176795#{arr[2]}"), filename: "#{twothirds_ontong.name}.jpg", content_type: "image/jpeg")
  twothirds_ontong.photos.attach(io: URI.open("https://cdn.shopify.com/s/files/1/0995/5544/products/5_69d58235-6fd4-46fd-b62b-fe0e41fbc986_400x.jpg?v=1666176801#{arr[2]}"), filename: "#{twothirds_ontong.name}.jpg", content_type: "image/jpeg")
  twothirds_ontong.save!
  puts "#{twothirds_ontong.name} created!"


  kaotiko = Shop.new(
    name: "KAOTIKO RAMBLA DE CATALUÑA",
    address: "Rambla de Catalunya, 54, 08007 Barcelona",
    phone_number: "932702887",
    website: "https://www.kaotikobcn.com/es",
    user: User.all.sample,
    shop_category: ShopCategory.find_by(shop_category_name: "Clothing")
  )
  kaotiko.save!
  kaotiko.photos.attach(io: URI.open("https://cdn.kaotikobcn.com/pub/media/catalog/product/cache/e49d8d81e071b57619210d86108550fc/a/k/ak152-01-g002-00002.jpg"), filename: "#{kaotiko.name}.jpg", content_type: "image/jpeg")
  kaotiko.photos.attach(io: URI.open("https://cdn.kaotikobcn.com/pub/media/catalog/product/cache/e49d8d81e071b57619210d86108550fc/a/i/ai002-02-j002-ext.jpg"), filename: "#{kaotiko.name}.jpg", content_type: "image/jpeg")
  puts "#{kaotiko.name} created!"

  hannun = Shop.new(
    name: "HANNUN",
    address: "Carrer de Mura, 38, 08227 Terrassa, Barcelona",
    phone_number: "932209473",
    website: "https://hannun.com/",
    user: User.all.sample,
    shop_category: ShopCategory.find_by(shop_category_name: "Furniture")
  )
  hannun.save!
  hannun.photos.attach(io: URI.open("https://cdn.shopify.com/s/files/1/2481/2502/files/Equipo6.jpg?v=1644405406"), filename: "#{hannun.name}.jpg", content_type: "image/jpeg")
  hannun.photos.attach(io: URI.open("https://cdn.shopify.com/s/files/1/2481/2502/files/Equipo1.jpg?v=1644405406"), filename: "#{hannun.name}.jpg", content_type: "image/jpeg")
  puts "#{hannun.name} created!"

  protea = Shop.new(
    name: "CASA PROTEA",
    address: "Carrer de Ramón y Cajal, 124, 08024 Barcelona",
    phone_number: "930022864",
    about: "CASA PROTEA PLANT COLLECTORS STUDIO OPENED ITS DOORS IN BARCELONA -BARRI DE GRÀCIA- IN AUGUST 2017 AS A MEETING PLACE FOR PLANT LOVERS. WE WORK WITH A WIDE VARIETY OF SPECIES, TROPICAL PLANTS, CACTI, SUCCULENTS AND AIR PLANTS BEING MOST PROMINENT. IN SELECTING EACH SPECIMEN WE LOOK AT PROPERTIES SUCH AS AGE, UNIQUE SHAPE OR RARITY.",
    website: "https://www.casaprotea.com/",
    user: User.all.sample,
    shop_category: ShopCategory.find_by(shop_category_name: "Household")
  )
  protea.save!
  protea.photos.attach(io: URI.open("https://www.casaprotea.com/wp-content/uploads/2019/08/CASA-PROTEA-HR-146.jpg"), filename: "#{protea.name}.jpg", content_type: "image/jpeg")
  protea.photos.attach(io: URI.open("https://www.casaprotea.com/wp-content/uploads/2022/04/MQNMQ_Insta_HRES_011.jpg"), filename: "#{protea.name}.jpg", content_type: "image/jpeg")
  puts "#{protea.name} created!"

  protea_first = Product.new(
    name: "CLEISTOCACTUS WINTERII",
    price: 6.00,
    info: "No me incluye maceta de cerámica.",
    shop: protea,
    product_category: ProductCategory.find_by(product_category_name: "Plants")
  )
  arr = protea_first.name.split(" ")
  protea_first.photos.attach(io: URI.open("https://www.casaprotea.com/wp-content/uploads/2022/10/PACHYPODIUM_BISPINOSUM.jpg#{arr[2]}"), filename: "#{protea_first.name}.jpg", content_type: "image/jpeg")
  protea_first.photos.attach(io: URI.open("https://www.casaprotea.com/wp-content/uploads/2021/10/MONILARIA_MONILIFORME_01.jpg#{arr[2]}"), filename: "#{protea_first.name}.jpg", content_type: "image/jpeg")
  protea_first.save!
  puts "#{protea_first.name} created!"

  protea_second = Product.new(
    name: "MACETA CEMENTO",
    price: 12.00,
    info: "Maceta de cemento sin agujero de drenaje.",
    shop: protea,
    product_category: ProductCategory.find_by(product_category_name: "Plants")
  )
  arr = protea_second.name.split(" ")
  protea_second.photos.attach(io: URI.open("https://www.casaprotea.com/wp-content/uploads/2022/03/MACETA_GRIS.jpg#{arr[2]}"), filename: "#{protea_second.name}.jpg", content_type: "image/jpeg")
  protea_second.photos.attach(io: URI.open("https://www.casaprotea.com/wp-content/uploads/2022/03/MACETA_GRIS.jpg#{arr[2]}"), filename: "#{protea_second.name}.jpg", content_type: "image/jpeg")
  protea_second.save!
  puts "#{protea_second.name} created!"

  protea_third = Product.new(
    name: "ME QUIERE, NO ME QUIERE",
    price: 17.95,
    info: "Me quiere, no me quiere es un libro lleno de historias, anécdotas e información práctica sobre el mundo botánico. A través de sus páginas compartimos nuestra experiencia y conocimiento sobre plantas tropicales, plantas del aire, cactus y otras suculentas. Además, hemos incluido tutoriales paso a paso donde explicamos cómo crear desde colgadores de macramé hasta fertilizantes orgánicos.",
    shop: protea,
    product_category: ProductCategory.find_by(product_category_name: "Books")
  )
  arr = protea_third.name.split(" ")
  protea_third.photos.attach(io: URI.open("https://images.unsplash.com/photo-1472157510410-64a053cbc39f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2848&q=80#{arr[2]}"), filename: "#{protea_third.name}.jpg", content_type: "image/jpeg")
  protea_third.photos.attach(io: URI.open("https://images.unsplash.com/photo-1555791903-664fae3f73e1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80#{arr[2]}"), filename: "#{protea_third.name}.jpg", content_type: "image/jpeg")
  protea_third.save!
  puts "#{protea_third.name} created!"


  hey = Shop.new(
    name: "HEY SHOP",
    address: "Carrer del Dr. Dou, 4, 08001 Barcelona",
    phone_number: "690286123",
    website: "http://www.heyshop.es/",
    user: User.all.sample,
    shop_category: ShopCategory.find_by(shop_category_name: "Household")
  )
  hey.save!
  hey.photos.attach(io: URI.open("https://64.media.tumblr.com/8cac28870d945b867d1882a5739aef23/tumblr_plsib563QY1uuhr4zo1_1280.jpg"), filename: "#{hey.name}.jpg", content_type: "image/jpeg")
  hey.photos.attach(io: URI.open("https://64.media.tumblr.com/c05925f05885bcf9ca2889928c55cc2f/tumblr_plc0veqPxC1uuhr4zo1_1280.jpg"), filename: "#{hey.name}.jpg", content_type: "image/jpeg")
  puts "#{hey.name} created!"

  nothow = Shop.new(
    name: "NO THROW DESIGN",
    address: "Carrer del Diluvi, 4, 08012 Barcelona",
    phone_number: "933154695",
    website: "http://www.nothrowdesign.com/",
    user: User.all.sample,
    shop_category: ShopCategory.find_by(shop_category_name: "Household")
  )
  nothow.save!
  nothow.photos.attach(io: URI.open("https://nothrowdesign.com/wp-content/uploads/2018/05/Screen-Shot-2018-05-17-at-15.20.50.png"), filename: "#{nothow.name}.jpg", content_type: "image/jpeg")
  nothow.photos.attach(io: URI.open("https://nothrowdesign.com/wp-content/uploads/2018/05/Screen-Shot-2018-05-17-at-15.20.50.png"), filename: "#{nothow.name}.jpg", content_type: "image/jpeg")
  puts "#{nothow.name} created!"


  5.times do
    review = Review.new(
      rating: rand(1..5),
      content: Faker::Lorem.paragraph,
      user: User.all.sample,
      shop: Shop.all.sample
    )
    review.save!
    puts "#{review.content} created!"
  end
