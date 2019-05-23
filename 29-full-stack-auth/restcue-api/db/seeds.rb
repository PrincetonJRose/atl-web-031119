# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

moose = Dog.create(name: 'Moose',
                   age: '12 weeks',
                   image_url: 'https://i.imgur.com/jbb5gBr.jpg',
                   description: 'This handsome boy is ready to find his forever home.',
                   likes: 312,
                   adopted: false)
seyla = Dog.create(name: 'Seyla',
                   age: '8 years',
                   image_url: 'http://redlinernotes.com/images/beach_2014/soulful_eyes.jpg',
                   description: 'This sweet girl has found loving parents in East Atlanta!',
                   likes: 407,
                   adopted: true)
jurgen = Dog.create(name: 'Jurgen',
                    age: '6 years',
                    image_url: 'http://redlinernotes.com/images/beach_2014/jurgen_habermantis.jpg',
                    description: 'Extremely naughty and dysfunctional. Brave foster parents required.',
                    likes: 3,
                    adopted: true)
