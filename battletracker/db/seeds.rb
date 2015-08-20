# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username:'ashton', password: 'bananas', email:'ashton.alexander@gmail.com')
User.first.characters << Character.create(name:"Brock", job:'Barbarian', total_hp: 50, current_hp: 50, armor_class: 12, initiative: 3, alive: true)
User.first.characters << Character.create(name:"Brick", job:'Paladin', total_hp: 40, current_hp: 40, armor_class: 16, initiative: 1, alive: true)
