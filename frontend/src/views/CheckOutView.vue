<template>
  <br><br><br><br>
  <div class="checkout-container">
    <!-- Shipping Form -->
    <div class="form-container">
      <form @submit.prevent="submitShippingDetails" class="checkout-form">
        <h2>Shipping Details</h2>
        <div class="form-group">
          <input v-model="shippingDetails.name" placeholder="Name" required />
        </div>
        <div class="form-group">
          <input v-model="shippingDetails.address" placeholder="Address" required />
        </div>
        <div class="form-group">
          <input v-model="shippingDetails.city" placeholder="City" required />
        </div>
        <div class="form-group">
          <input v-model="shippingDetails.zipcode" placeholder="Zipcode" required />
        </div>
        <div class="form-group">
          <input v-model="shippingDetails.country" placeholder="Country" required />
        </div>
        <button type="submit" class="btn-primary">Save Shipping Details</button>
      </form>
    </div>

    <!-- Payment Form -->
    <div class="form-container">
      <form @submit.prevent="submitPayment" class="checkout-form">
        <h2>Payment Details</h2>
        <p class="total-amount">Total Amount: {{ totalAmount }}</p>
        <!-- Card Payment Form -->
        <h3>Card Payment</h3>
        <div class="form-group">
          <label for="card_number">Card Number</label>
          <input v-model="cardDetails.card_number" type="text" placeholder="1234 5678 9101 1121" required maxlength="16" />
        </div>
        <div class="form-group">
          <label for="card_expiry">Expiry Date (MM/YY)</label>
          <input v-model="cardDetails.card_expiry" type="text" placeholder="MM/YY" required />
        </div>
        <div class="form-group">
          <label for="card_cvc">CVC</label>
          <input v-model="cardDetails.card_cvc" type="text" placeholder="123" required maxlength="3" />
        </div>
        <button type="submit" class="btn-primary">Proceed to Payment</button>
      </form>
    </div>

    <!-- Payment Success Modal -->
    <div v-if="showModal" class="modal">
      <div class="modal-content">
        <h2>Payment Successful!</h2>
        <p>Your payment has been successfully processed.</p>
        <button @click="redirectToConfirmation" class="btn-primary">OK</button>
      </div>
    </div>
  </div>
  <br><br><br><br><br>
  <footer class="footer text-center text-white">
      <div class="container">
        <p>&copy; 2025 Thrifted Winter Coats | 123 Winter Lane, Cape Town</p>
        <div class="social-links">
          <a href="#"><i class="fab fa-twitter"></i></a>
          <a href="#"><i class="fab fa-facebook"></i></a>
          <a href="#"><i class="fab fa-instagram"></i></a>
        </div>
      </div>
    </footer>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      user_id: this.getUserId(), // Dynamically fetch user ID
      shippingDetails: {
        name: '',
        address: '',
        city: '',
        zipcode: '',
        country: ''
      },
      totalAmount: 0, // This will be fetched from the cart
      cardDetails: {
        card_number: '',
        card_expiry: '',
        card_cvc: ''
      },
      order_id: null, // Set this when order is created
      showModal: false, // Add this to control the modal visibility
      cartItems: [] // Add this to store cart items
    };
  },
  created() {
    this.fetchCheckoutDetails();
  },
  methods: {
    // Function to fetch the user ID dynamically (can be from localStorage, Vuex, or other means)
    getUserId() {
      // Check localStorage first
      let userId = localStorage.getItem("user_id");
      // If no user_id in localStorage, consider checking other sources (like Vuex or API)
      if (!userId) {
        // Potential fallback if there's no user_id saved in localStorage
        userId = 'default_user_id'; // Replace this with actual fallback logic
      }
      return userId;
    },
    async fetchCheckoutDetails() {
      try {
        const response = await axios.get(`http://localhost:5050/api/checkout/${this.user_id}`);
        const { userDetails, cartItems } = response.data;
        this.cartItems = cartItems; // Store cart items
        // Calculate total amount from cart items
        this.totalAmount = cartItems.reduce((total, item) => total + item.total_price, 0);
      } catch (error) {
        console.error("Error fetching checkout details:", error);
      }
    },
    async submitShippingDetails() {
      // Validate the shipping details before sending
      if (!this.shippingDetails.name || !this.shippingDetails.address || !this.shippingDetails.city || !this.shippingDetails.zipcode || !this.shippingDetails.country) {
        alert("Please fill in all fields.");
        return;
      }
      try {
        // Log the shipping details to check if they are correct
        console.log("Shipping Details:", this.shippingDetails);
        const response = await axios.post(`http://localhost:5050/api/checkout/${this.user_id}/shipping`, this.shippingDetails);
        alert('Shipping details saved!');
      } catch (error) {
        // Log the full error response for more details
        console.error('Error saving shipping details:', error.response ? error.response.data : error);
        alert('Error saving shipping details.');
      }
    },
    async submitPayment() {
      if (!this.cardDetails.card_number || !this.cardDetails.card_expiry || !this.cardDetails.card_cvc) {
        alert("Please enter all card details.");
        return;
      }
      const cardValidation = this.validateCardDetails();
      if (!cardValidation.isValid) {
        alert(cardValidation.message);
        return;
      }
      try {
        const paymentData = {
          user_id: this.user_id,
          amount: this.totalAmount,
          method: 'credit_card',
          card_number: this.cardDetails.card_number,
          card_expiry: this.cardDetails.card_expiry,
          card_cvc: this.cardDetails.card_cvc
        };
        const response = await axios.post(`http://localhost:5050/api/checkout/${this.user_id}/payment`, paymentData);

        // If payment is successful, create an order
        if (response.data.success) {
          const orderData = {
            user_id: this.user_id,
            cartItems: this.cartItems,
            total_price: this.totalAmount,
            shipping_details: this.shippingDetails
          };
          const orderResponse = await axios.post(`http://localhost:5050/api/checkout/`, orderData);

          if (orderResponse.data.success) {
            this.showModal = true; // Show success modal
          } else {
            alert("Failed to create order.");
          }
        }
      } catch (error) {
        console.error('Error processing payment:', error);
        alert('Error processing payment.');
      }
    },
    validateCardDetails() {
      const { card_number, card_expiry, card_cvc } = this.cardDetails;
      // Validate card number (16 digits)
      const cardNumberRegex = /^[0-9]{16}$/;
      if (!cardNumberRegex.test(card_number)) {
        return { isValid: false, message: "Card number must be 16 digits." };
      }
      // Validate expiry date (MM/YY)
      const expiryDateRegex = /^(0[1-9]|1[0-2])\/?([0-9]{2})$/;
      if (!expiryDateRegex.test(card_expiry)) {
        return { isValid: false, message: "Invalid expiry date format. Use MM/YY." };
      }
      // Validate CVC (3 digits)
      const cvcRegex = /^[0-9]{3}$/;
      if (!cvcRegex.test(card_cvc)) {
        return { isValid: false, message: "CVC must be 3 digits." };
      }
      return { isValid: true, message: "" };
    },
    // Redirect to confirmation page
    redirectToConfirmation() {
      this.$router.push({ name: 'confirmation' });
    }
  }
};
</script>

