# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: 'Bits and Bobs')
Category.create(name: 'Food')
Category.create(name: 'Apparel')
Category.create(name: 'Shoes')
Category.create(name: 'Toys')
Category.create(name: 'Books')

Product.create(title: 'Awfully Comfortable New Balance Trainers', description: 'British-made.', price: 100, category_id: 4)
Product.create(title: 'Itchy Wool Jumper', description: 'Did you see the title?', price: 80, category_id: 3)
Product.create(title: 'Tea and Crumpets', description: 'The quintessential British breakfast', price: 50, category_id: 2)
Product.create(title: 'The Queen\'s Dentures', description: 'May be stolen property.', price: 250, category_id: 1)
Product.create(title: 'Pride and Prejudice', description: 'Oh, Mr. Darcy.', price: 15, category_id: 6)
Product.create(title: 'Medium-sized Teddy', description: 'Soft and delicate to the tot\'s touch.', price: 28, category_id: 5)
