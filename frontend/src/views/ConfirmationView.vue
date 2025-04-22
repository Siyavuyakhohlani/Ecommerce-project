<template>
  <div class="confirmation-container">
    <div class="confirmation-card">
      <h1>Confirmation</h1>
      <p>Your order has been successfully processed!</p>
      <p>Thank you for your purchase. You will receive a confirmation email shortly.</p>
      <button @click="goHome" class="btn-primary">Go to Home</button>
    </div>
  </div>
  <br>
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
export default {
  name: 'ConfirmationView',
  methods: {
    goHome() {
      // Redirect to the home page or another page after confirmation
      this.$router.push('/');
    }
  }
};
</script>

<style scoped>
/* Apply Poppins font family */
body, html, #app {
  font-family: 'Poppins', sans-serif;
}

.confirmation-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: #f8f9fa;
  padding: 20px;
}

.confirmation-card {
  background: #fff;
  padding: 40px;
  border-radius: 8px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  text-align: center;
  max-width: 500px;
  width: 100%;
}

h1 {
  font-size: 2em;
  color: #4CAF50;
  margin-bottom: 20px;
}

p {
  font-size: 1.2em;
  color: #555;
  margin: 10px 0;
}

.btn-primary {
  background-color: #007bff;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 4px;
  font-size: 1.1em;
  cursor: pointer;
  margin-top: 20px;
  transition: background-color 0.3s ease;
}

.btn-primary:hover {
  background-color: #0056b3;
}
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
</style>