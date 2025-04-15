# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

u1 = User.create(name: 'user1', email: 'user1@gmail.com', referral_code: 'abc123')

u2 = User.create(name: 'user2', email: 'user2@gmail.com', referral_code: 'u2345', referrer: u1)
u3 = User.create(name: 'user3', email: 'user3@gmail.com', referral_code: 'u3456', referrer: u1)
u4 = User.create(name: 'user4', email: 'user4@gmail.com', referral_code: 'u4567', referrer: u1)
