require 'json'
require 'open-uri'

# creating all products from google spreadheet
puts "Destroying all Products"

Product.destroy_all

puts "Creating products..."

product_url = 'https://spreadsheets.google.com/feeds/list/10-q-j1EiK1OkI6ibLB631vhkcJRY0jN6CWd0Sa-EbSU/od6/public/values?alt=json'
product_seed_url = open(product_url).read
product_seed_json = JSON.parse(product_seed_url)

product_seed_json['feed']['entry'].each do |seed|
  product = Product.new(
    name:  seed['gsx$name']['$t'],
    category: seed['gsx$category']['$t'],
    # season_start: seed['gsx$seasonstart']['$t'].to_i,
    # season_end: seed['gsx$seasonend']['$t'].to_i,
    content: seed['gsx$content']['$t'],
    photo: "https://res.cloudinary.com/teamleia/image/upload/v1583248241/foodprint/products/#{seed['gsx$photo']['$t']}.jpg"
  )
  product.save!
end

puts "Successfully created products. Easy!"

# creating all producers from google spreadheet
puts "Destroying all Producers"

Producer.destroy_all

puts "Creating producers..."

producer_url = 'https://spreadsheets.google.com/feeds/list/1cp9Hw1rSBGOowGiHmZlhmxL3qKpK0JhXCbgSxzDiX8Y/od6/public/values?alt=json'
producer_seed_url = open(producer_url).read
producer_seed_json = JSON.parse(producer_seed_url)

producer_seed_json['feed']['entry'].each do |seed|
  producer = Producer.new(
    company_name:  seed['gsx$companyname']['$t'],
    owner_name: seed['gsx$ownername']['$t'],
    address: seed['gsx$address']['$t'],
    description: seed['gsx$description']['$t'],
    website: seed['gsx$website']['$t'],
    photo: "https://res.cloudinary.com/teamleia/image/upload/v1583259246/foodprint/producer/#{seed['gsx$photo']['$t']}.jpg"
  )
  producer.save!
end

puts "Successfully created producers. Easy!"



puts Product.first['name']
puts Product.last['name']
puts Producer.first['company_name']
puts Producer.last['company_name']