<style scoped>
/* Apply Poppins font family */
body, html, #app {
  font-family: 'Poppins', sans-serif;
}

.checkout-container {
  display: flex;
  justify-content: space-between;
  gap: 20px;
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}

.form-container {
  flex: 1;
  background: #fff;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.checkout-form {
  display: flex;
  flex-direction: column;
}

h2 {
  font-size: 1.5em;
  margin-bottom: 1em;
  color: #333;
}

h3 {
  font-size: 1.2em;
  margin-bottom: 1em;
  color: #555;
}

.form-group {
  margin-bottom: 1em;
}

label {
  display: block;
  margin-bottom: 0.5em;
  color: #555;
}

input {
  width: 100%;
  padding: 0.75em;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1em;
}

input:focus {
  border-color: #007bff;
  outline: none;
}

.total-amount {
  font-size: 1.2em;
  font-weight: bold;
  color: #333;
  margin-bottom: 1em;
}

.btn-primary {
  background-color: #007bff;
  color: white;
  border: none;
  padding: 0.75em;
  border-radius: 4px;
  font-size: 1em;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.btn-primary:hover {
  background-color: #0056b3;
}

/* Modal Styles */
.modal {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
}

.modal-content {
  background-color: white;
  padding: 2em;
  border-radius: 8px;
  text-align: center;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.modal-content h2 {
  margin-bottom: 1em;
  color: #333;
}

.modal-content p {
  margin-bottom: 1.5em;
  color: #555;
}
.footer {
  background: #8B4513;
  padding: 20px;
  color:black;
  /* position: fixed; */
  bottom: 0;
  left: 0;
  width: 100%;
}
.footer p {
  color: var(--text-light);
  font-family: 'Poppins', sans-serif;
}
.social-links a {
  color: var(--text-light);
  font-size: 20px;
  margin: 0 10px;
}
</style>