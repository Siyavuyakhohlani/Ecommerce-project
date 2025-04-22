<template>
  <div class="register hero">
    <div class="container mt-5">
      <h1>Admin Registration</h1>
      <form @submit.prevent="handleAdminRegister">
        <div class="mb-3">
          <label for="name" class="form-label">Full Name</label>
          <input
            type="text"
            class="form-control"
            id="name"
            v-model="formData.name"
            placeholder="Enter your full name"
            required
          />
        </div>
        <div class="mb-3">
          <label for="email" class="form-label">Email Address</label>
          <input
            type="email"
            class="form-control"
            id="email"
            v-model="formData.email"
            placeholder="example@example.com"
            required
          />
        </div>
        <div class="mb-3">
          <label for="password" class="form-label">Password</label>
          <input
            type="password"
            class="form-control"
            id="password"
            v-model="formData.password"
            placeholder="Enter your password"
            required
          />
        </div>
        <div class="mb-3">
          <label for="phoneNumber" class="form-label">Phone Number</label>
          <input
            type="tel"
            class="form-control"
            id="phoneNumber"
            v-model="formData.phoneNumber"
            placeholder="Enter your phone number"
            required
          />
        </div>
        <div class="mb-3">
          <label for="address" class="form-label">Address</label>
          <textarea
            class="form-control"
            id="address"
            v-model="formData.address"
            placeholder="Enter your address"
            required
          ></textarea>
        </div>
        <button type="submit" class="btn btn-danger w-100">Register</button>
        <p class="mt-3 text-center">
          Already have an account? <router-link to="/admin/login">Login as Admin</router-link>
        </p>
      </form>
    </div>
    </div>
  </template>
  
  <script>
  import axios from "axios";
  
  export default {
    data() {
      return {
        formData: {
          name: "",
          email: "",
          password: "",
          phoneNumber: "",
          address: "",
        },
        message: "",
      };
    },
    methods: {
      async handleAdminRegister() {
        try {
          const response = await axios.post("http://localhost:5050/api/auth/admin/register", this.formData);
          alert(response.data.message || "Admin registered successfully!");
          this.$router.push("/admin/login");
        } catch (error) {
          console.error("Error registering admin:", error);
          this.message = error.response?.data?.error || "Registration failed. Try again.";
        }
      },
      goToAdminLogin() {
        this.$router.push({ name: "adminLogin" });
      },
    }
  };
  </script>
  <style scoped>
  .register {
    background-image: url("../assets/background01.jpg");
    font-family: "Playfair Display", serif;
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
    content: "";
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
  .h1-heading {
    font-family: "Playfair Display", serif;
    font-size: 2rem;
    color: #333;
    font-weight: 700;
    text-align: center;
    margin-top: 40px;
  }
  .card {
    border-radius: 12px;
    box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
    background-color: #ffffff2d;
    width: 100%;
    max-width: 400px;
    padding: 20px;
    margin-top: 30px;
    margin-bottom: 30px;
  }
  label {
    font-family: "Arial", sans-serif;
    color: #333;
    font-size: 1.1rem;
    font-weight: 600;
    margin-bottom: 0.75rem;
  }
  input,
  textarea {
    border-radius: 8px;
    padding: 0.8rem 1rem;
    font-size: 1rem;
    border: 1px solid #ccc;
    transition: border 0.3s ease-in-out;
  }
  input:focus,
  textarea:focus {
    border-color: #007BFF;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
    outline: none;
  }
  button {
    padding: 0.8rem;
    font-size: 1.1rem;
    border-radius: 8px;
    border: none;
    background-color: #007BFF;
    color: white;
    transition: background-color 0.3s ease;
  }
  button:hover {
    background-color: #0056B3;
  }
  button:focus {
    outline: none;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
  }
  button:disabled {
    background-color: #aaa;
    cursor: not-allowed;
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
  /* Large screens (1024px and ) */
  @media (max-width: 1024px) {
    .card {
      max-width: 90%;
    }
  }
  /*  (992px ) */
  @media (max-width: 992px) {
    .card {
      max-width: 80%;
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
  /*  (768px tablets) */
  @media (max-width: 768px) {
    .card {
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
  /*  (576px  mobile devices) */
  @media (max-width: 576px) {
    .card {
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
  /*  (320px small mobile devices) */
  @media (max-width: 320px) {
    .card {
      max-width: 100%;
      padding: 10px;
      margin: 0;
      box-sizing: border-box;
      margin-top: 60px;
    }
    .hero {
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
    button {
      width: 100%;
    }
    .footer {
      font-size: 0.9rem;
      padding: 15px;
    }
    .footer p {
      font-size: 0.9rem;
    }
    .social-links a {
      font-size: 18px;
    }
  }
  </style>