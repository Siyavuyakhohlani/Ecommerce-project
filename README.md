# THRIFTED WARMTH CLOTHING

Thrifted Warmth is an online platform offering high-quality, pre-owned winter wear with a focus on sustainability, affordability, and style. The website allows customers to shop for stylish second-hand winter coats, manage accounts, track orders, and engage in secure transactions, all while supporting eco-friendly fashion
## Table of content
- Live Demo
- Technologies Used
- Setup Instructions
- Key Features
- Usage Instructions
- Potential Improvement
- Credits
- Authors
# Live Demo
## Technologies Used
- **Front-end:** CSS, Javascript,Vue.js
- **Styling:**   Bootsrap, Custom CSS
- **Back-end:**  Node.js
- **Database:**  MySQL
- **Other:**     Axios,Moment.js,Nodemailer,Bcrypt,Jsonwebtoken
## Setup Instructions
Follow these steps to run the Thrifted Warmth website on your local development environment:
1. **Prerequisites:**
    Node.js
    MySQL Workbench
    Git
2. **Clone the Repository:**
    bash
    git clone (https://github.com/Siyavuyakhohlani/Ecommerce-project.git)
    cd frontend and cd backend folders
3. **Install Dependencies:**
For frontend:
    npm install axios moment
For Backend:
    npm install nodemailer bcrypt jsonwebtoken
4.  **Database Setup:**
    Open MySQL Workbench and create a new datbase named thrifted_warmth.
    Import the database schema from the provided schema.sql file to set up the necessary tables
5. Configure Environment Variables:
Create a .env file in the backend directory and set up the following credentials:
    HOST='localhost'
    USER='root'
    PASSWORD='Siyavuya@2018'
    DATABASE='thrifted_warmth'
    EMAIL_USER='mulalomabuda@gmail.com'
    EMAIL_PASS='itbd ikog cror oson'
Create a .env file in the frontend directory and set the following:
    VUE_APP_API_URL=http://localhost:5050
6. Running the  application:
For the backend server:
    cd Module03-backend
node --watch index.js
For the frontend:
    cd Module03-frontend
npm run serve
Now, open your browser and go to http://localhost:8080 to view the website.
## Key Features
This e-commerce website implements the following key features:
* **User Login and Registration:** SUsers can securely register and log in to their accounts.
* **Forget/Reset Password:** Users can request a password reset link, and securely change their password.
* **User Interface Design and UX/UI Principles:** A user-friendly and visually appealing design adhering to UX/UI best practices.
* **Order Management:** Users can track their previous orders.
* **Shopping Cart and Order Process:**  Users can add items to their cart, view the cart, and proceed to checkout.
* **Shipping Options:** Efficient delivery of orders via different shipping methods.
* **Product Categories and Filters:** Browse products based on categories, with the ability to filter results.
* **Product Information:** Each product has a detailed page with size options, images, and descriptions.
* **Responsive Design Implementation:** The website adapts seamlessly to various screen sizes.
* **Database Design and Implementation:** A well-structured database (`thfirted_warmth`) to store user, product, and order data.
* **Product/Service Data Management:**  administrative interface for adding, editing, and deleting products.
* **Payment System Integration:** Secure payment system via credit card integration.
* **Email Notifications:** Users receive an email for password resets and other important updates.
* **Admin Panel:** Admins can manage users, view orders, and maintain products.
* **Overall System Integration (Front-end and Back-end):** Seamless communication and data flow between the user interface and the server-side logic.
# Usage Instructions
1. Login: Use the default credentials for Admin or User:
- Admin: thendo@gmail.com with password 12345
- User: nikiwehlongwane22@gmail.com with password 12345
- Or you can sign up as new user
2. Shopping: Browse products, add them to the cart, and proceed to checkout.
3. Password Reset: If you forget your password, request a reset link via email and set a new password.
## Potential Improvements
* Advanced Search: Implement a search feature with filters like price range, brand, or condition of the product.
* User Order History: Allow users to view a detailed history of their purchases.
* Wishlist: Enable users to add items to a wishlist for future purchases.
* Product Ratings and Reviews: Users can rate and review products they've bought.
* Payment Gateway Integration: Integrate with an actual payment gateway for live transactions.
## Credits
- **Pintrest**: For providing free images (https://za.pinterest.com/)
-  **MySQL**: For managing the database
- **GitHub**: For hosting the code repository
- **Vue.js**: Frontend framework for building the user interface
- **Node.js**: Backend platform for handling server-side logic
-  **Bootstrap**: For the responsive, mobile-first design framework
## Authors
names:
Moesha Hlongwane, Mulalo Mabuda, Siyavuya Khohlani, Awonke Nkibi
emails:
nikiwehlongwane22@gmail.com, mulalomabuda@gmail.com,siyavuyakhohlani2@gmail.com, awonkenkibi7@gmail.com
github profiles:
MoeshaHlongwane, Mulalo-mab, Siyavuyakhohlani, awonkenkibi
here is the correct one ?
(584 kB)
https://awonkenkibi.github.io/images/homepage_screenshot.png
(418 kB)
https://awonkenkibi.github.io/images/add-to-cart.gif
GitHubGitHub
GitHub - awonkenkibi/images
Contribute to awonkenkibi/images development by creating an account on GitHub. (34 kB)
https://github.com/awonkenkibi/images
GitHubGitHub
GitHub - MoeshaHlongwane/Module03
Contribute to MoeshaHlongwane/Module03 development by creating an account on GitHub. (40 kB)

(584 kB)
https://awonkenkibi.github.io/images/homepage_screenshot.png


(418 kB)
https://awonkenkibi.github.io/images/add-to-cart.gif


GitHubGitHub
GitHub - awonkenkibi/images
Contribute to awonkenkibi/images development by creating an account on GitHub. (34 kB)
https://github.com/awonkenkibi/images


GitHubGitHub
GitHub - MoeshaHlongwane/Module03
Contribute to MoeshaHlongwane/Module03 development by creating an account on GitHub. (40 kB)
