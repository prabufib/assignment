# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development? and AdminUser.where(email: "admin@example.com").blank?

User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development? and User.where(email: "user@example.com").blank?


["Sports", "Movies"].each_with_index do |cat, index|
  c =  Category.create(name: cat, alias_name: cat.downcase, admin_user_id: AdminUser.last.id)
  c.questionnaires.create(name: "test #{index}", description: "test test #{index}", active: true)
end