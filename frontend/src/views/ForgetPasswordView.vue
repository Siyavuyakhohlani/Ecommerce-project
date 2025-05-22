<template>
  <div class="container">
    <h2>Forgot Password</h2>
    <p>Enter your email to receive a password reset link.</p>
    
    <form @submit.prevent="requestReset">
      <input 
        v-model="email" 
        type="email" 
        placeholder="Enter your email" 
        required
        aria-label="Email"
      />
      
      <button type="submit" :disabled="loading">
        {{ loading ? "Sending..." : "Send Reset Link" }}
      </button>
    </form>

    <p v-if="message" :class="{ success: success, error: !success }">
      {{ message }}
    </p>
  </div>
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
import axios from "axios";

export default {
  data() {
    return {
      email: "",
      message: "",
      success: false,
      loading: false,
    };
  },
  methods: {
    async requestReset() {
      this.loading = true;
      this.message = "";
      this.success = false;
      
      try {
        const response = await axios.post("https://ecommerce-project-6wed.onrender.com/api/request-reset", { email: this.email });
        this.message = response.data.message;
        this.success = true;
      } catch (error) {
        this.message = error.response?.data?.error || "Something went wrong.";
        this.success = false;
      } finally {
        this.loading = false;
      }
    },
  },
};
</script>

<style scoped>
.footer {
  background: #8B4513;
  padding: 20px;
  color:black;
  position: fixed;
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
.container { 
  max-width: 400px; 
  margin: auto; 
  text-align: center; 
  padding: 20px; 
}

input, button { 
  display: block; 
  width: 100%; 
  margin-top: 10px; 
  padding: 12px; 
  font-size: 16px;
}

button {
  background: #007bff;
  color: white;
  border: none;
  cursor: pointer;
}

button:disabled {
  background: #a0a0a0;
  cursor: not-allowed;
}

.success { color: green; }
.error { color: red; }
</style>
