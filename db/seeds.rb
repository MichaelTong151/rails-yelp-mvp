# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Restaurant.destroy.all
Restaurant.create(name: "Bopomofo", address: "Los Angeles, CA", category: Taiwanese/American)
Restaurant.create(name: "Craw Daddy", address: "San Jose, CA", category: Mexican)
Restaurant.create(name: "Left Wing", address: "San Francisco, CA", category: Korean/American )
Restaurant.create(name: "Zipang Ramen Bar", address: "Hamburg, DE", category: Japanese)
Restaurant.create(name: "Asia Vu", address: "Stade, DE", category: Vietnamese)
Restaurant.create(name: "Little Four Seasons", address: "London UK", category: Chinese)
Restaurant.create(name: "Momofuku Ramen", address: "Las Vegas, NV", category: Japanese/American )
