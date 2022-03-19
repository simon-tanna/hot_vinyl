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
        name: 'Electronic'
    },
    {
        name: 'Blues'
    }])


User.create([{
        email: 'user1@test.com',
        password: '123123',
        password_confirmation: '123123',
        username: 'r_waters',
        seller: true
    },
    {
        email: 'user2@test.com',
        password: '123123',
        password_confirmation: '123123',
        username: 'd_gilmour',
        seller: true
    },
    {
        email: 'user3@test.com',
        password: '123123',
        password_confirmation: '123123',
        username: 'f_kuti',
        seller: false
    },
    {
        email: 'user4@test.com',
        password: '123123',
        password_confirmation: '123123',
        username: 'f_zappa',
        seller: false,
        admin: true
    }])
    
Product.create([{
        name: 'Dark Side of the Moon',
        artist: 'Pink Floyd',
        price: 300,
        vinyl_weight: 180,
        catalog_number: 'CA 5887',
        condition: 'Average',
        category_id: 1,
        user_id: 1,
        sold_status: false
    },
    {
        name: 'Animals',
        artist: 'Pink Floyd',
        price: 120,
        vinyl_weight: 180,
        catalog_number: 'TB 453003',
        condition: 'Average',
        category_id: 1,
        user_id: 1,
        sold_status: false
    },
    {
        name: 'Powerslave',
        artist: 'Iron Maiden',
        price: 200,
        vinyl_weight: 170,
        catalog_number: 'AU 43929',
        condition: 'Average',
        category_id: 3,
        user_id: 2,
        sold_status: false
    },
    {
        name: 'Scenes From A Memory',
        artist: 'Dream Theater',
        price: 100,
        vinyl_weight: 180,
        catalog_number: 'DS 439529',
        condition: 'Average',
        category_id: 3,
        user_id: 2,
        sold_status: false
    },
    {
        name: 'Waterloo',
        artist: 'ABBA',
        price: 40,
        vinyl_weight: 170,
        catalog_number: 'RS 3422',
        condition: 'Average',
        category_id: 2,
        user_id: 2,
        sold_status: false
    },
    {
        name: 'If Not For You',
        artist: 'Olivia Newton-John',
        price: 40,
        vinyl_weight: 170,
        catalog_number: 'RS 34223',
        condition: 'Average',
        category_id: 2,
        user_id: 1,
        sold_status: false
    },
    {
        name: 'The Velvet Underground',
        artist: 'The Velvet Underground',
        price: 1200,
        vinyl_weight: 180,
        catalog_number: 'CL 39422',
        condition: 'Average',
        category_id: 4,
        user_id: 1,
        sold_status: false
    },
    {
        name: 'OK Computer',
        artist: 'Radiohead',
        price: 200,
        vinyl_weight: 180,
        catalog_number: 'CL 349422',
        condition: 'Average',
        category_id: 4,
        user_id: 2,
        sold_status: false
    },
    {
        name: 'Kind Of Blue',
        artist: 'Miles Davis',
        price: 4000,
        vinyl_weight: 200,
        catalog_number: 'RB 39222',
        condition: 'Average',
        category_id: 5,
        user_id: 1,
        sold_status: false
    },
    {
        name: 'Bitches Brew',
        artist: 'Miles Davis',
        price: 340,
        vinyl_weight: 200,
        catalog_number: 'RB 3654222',
        condition: 'Average',
        category_id: 5,
        user_id: 2,
        sold_status: false
    },
    {
        name: 'Zombie',
        artist: 'Fela Kuti',
        price: 220,
        vinyl_weight: 170,
        catalog_number: 'EO 32433',
        condition: 'Average',
        category_id: 6,
        user_id: 1,
        sold_status: false
    },
    {
        name: 'Zen Kiss',
        artist: 'Sheila Chandra',
        price: 135,
        vinyl_weight: 160,
        catalog_number: 'RO 455993',
        condition: 'Average',
        category_id: 6,
        user_id: 2,
        sold_status: false
    },
    {
        name: 'Gershwin: Rhapsody in Blue',
        artist: 'Andre Previn and the London Symphony Orchestra',
        price: 20   ,
        vinyl_weight: 160,
        catalog_number: 'AL 4022',
        condition: 'Average',
        category_id: 7,
        user_id: 1,
        sold_status: false
    },
    {
        name: 'Beethoven: The Complete Piano Sonatas',
        artist: 'Daniel Barenboim',
        price: 460,
        vinyl_weight: 190,
        catalog_number: 'DB 53003',
        condition: 'Average',
        category_id: 7,
        user_id: 2,
        sold_status: false
    },
    {
        name: 'Hello Darlin',
        artist: 'Conway Twitty',
        price: 15,
        vinyl_weight: 150,
        catalog_number: 'CH 3022',
        condition: 'Average',
        category_id: 8,
        user_id: 1,
        sold_status: false
    },
    {
        name: 'Jolene',
        artist: 'Dolly Parton',
        price: 35,
        vinyl_weight: 150,
        catalog_number: 'DO 93883',
        condition: 'Average',
        category_id: 8,
        user_id: 2,
        sold_status: false
    },
    {
        name: 'Oxygene',
        artist: 'Jean-Michel Jarre',
        price: 90,
        vinyl_weight: 180,
        catalog_number: 'JS 3952',
        condition: 'Average',
        category_id: 9,
        user_id: 1,
        sold_status: false
    },
    {
        name: 'Clic',
        artist: 'Franco Battiato',
        price: 25,
        vinyl_weight: 180,
        catalog_number: 'UT 38423',
        condition: 'Average',
        category_id: 9,
        user_id: 2,
        sold_status: false
    },
    {
        name: 'Electric Mud',
        artist: 'Muddy Waters',
        price: 60,
        vinyl_weight: 180,
        catalog_number: 'SO 43343',
        condition: 'Average',
        category_id: 10,
        user_id: 1,
        sold_status: false
    },
    {
        name: 'The Real Folk Blues',
        artist: 'Howlin Wolf',
        price: 60,
        vinyl_weight: 170,
        catalog_number: 'SE 433223',
        condition: 'Average',
        category_id: 10,
        user_id: 2,
        sold_status: false
    }])

    Product.all.each do |products|
        products.picture.attach(io: File.open(Rails.root.join('app/assets/images/placeholder_record.jpg')),
        filename: 'placeholder_record.jpg')
    end


    

    p "Created #{Category.count} categories"
    p "Created #{User.count} users"
    p "Created #{Product.count} products"
