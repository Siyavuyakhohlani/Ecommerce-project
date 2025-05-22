<template>
  <div class="reset-password-container">
    <h1 class="reset-password-title">Reset Your Password</h1>
    <form @submit.prevent="resetPassword" class="reset-password-form">
      <input
        type="password"
        v-model="newPassword"
        placeholder="Enter new password"
        required
        class="input-field"
      />
      <button type="submit" class="submit-button">Reset Password</button>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      newPassword: "",
      token: null,
      email: null,
    };
  },
  created() {
    // Extract token and email from URL query parameters
    this.token = this.$route.query.token || null;
    this.email = this.$route.query.email || null;

    console.log("Extracted Token:", this.token);
    console.log("Extracted Email:", this.email);
  },
  methods: {
    async resetPassword() {
      if (!this.token || !this.email || !this.newPassword) {
        alert("Invalid request. Missing required fields.");
        return;
      }

      try {
        const response = await fetch("https://ecommerce-project-6wed.onrender.com/api/reset-password", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            token: this.token,
            email: this.email,
            password: this.newPassword,
          }),
        });

        if (!response.ok) {
          const errorText = await response.text();
          console.error("Response error:", errorText);
          alert("Failed to reset password. Please try again.");
          return;
        }

        const responseData = await response.json();
        alert(responseData.message || "Password reset successfully!");
        this.$router.push("/login");
      } catch (error) {
        console.error("Error:", error);
        alert("Something went wrong, please try again.");
      }
    },
  },
};
</script>

<style scoped>
/* General page styling */
.reset-password-container {
  padding: 50px 20px;
  max-width: 400px;
  margin: 100px auto;
  background-color: #f7f7f7;
  border-radius: 8px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  align-items: center;
}

.reset-password-title {
  font-size: 24px;
  font-weight: bold;
  color: #333;
  margin-bottom: 20px;
}

.reset-password-form {
  width: 100%;
}

.input-field {
  width: 100%;
  padding: 12px;
  margin: 10px 0;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 16px;
}

.submit-button {
  width: 100%;
  padding: 12px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 5px;
  font-size: 16px;
  cursor: pointer;
}

.submit-button:hover {
  background-color: #0056b3;
}

@media (max-width: 480px) {
  .reset-password-container {
    margin: 50px auto;
    padding: 30px 15px;
  }

  .reset-password-title {
    font-size: 20px;
  }
}
</style>
