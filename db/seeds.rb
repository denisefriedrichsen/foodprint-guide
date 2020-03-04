# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "date"

apple = Product.create(name: "Apple", category: "fruits", season_start: 3, season_end: 5)
banana = Product.create(name: "Apple", category: "fruits", season_start: 4, season_end: 6)
