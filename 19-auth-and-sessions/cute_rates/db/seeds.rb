# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jurgen = CutePet.create(name: 'Jurgen',
  image: 'http://redlinernotes.com/images/do_not_want.jpg',
  likes: 17)

seyla = CutePet.create(name: 'seyla',
  image: 'http://redlinernotes.com/images/seyla/IMG_20130513_135345.jpg',
  likes: 3009)
