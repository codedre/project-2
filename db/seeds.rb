# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Mood.destroy_all
Food.destroy_all



m1 = Mood.create(name: "Angry")
m2 = Mood.create(name: "Bitchy")
Mood.create(name: "Cheerful")
Mood.create(name: "Gloomy")
Mood.create(name: "Sick")
Mood.create(name: "Thankful")

m1.foods.create(name: "Burgers")
m1.foods.create(name: "Ice Cream")
m2.foods.create(name: "Thai")
m2.foods.create(name: "Mexican")
