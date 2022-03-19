# Hot Vinyl Records

### Hot Vinyl Deployed Website

[Hot Vinyl Records link](https://mysterious-springs-75901.herokuapp.com/)

### Hot Vinyl Github Repository

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

* Categories

    `before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]`

* Reviews

    `before_action :authenticate_user!, only: [:new, :edit, :create, :update]`

* Orders

    `before_action :authenticate_user!` (This action only allows a logged in user to access the ordering system)

##### Buyer Only User

A user who chooses not to b
    
place holder url for album image
https://unsplash.com/photos/hrUhyFq6u-A
Brett Jordan photographer

### References
AfterAcademy 2019, What is Data Abstraction in DBMS and what are its three levels?, Afteracademy.com, viewed 19 March 2022, <https://afteracademy.com/blog/what-is-data-abstraction-in-dbms-and-what-are-its-three-levels>.

‌
‌
