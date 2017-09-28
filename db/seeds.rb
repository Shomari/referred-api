# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# sho = User.create(name: 'shomari', email: 'sho@mail.com')
# amanda = User.create(name: 'amanda')

# Friendship.create(user: sho, friend: amanda)

cat = Category.create(name: 'Auto Repair')
Category.create(name: 'Plumber')
Category.create(name: 'Dentist')
Business.create(name: 'shos plumbing', address: '123 main st', category: cat)

User.create(name: 'Amanda', email: 'amdna@mail', facebook_uid: 435)
User.create(name: 'Jane', email: 'amdna@mail', facebook_uid: 435)

# Friendship.create(user_id: 1, friend_id: 2)
Recommendation.create(user_id: 2, business_id: 1, text: 'amandas plumbing revie')
