<template>
  <div>
    <!-- Hide all navbars on login pages -->
    <Navbar v-if="showUserNavbar" />
    <AdminNavbar v-if="showAdminNavbar" />

    <router-view />
  </div>
</template>

<script>
import { computed } from "vue";
import { useRoute } from "vue-router";
import Navbar from "./components/Navbar.vue";
import AdminNavbar from "./components/AdminNavbar.vue";

export default {
  components: {
    Navbar,
    AdminNavbar,
  },
  setup() {
    const route = useRoute();

    // Define login page conditions
    const isUserLoginPage = computed(() => route.path === "/login");
    const isAdminLoginPage = computed(() => route.path === "/admin/login");
    const isAdminRoute = computed(() => route.path.startsWith("/admin"));

    // Hide navbar on both login pages
    const isLoginPage = computed(() => isUserLoginPage.value || isAdminLoginPage.value);

    return {
      showUserNavbar: computed(() => !isLoginPage.value && !isAdminRoute.value),
      showAdminNavbar: computed(() => !isLoginPage.value && isAdminRoute.value),
    };
  }
};
</script>
