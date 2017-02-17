# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "admin", username: "admin", password:"password", role: 0)
User.create(name: "user", username: "user", password:"password", role: 1)

Reward.create(name: "berry-juice", cost: 10)
Reward.create(name: "fresh-water", cost: 20)
Reward.create(name: "soda-pop", cost: 10)