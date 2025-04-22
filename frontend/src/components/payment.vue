<template>
  <div class="payment">
    <h2>Payment</h2>
    <p><strong>Order ID:</strong> {{ orderId }}</p>
    <p><strong>Amount to Pay:</strong> ${{ amount }}</p>
    <h3>Enter Payment Details</h3>
    <select v-model="paymentMethod">
      <option value="Credit Card">Credit Card</option>
      <option value="PayPal">PayPal</option>
      <option value="Bank Transfer">Bank Transfer</option>
    </select>
    <div v-if="paymentMethod === 'Credit Card'">
      <input v-model="card.card_number" placeholder="Card Number" required />
      <input v-model="card.card_expiry" placeholder="Expiry Date (MM/YY)" required />
      <input v-model="card.card_cvc" placeholder="CVC" required />
    </div>
    <button @click="processPayment">Pay Now</button>
  </div>
</template>
<script>
import axios from "axios";
import bcrypt from "bcryptjs";
export default {
  data() {
    return {
      orderId: this.$route.params.orderId,
      amount: 0,
      paymentMethod: "Credit Card",
      card: {
        card_number: "",
        card_expiry: "",
        card_cvc: "",
      },
    };
  },
  async created() {
    const userId = localStorage.getItem("user_id");
    const response = await axios.get(`${process.env.VUE_APP_API_URL}/api/checkout/${userId}`);
    const order = response.data.orderItems.find((o) => o.order_id == this.orderId);
    this.amount = order ? order.price * order.quantity : 0;
  },
  methods: {
    async processPayment() {
      try {
        let encryptedCard = {};
        if (this.paymentMethod === "Credit Card") {
          encryptedCard.card_number = await bcrypt.hash(this.card.card_number, 10);
          encryptedCard.card_expiry = await bcrypt.hash(this.card.card_expiry, 10);
          encryptedCard.card_cvc = await bcrypt.hash(this.card.card_cvc, 10);
        }
        const response = await axios.post(`${process.env.VUE_APP_API_URL}/api/payment`, {
          order_id: this.orderId,
          amount: this.amount,
          method: this.paymentMethod,
          card_number: encryptedCard.card_number || null,
          card_expiry: encryptedCard.card_expiry || null,
          card_cvc: encryptedCard.card_cvc || null,
        });
        if (response.data.success) {
          alert("Payment Successful!");
          this.$router.push({ name: "OrderSuccess" });
        } else {
          alert("Payment failed. Try again.");
        }
      } catch (error) {
        console.error(error);
        alert("Payment failed. Try again.");
      }
    },
  },
};
</script>
<style scoped>
.payment {
  padding: 20px;
}
</style>