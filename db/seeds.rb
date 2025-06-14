# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

restaurant_count = 10

CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]

def random_category
  CATEGORIES.sample
end

def random_rating
  rand(1..5)
end

# Clean DB before seeding
Review.destroy_all
Restaurant.destroy_all

restaurants = []
restaurant_count.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: random_category
  )
  restaurants << restaurant
end

(restaurant_count * 2).times do
  Review.create!(
    rating: random_rating,
    content: Faker::Restaurant.review,
    restaurant: restaurants.sample
  )
end
