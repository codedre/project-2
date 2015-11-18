# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Mood.destroy_all
Food.destroy_all



  Mood.create(name: "Angry")
  Mood.create(name: "Bitchy")
  Mood.create(name: "Cheerful")
  Mood.create(name: "Gloomy")
  Mood.create(name: "Sick")
  Mood.create(name: "Thankful")
