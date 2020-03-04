# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "date"

apple = Product.create(name: "Apple", category: "fruits", season_start: "03", season_end: "05")
banana = Product.create(name: "Apple", category: "fruits", season_start: "04", season_end: "06")
