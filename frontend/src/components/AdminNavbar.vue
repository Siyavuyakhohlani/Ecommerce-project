<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4">
    <a class="navbar-brand fw-bold" href="#">Admin Panel</a>
    <button
      class="navbar-toggler"
      type="button"
      data-bs-toggle="collapse"
      data-bs-target="#adminNavbar"
      aria-controls="adminNavbar"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="adminNavbar">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <router-link to="/admin" class="nav-link">Home</router-link>
        </li> <!--style home page, use fontend pictures-->
        <li class="nav-item">
          <router-link to="/admin/products" class="nav-link">Products</router-link>
        </li>
        <li class="nav-item">
          <router-link to="/admin/orders" class="nav-link">Orders</router-link>
        </li>
        <li class="nav-item">
          <router-link to="/admin/users" class="nav-link">Users</router-link>
        </li>
        <!-- Authentication Links -->
        <li class="nav-item">
          <router-link v-if="!isAuthenticated" to="/login" class="nav-link" @click="hideMenu">Login</router-link>
          <button v-else class="btn btn-link nav-link" @click="logout">Logout</button>
        </li>
      </ul>
    </div>
  </nav>
</template>
<script>
export default {
  data() {
    return {
      isAuthenticated: false,
    };
  },
  methods: {
    hideMenu() {
      // This hides the menu when a link is clicked (useful for mobile view)
      const navbar = document.getElementById("adminNavbar");
      if (navbar.classList.contains("show")) {
        navbar.classList.remove("show");
      }
    },
    checkAuth() {
      // Check if the user is authenticated
      this.isAuthenticated = !!localStorage.getItem("user_id");
    },
    logout() {
      // Remove user authentication data and redirect to login
      localStorage.removeItem("user_id");
      this.isAuthenticated = false;
      this.$router.push({ name: "login" });
    }
  },
  watch: {
    "$route"() {
      this.checkAuth(); // Check authentication on every route change
    }
  },
  mounted() {
    this.checkAuth(); // Run auth check when component is loaded
  }
};
</script>