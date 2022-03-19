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

### Sitemap

Attach here

### Screenshots

Attach here

### Tech Stack

#### Application Framework

- Ruby on Rails

#### Languages

- Ruby
- HTML5
- CSS3
- SCSS

#### Front End Framework

- Bootstrap
- jQuery
- popper.js

#### User Management and Authentication

- Devise

#### Payment Services

- Stripe

#### Cloud Storage

- Amazon S3

#### Database

- PostgreSQL

#### Deployment

- Heroku

#### Project Management

- Trello

#### Version Control

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

### Cloud Storage

#### Amazon S3

Hot Vinyl Records uses the Amazon S3 service to store and retrieve images uploaded by the user for their selling items. When an item is removed from the site, the associated image is removed from the S3 cloud to ensure efficient use of storage.

### Payment System

#### Stripe

Payments between a buyer and Hot Vinyl Records are handled by the Stripe payment service. Stripe fetches the buyer and product information to create a new order and allows payment via credit card.

### Deployment

#### Heroku

The Hot Vinyl Records application is deployed and hosted via the cloud based platform Heroku. It uploads, compiles and interprets the source code to display the application as intended.

## Models

Hot Vinyl Records features models relevant to the running of the application with associations explicitly declared to define the type of relationships they have to each other.

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

###

place holder url for album image
https://unsplash.com/photos/hrUhyFq6u-A
Brett Jordan photographer

### References
AfterAcademy 2019, What is Data Abstraction in DBMS and what are its three levels?, Afteracademy.com, viewed 19 March 2022, <https://afteracademy.com/blog/what-is-data-abstraction-in-dbms-and-what-are-its-three-levels>.

‌
‌
