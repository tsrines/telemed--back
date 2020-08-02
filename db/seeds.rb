# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.all.destroy_all
Photo.all.destroy_all
Favorite.all.destroy_all
User.all.destroy_all
Doctor.all.destroy_all

# 100.times do
#   Doctor.create(
#     api_id: rand(1..100).to_s,
#     first_name: Faker::FunnyName.name,
#     last_name: Faker::FunnyName.name,
#     title: "Dr.", specialty: Faker::Job.key_skill,
#     image: Faker::Avatar.image,
#     address: Faker::Address.full_address,
#     gender: Faker::Gender.binary_type,
#     bio: Faker::Hipster.paragraph,
#     phone_number: Faker::PhoneNumber.phone_number)
# end
