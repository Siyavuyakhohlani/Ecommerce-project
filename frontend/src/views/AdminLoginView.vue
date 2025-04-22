<template>
  <div class="admin-login hero">
  <div class="d-flex justify-content-center align-items-center min-vh-100">
    <div class="card p-4 shadow-lg" style="width: 400px;">
      <h1 class="text-center">Admin Login</h1>
      <form @submit.prevent="handleAdminLogin">
        <div class="mb-3">
          <label for="email" class="form-label">Email:</label>
          <input type="email" class="form-control" v-model="formData.email" required />
        </div>
        <div class="mb-3">
          <label for="password" class="form-label">Password:</label>
          <input type="password" class="form-control" v-model="formData.password" required />
        </div>
        <div class="text-center">
          <button type="submit" class="btn btn-danger w-100" :disabled="loading">
            {{ loading ? "Logging in..." : "Login" }}
          </button>
        </div>
        <div v-if="errorMessage" class="alert alert-danger mt-3 text-center">
          {{ errorMessage }}
        </div>

        <!-- Links for Admin Register and User Login -->
        <div class="mt-3 text-center">
          <p>Don't have an admin account? 
            <button @click="goToAdminRegister" class="btn btn-link p-0">Register as Admin</button>
          </p>
          <p>Are you a regular user? 
            <button @click="goToUserLogin" class="btn btn-link p-0">Go to User Login</button>
          </p>
        </div>
      </form>
    </div>
  </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      formData: { email: "", password: "" },
      loading: false,
      errorMessage: ""
    };
  },
  methods: {
    async handleAdminLogin() {
      this.loading = true;
      this.errorMessage = "";

      try {
        const response = await axios.post("http://localhost:5050/api/auth/admin/login", this.formData);

        if (response.data.user_id) {
          localStorage.setItem("user_id", response.data.user_id);
          localStorage.setItem("role", response.data.role);
          
          alert("Admin Login successful!");
          this.$router.push("/admin");
        }
      } catch (error) {
        this.errorMessage = error.response?.data?.error || "Login failed. Please try again.";
      } finally {
        this.loading = false;
      }
    },
    goToAdminRegister() {
      this.$router.push({ name: "adminRegister" });
    },
    goToUserLogin() {
      this.$router.push({ name: "login" }); // Assuming "login" is the route name for user login
    }
  }
};
</script>
<style scoped>
  .admin-login {
  background-image: url("../assets/background01.jpg");
  font-family: 'Playfair Display', serif;
}
.hero {
  position: relative;
  background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5));
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.hero::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-image: url("../assets/background01.jpg");
  background-size: cover;
  background-position: center;
  filter: blur(3px);
  z-index: -1;
}
.login .card {
  background-color: #ffffff2d;
}
.card {
  border-radius: 12px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  background-color: #ffffff2d;
  width: 100%;
  max-width: 400px;
}
h1 {
  font-family: 'Playfair Display', serif;
  font-size: 2rem;
  color: #333;
  font-weight: 700;
}
label {
  font-family: 'Arial', sans-serif;
  color: #333;
  font-size: 1.1rem;
  font-weight: 600;
  margin-bottom: 0.75rem;
}
input {
  border-radius: 8px;
  padding: 0.8rem 1rem;
  font-size: 1rem;
  border: 1px solid #ccc;
  transition: border 0.3s ease-in-out;
}
input:focus {
  border-color: #007BFF;
  box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
  outline: none;
}
button {
  padding: 0.8rem;
  font-size: 1.1rem;
  border-radius: 8px;
  border: none;
  /* background-color: #8B4513; */
  color: white;
  transition: background-color 0.3s ease;
}
button:focus {
  outline: none;
  box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
}
button:disabled {
  background-color: #aaa;
  cursor: not-allowed;
}
.btn-link{
  color: #007BFF;
}
.text-center p {
  font-size: 1rem;
}
.register-link {
  color: #007BFF;
  font-size: 1rem;
  text-decoration: none;
}
.register-link:hover {
  text-decoration: underline;
}
.mb-3 {
  margin-bottom: 1.25rem;
}
/*  1024px (Large Screens) */
@media (max-width: 1024px) {
  .card {
    width: 300px;
  }
}
/*  992px (Medium Screens like tablets) */
@media (max-width: 992px) {
  .login .card {
    width: 80%;
  }
  h1 {
    font-size: 1.8rem;
  }
  label {
    font-size: 1rem;
  }
  input,
  button {
    font-size: 1rem;
  }
}
/*  768px (Tablets or smaller devices) */
@media (max-width: 768px) {
  .login .card {
    max-width: 95%;
    padding: 20px;
  }
  h1 {
    font-size: 1.6rem;
  }
  label {
    font-size: 1rem;
  }
  input,
  button {
    font-size: 1rem;
  }
}
/* 576px (Mobile Devices) */
@media (max-width: 576px) {
  .login .card {
    max-width: 100%;
    padding: 15px;
  }
  h1 {
    font-size: 1.5rem;
  }
  label {
    font-size: 0.9rem;
  }
  input,
  button {
    font-size: 0.9rem;
  }
}
/* 320px (Small Mobile Devices) */
@media (max-width: 320px) {
   .card {
    max-width:100%;
    padding: 10px;
    margin: 0;
    box-sizing: border-box;
  }
  .hero{
    padding: 10px;
  }
  h1 {
    font-size: 1.3rem;
    text-align: center;
  }
  label {
    font-size: 0.9rem;
    margin-bottom: 0.5rem;
  }
  input,
  button {
    font-size: 0.9rem;
    padding: 0.8rem 1rem;
  }
  button{
    width: 100%;
  }
  .navbar-toggler{
    width:auto;
  }
}
  </style>