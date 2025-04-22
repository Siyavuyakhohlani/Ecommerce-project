# **PROJECT MODULE 3: E-COMMERCE**

## **OVERVIEW 
Thrifted Warmth is an online platform dedicated to providing high-quality, pre-owned winter wear with a focus on sustainability, affordability, and style. Our goal is to offer customers a way to stay warm while helping the planet stay cool. By sourcing premium coats from Overcoat Exporter, we give every piece a second life, reducing textile waste and promoting eco-friendly fashion.

This e-commerce platform enables users to shop for winter wear, create accounts, manage orders, and easily navigate through various product categories. Additionally, users can securely reset their passwords using a built-in Forgot Password and Reset Password functionality.

With an intuitive interface, robust features, and a focus on sustainability, Thrifted Warmth is the perfect place to find stylish, second-hand winter coats at affordable prices.


## Tech Stack (technologies used to build and run a project, typically a web or software application)
1.Frontend: Vue.js - Vue.js, CSS, JavaScript
2.Backend: Node.js
3.Database: MySQL Workbench

## Key Features used :
1.Login/Sign Up for both admin and user: Users and Admin registeration and login system
2.Forget Password/Rest Password: Users and Admin can request a password reset link via email
3.Cart: Add, view, and update items in your cart before proceeding to checkout.
4.Shipping: Set up shipping options to deliver your orders efficiently.
5.Orders: Track and view your previous orders.
6.Product Categories: Browse and filter products based on categories.
7.Products: Detailed product pages including size options, images, and descriptions.
8.Users: Manage user profiles and preferences.
9.Payment: Secure payment integration for smooth transactions(using credit cards).

# Installation Guide
## Prerequisites
Before you start, make sure you have these tools installed:
1.Node.js - 
2.-MySQL Workbench
3.Git

## Steps to Set Up
1.Clone the repository to your local machine:
git clone https://github.com/MoeshaHlongwane/Module03.git
cd Module03 - frontend OR cd Module03 - backend

2.Install the necessary dependencies for both the frontend and backend:
For frontend :
npm install,axios,moment
For backend:
npm install nodemailer bcryptjs jsonwebtoken

3.Set Up the Database
Open MySQL Workbench and create a new database called thrifted_warmth.
Import the schema from the provided database/schema.sql file to set up the necessary tables.

4.Configure Environment Variables

Create a .env file in the backend directory and set up the following credentials:
HOST= 'localhost'
USER= 'root'
PASSWORD='root'
DATABASE= 'thrifted_warmth'
EMAIL_USER='mulalomabuda@gmail.com'
EMAIL_PASS='itbd ikog cror oson'

Create a .env file in the frontend directory and set up the following credentials:
VUE_APP_API_URL=http://localhost:5050

## Running the application
Backend: Start the server by running:
cd Module03 - frontend - npm run serve

Frontend: Start the Vue.js frontend by running:
cd Module03 - backend - node --watch index.js
Now, you should be able to open the application by going to http://localhost:8080 in your browser.

## :closed_lock_with_key: Emails and Passwords

The **Credentials** for default logins are
| Panel   |  Email                      | Password |
| ----:   |  :--------------------      | :------: |
| Admin   |   thendo@gmail.com         |   12345  |
| User    | nikiwehlongwane22@gmail.com | 12345    |


## Forgot Password / Reset Password
How It Works:
Forgot Password: When a user forgets their password, they can request a password reset. An email will be sent to them with a secure link containing a token.
Reset Password: When the user clicks the link in the email, they are directed to a page where they can set a new password.

Backend Implementation
Forgot Password Endpoint:

The user sends a request to the backend with their email address.
The backend generates a reset token and sends it to the user's email.
Reset Password Endpoint:

The user clicks the reset link from their email, which takes them to a page where they can submit a new password.
The backend verifies the token and updates the password for the user.

Email Setup
In order to send the password reset email, ensure that you've set up your SMTP credentials in your .env file as shown earlier. You can use services like Mailtrap or SendGrid for testing email delivery.

# THANK YOU!!


















