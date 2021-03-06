# Hot Vinyl Records

## Hot Vinyl Deployed Website

[Hot Vinyl Records link](https://mysterious-springs-75901.herokuapp.com/)

## Hot Vinyl Github Repository

[Hot Vinyl Records Git Hub link](https://github.com/simon-tanna/hot_vinyl_records)

## What is Hot Vinyl Records?

The experience of high quality and vintage vinyl indulges the senses of listener. From the visual impact of the sleeve artwork to the touch of the 180gram vinyl in your hands through to the moment the stylus hits the record to engage your ears, it is unrivalled in terms of creating a sense of personal joy. The demand for high quality, vintage and rare vinyl records is at an all-time high with collectors and audiophiles alike. The Hot Vinyl Records web application seeks to connect record enthusiasts to buy and sell only the best vinyl.

## Why Hot Vinyl Records?

There are a large number of 2 sided buy, swap, sell marketplaces present online where a user can trade in any number of products and you are likely to find vinyl records of varying quality present on these sites. For users who are seeking high quality, vintage and rare vinyl, these sites can offer a varied experince from uncovering a hidden gem to getting ripped off on a product that is inferior in quality and not what the buyer expected. Hot Vinyl Records seeks to provide record enthusiasts with a marketplace specializing in only the best vinyl. It is a place where they can be confident of the quality, pressing and condition of the product and are able to make informed purchasing decisions based upon seller reviews and item specifications.

Hot Vinyl Records recognises that in the current pandemic environment that "digging the crates" at your local record shop is not longer an option for many people. This site seeks to provide users with a virtual "crate" in which to dig from the comfort of their personal device.

## Application Description

### Purpose

Hot Vinyl Records is a two-sided marketplace application in which users can view, buy, sell and review products. It seeks to provide a hassle-free purchasing system where the user can be confident in the integrity of the site, product and sellers.

### Target Audience

Hot Vinyl Records is designed to attract record collectors, enthusiasts and music lovers from all parts of Australia. It also provides users looking to start a quality record collection of their own a place where they can feel confident of the quality and value of product they are purchasing.

### Functionality

The Hot Vinyl Records site allows users to interact with features within the application depending on their registration and admin status.

All users of the site are able to view the products currently listed for sale by selecting a category from the [home page](https://mysterious-springs-75901.herokuapp.com/), selecting the [all albums](https://mysterious-springs-75901.herokuapp.com/products) link or by conducting a search for a particular product using the album or artist search function. Within the category and all albums pages, the user can sort the listed items by name, artist, price and seller. All site users can view seller profiles detailing current listings and sold items. This allows the user to view any relevant reviews attached to the sold items and assess the standard of product provided by the seller.

If a guest user wishes to buy or sell a product, they must either [sign up](https://mysterious-springs-75901.herokuapp.com/users/sign_up) for a user account or [sign in](https://mysterious-springs-75901.herokuapp.com/users/sign_in) to their current account.

If a signed in user wishes to sell an item, they are able to access the [sell vinyl](https://mysterious-springs-75901.herokuapp.com/products/new) link in the navbar to add their product. A selling user can also view all products that they are currenly listing and recently sold items.

If a user wishes to buy a particular item from the store, there is a "buy me now" link at the bottom of the product information page which directs them directly to checkout that item. Upon payment for the item, the user can view their reciept and add a review to the item through the product view page.

Site administrators are able to edit and delete listings or reviews if they do not meet the standards required by the site. They are also able to create, edit or delete categories as genres evolve over time.

## Sitemap

![Hot Vinyl Records Sitemap](/app/assets/images/markdown_resource/vinyl_marketplace_sitemap.png)

## Wireframes

### Home Page

![Hot Vinyl Records Home](/app/assets/images/markdown_resource/wireframes/index.png)

### Sign Up Page

![Hot Vinyl Records Sign Up](/app/assets/images/markdown_resource/wireframes/sign_up.png)

### Sign In Page

![Hot Vinyl Records Sign In](/app/assets/images/markdown_resource/wireframes/sign_in.png)

### Category View

![Hot Vinyl Records Category View](/app/assets/images/markdown_resource/wireframes/vinyl.png)

### Product View

![Hot Vinyl Records Product View](/app/assets/images/markdown_resource/wireframes/product.png)

### Profile View

![Hot Vinyl Records Profile View](/app/assets/images/markdown_resource/wireframes/user.png)

## Screenshots

### Home Page Screenshot

![Hot Vinyl Records Home](/app/assets/images/markdown_resource/screens/home.jpg)

### Sign Up Page Screenshot

![Hot Vinyl Records Sign Up](/app/assets/images/markdown_resource/screens/signup_screen.jpg)

### Sign In Page Screenshot

![Hot Vinyl Records Sign In](/app/assets/images/markdown_resource/screens/signin_screen.jpg)

### Category View Screenshot

![Hot Vinyl Records Category View](/app/assets/images/markdown_resource/screens/category_screen.jpg)

### Product View Screenshot

![Hot Vinyl Records Product View](/app/assets/images/markdown_resource/screens/product_screen.jpg)

### Profile View Screenshot

![Hot Vinyl Records Profile View](/app/assets/images/markdown_resource/screens/profile_screen.jpg)

## Tech Stack

### Application Framework

- Ruby on Rails

### Languages

- Ruby
- HTML5
- CSS3
- SCSS

### Front End Framework

- Bootstrap
- jQuery
- popper.js

### User Management and Authentication

- Devise

### Payment Services

- Stripe

### Cloud Storage

- Amazon S3

### Database

- PostgreSQL

### Deployment

- Heroku

### Project Management

- Trello

### Version Control

- Github

## User Stories

### Guest

As a guest user, I can:

- View categories of product available
- View items belonging to a particular category
- View all products for sale
- View products listed by a particular seller
- View sold products and any attached review
- Search products by album or artist name
- Sort products by album, artist, price or seller
- Sign up as a registered user
- Sign in as a registered user

### Buyer

As a buyer, I can:

- Do all things that a guest user can do
- Buy products
- View my order history
- View my reciepts
- Review products I have bought
- Edit reviews of products I have bought
- Edit my user profile

### Seller

As a seller, I can:

- Do all things a guest and buyer can do
- List products to sell
- Attach an image to a product I have listed to sell
- Edit a product that I have listed to sell
- Delete a product that I have listed to sell if it has not been sold
- View my active listings

### Administrator

As an admin, I can:

- Do all things a guest, buyer and seller can do
- Edit or delete products if they have not been sold
- Edit or delete product reviews
- Create or edit categories
- Delete categories if no listed products belong to that category

## High Level Components

### Data Abstraction

The process of data abstraction refers to the hiding of details not relevant to a particular user (AfterAcademy 2019). It is divided into three levels being:

1. View Level
1. Conceptual Level
1. Physical Level

As the view level is the highest of these abstractions, a description of how this is implemented within the application is discussed below.

#### View Level

The view level of data abstraction tells the application what data can be accessed by a user and how they access it. Hot Vinyl Records provides difference levels of authorisation to a user in order to ensure the integrity of the application and it's data.

##### Guest User

The guest user is authorised to view categories, products and user profiles. Access to any other element of the application is denied to a guest user through use of the Devise helper `before_action :authenticate_user!` in a controller. For example, the following code is implemented in /controllers/products_controller.rb

`before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]`

This tells the application to authenticate that a user is signed in if they are wanting to create, edit or delete a product, thereby allowing a guest user to access the data in the index and show views without authentication. Before actions are also used in the following controllers:

- Categories

    `before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]`

- Reviews

    `before_action :authenticate_user!, only: [:new, :edit, :create, :update]`

- Orders

    `before_action :authenticate_user!` (This action only allows a logged in user to access the ordering system)

##### Buyer Only User

A user who chooses not to register as a seller will not be able to access certain parts of the site which are relevant only to sellers. For example, if a non-seller user attempted to create a new product, the following private method would be implemented in the /controllers/products_controller.rb

    def verified_seller
      if !user_signed_in? or !current_user.seller?
        redirect_to products_url, notice: "You must be registered as a seller to list an item"
      end
    end

`before_action :verified_seller, only: [:new, :create, :my_selling_products]` is the invoked at the top of the controller.

Data abstraction also occurs without using a before_action in a controller. For example, upon buying a product, the user will have access to their order history and can only view this if they are a current signed in user who has placed at least one order. This is invoked via the following method in /controllers/orders_controller.rb

    def index

        @orders = current_user.orders

        if current_user.orders.count < 1
            flash[:alert] = 'You have no order history to display'
            redirect_to categories_path
        end

    end

##### Selling Users and Admin

A Hot Vinyl Records seller is able to create, edit and delete products but must be verified as the owner of a particular item. View level abstraction for a seller is achieved through before_action commands in the controllers and in the views via embedded ruby code. For example, a seller is prevented from editing or deleting a product from the site via the following code contained within /controllers/products_controller.rb

`before_action :owner_or_admin, only: [:edit, :update, :destroy]`

    def owner_or_admin
      if !current_user.admin? and current_user.id!=@product.user_id
        redirect_to products_url, notice: "You must be the selling user or have administrative access to perform that action"
      end
    end

This code will only allow the product seller or a site admin to perform these actions. In order to fully ensure integrity of the site, these options are removed as links from the product show page if the logged in user is not the seller of that product via the following embedded ruby code.

    <%# Checking if user is signed in and the user is either the selling owner or admin and if the item has not been sold %>

        <% if @product.sold_status? == false %>
            <% if user_signed_in? and (current_user.admin? or current_user.id==@product.user_id) %>
                <%= link_to 'Edit', edit_product_path(@product) %>
                <%= link_to 'Destroy', @product, method: :delete, data: { confirm: 'Are you sure?' } %>

    <%# If user is not the seller, they will have the option to buy the item %>
    <%# Devise will handle authentication of this. If user is not signed in they will have an error message and redirect to signin page %>

            <% else %>
                <%= link_to 'Buy Me Now!', new_product_order_path(@product.id) %>
            <% end %>
        <% end %>

## Third-Party Services

### Cloud Storage Service

#### Amazon S3

Hot Vinyl Records uses the Amazon S3 service to store and retrieve images uploaded by the user for their selling items. When an item is removed from the site, the associated image is removed from the S3 cloud to ensure efficient use of storage.

### Payment System

#### Stripe

Payments between a buyer and Hot Vinyl Records are handled by the Stripe payment service. Stripe fetches the buyer and product information to create a new order and allows payment via credit card.

### Deployment Service

#### Heroku

The Hot Vinyl Records application is deployed and hosted via the cloud based platform Heroku. It uploads, compiles and interprets the source code to display the application as intended.

## Models

Hot Vinyl Records features models relevant to the running of the application with active record associations explicitly declared to define the type of relationships they have to each other.

### User Model

- `has_many :products`

    This allows a user to list multiple products for sale.

- `has_many :orders`

    This allows a user to place many orders

- `has_many :reviews`

    This allow a user to write many reviews

### Product Model

- `belongs_to :user`

    Declares that a product belongs to an instance of one user

- `belongs_to :category`

    Declares that a product belongs to an instance of one category

- `has_one_attached :picture`

    Declares that a product can have one picture attached to it's record.

- `has_one :order`

    This indicates that an product will have an association with one order

- `has_one :review`

    This indicates that an product will have an association with one review

### Order Model

- `belongs_to :user`

    Declares that an order belongs to an instance of one user

- `belongs_to :product`

    Declares that an order belongs to an instance of one product

### Category Model

- `has_many :products`

    This allows an instance of a category to contain many products

### Review Model

- `belongs_to :product`

    Declares that a review belongs to an instance of one product

- `belongs_to :user`

    Declares that a review belongs to an instance of one user

## Entity Relationship Diagram

![ERD for Hot Vinyl Records](/app/assets/images/markdown_resource/vinyl_marketplace_erd.png)

## Database Relations

For reference, all relationship descriptions in the following headings are made with reference to the Entity Relationship Diagram (ERD) above.

### User and Product

The user and product entities are linked via two relationships.

#### Buys | One (User) to Many (Products) Relationship

- 1 Buying User : Many Products
  - One user can buy many products
  - One product can have only one buying user

#### Sells | One (User) to Many (Products) Relationship

- 1 Selling User : Many Products
  - One user can sell many products
  - One product can have only one selling user

Within the database, the product table includes a user_id foreign key to identifying the selling user.

### User, Product and Order

#### Buys | One (User) to Many (Orders) Relationship

- 1 Buying User : Many Orders
  - One user can place(buy) many orders
  - One order can have only one ordering user

#### Have | One (Product) to One (Order) Relationship

- 1 Product : 1 Order
  - Only one product can be bought in an order
  - One order can have only one product in that order

Within the database, the order table includes a user_id foreign key to identifying the buying user and a product_id foreign key to identify the product being sold.

In the implementation of this relationship, a user is able to place one order for one product but can do this for many products, thereby creating many orders.

### User, Product and Review

#### Writes | One (User) to Many (Reviews) Relationship

- 1 Writing User : Many Reviews
  - One user can write many reviews
  - One review can have only one writing user

#### Have | One (Product) to One (Review) Relationship

- 1 Writing User : Many Reviews
  - One product can have only one review
  - A review is attached to only one product

Within the database, the review table includes a user_id foreign key to identifying the writing user and a product_id foreign key to identify the product being reviewed.

In the implementation of this relationship, a user is able to write one review for one product but can do this for many products they have bought, thereby creating many reviews.

### Product and Category

#### Have | One (Category) to Many (Products) Relationship

- 1 Category : Many Products
  - One category can contain many products
  - One product can be associated with only one category

Within the database, the product table includes a category_id foreign key to identifying the associated category.

### Product and Active Storage Image

#### Have | One (Product) to One (Image) Relationship

- 1 Product : 1 Image
  - One product will have one image attached in active storage
  - One active storage image will be associated with one product

## Database Schema

Below are edited schema designs for each of the database models used by Hot Vinyl Records containing the custom attributes and relationship added by the developer.

### User

    create_table "users", force: :cascade do |t|
        t.string "email", default: "", null: false
        ...
        t.string "username", null: false
        t.boolean "admin", default: false
        t.boolean "seller"
    end

### Product

    create_table "products", force: :cascade do |t|
        t.string "name"
        t.string "artist"
        t.float "price"
        t.integer "vinyl_weight"
        t.string "catalog_number"
        t.string "condition"
        t.bigint "user_id", null: false
        ...
        t.boolean "sold_status", default: false
        t.bigint "category_id", null: false
        t.index ["category_id"], name: "index_products_on_category_id"
        t.index ["user_id"], name: "index_products_on_user_id"
    end

    add_foreign_key "products", "categories"
    add_foreign_key "products", "users

### Category

    create_table "categories", force: :cascade do |t|
        t.string "name", null: false
        ...
    end

### Order

    create_table "orders", force: :cascade do |t|
        t.bigint "user_id", null: false
        t.bigint "product_id", null: false
        ...
        t.string "receipt_url"
        t.index ["product_id"], name: "index_orders_on_product_id"
        t.index ["user_id"], name: "index_orders_on_user_id"
    end

    add_foreign_key "orders", "products"
    add_foreign_key "orders", "users"

### Review

    create_table "reviews", force: :cascade do |t|
        t.string "comment", null: false
        t.integer "rating", null: false
        t.bigint "product_id", null: false
        t.bigint "user_id", null: false
        ...
        t.index ["product_id"], name: "index_reviews_on_product_id"
        t.index ["user_id"], name: "index_reviews_on_user_id"
    end

    add_foreign_key "reviews", "products"
    add_foreign_key "reviews", "users"

## Project Management Process

### Task Allocation and Tracking

Trello was used to track and allocate tasks during the build of the Hot Vinyl Records application. The list of categories used within the Trello board are as follows:

- Pre-Development: Featuring plans for the application such as wireframes, ERD and sitemap
- Personas: A reference list of types of users featured by the app
- User Stories: A list of what each type of user can do within the app. This is useful for making sure a certain type of user can perform a certain action
- Backlog: All tasks related to the creation and deployment of the app yet to be completed. Throughout development, task cards are added to this list frequently
- In-Development (Code): Tasks currently in progress relating to coding aspects of the application. This is useful if a task has not been completed by referencing progress.
- In-Development (Non-Code): All tasks in progress not coding related such as README.md
- Testing: Tests to be performed
- Done: All completed task cards are moved to this list
  
Each type of task would be allocated to the appropriate list and set a coloured label indicating the following status:

- Complete
- In-Progress
- High Priority
- To-Do
- Help Needed
- Refine if Needed

High priority tasks would be completed first.

### Information For Educators

The following versions were used in development

- Rails 6.1.4.7
- Node v16.13.2
- ruby 2.7.5p203

To test admin permissions, login as user4@test.com password: 123123

### Credits

[Placeholder album image](https://unsplash.com/photos/hrUhyFq6u-A) - Brett Jordan photographer

### References

AfterAcademy 2019, What is Data Abstraction in DBMS and what are its three levels?, Afteracademy.com, viewed 19 March 2022, <https://afteracademy.com/blog/what-is-data-abstraction-in-dbms-and-what-are-its-three-levels>.

???
???
