# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
User.destroy_all
Product.destroy_all


Category.create([{
        name: 'Rock'
    },
    {
        name: 'Pop'
    },
    {
        name: 'Metal'
    },
    {
        name: 'Alternative'
    },
    {
        name: 'Jazz'
    },
    {
        name: 'World'
    },
    {
        name: 'Classical'
    },
    {
        name: 'Country'
    },
    {
        name: 'Pop'
    },
    {
        name: 'Electronic'
    }])


u1 = User.create(email: 'user@test.com', password: '123123', password_confirmation: '123123', username: 'r_waters', seller: true)
a1 = Product.create(name: 'Dark Side of the Moon', artist: 'Pink Floyd', price: 300, vinyl_weight: 180, catalog_number: 'CA 5887', condition: 'Average', category_id: 1, user_id: 1, sold_status: false)
a2 = Product.create(name: 'Animals', artist: 'Pink Floyd', price: 300, vinyl_weight: 180, catalog_number: 'CA 5887', condition: 'Average', category_id: 1, user_id: 1, sold_status: false)
a3 = Product.create(name: 'Powerslave', artist: 'Iron Maiden', price: 300, vinyl_weight: 180, catalog_number: 'CA 5887', condition: 'Average', category_id: 1, user_id: 1, sold_status: false)
a4 = Product.create(name: 'Heartlight', artist: 'Neil Diamond', price: 300, vinyl_weight: 180, catalog_number: 'CA 5887', condition: 'Average', category_id: 1, user_id: 1, sold_status: false)
