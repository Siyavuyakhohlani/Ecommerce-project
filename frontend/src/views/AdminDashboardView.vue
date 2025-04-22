<template>
  <div class="dashboard-container">
    <!-- Background Image with Blur Effect -->
    <div class="background-image"></div>
      <div>
      </div>
      <div class="p-6 relative z-10">
      <h1 class="text-2xl font-bold text-white animate-fade-in"></h1>
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 mt-4">
        <div class="p-4 bg-blue-500 text-white rounded animate-slide-in hover:scale-105 transition-transform">
        </div>
      </div>      <!-- Picture Slot -->
      <div class="mt-8">
        <div class="picture-slot animate-pulse"> 
          <img :src="backgroundpic" alt="Placeholder Image" class="rounded-lg" />
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import AdminNavbar from "@/components/AdminNavbar.vue";
export default {
  data() {
    return {
      backgroundpic: require("@/assets/knitwear.jpg"), // Correct path to the image
    };
  },
  components: { AdminNavbar },
};
</script>
<style scoped>
/* Dashboard Container */
.dashboard-container {
  position: relative;
  min-height: 100vh;
  overflow: hidden;
}
/* Background Image with Blur Effect */
.background-image {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-size: cover;
  background-position: center;
  filter: blur(8px); /* Apply blur effect */
  z-index: 1;
}
/* Overlay to darken the background */
.dashboard-container::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5); /* Dark overlay */
  z-index: 10;
}
/* Ensure content is above the background */
.p-6 {
  position: relative;
  z-index: 3;
}
/* Picture Slot Styling */
.picture-slot {
  max-width: 100%;
  margin: 0 auto;
  position: relative;
  background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5));
  height: 3vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.picture-slot img {
  width: 100%;
  height: auto;
  border: 2px solid #fff; /* Optional: Add a border */
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Optional: Add a shadow */
}
/* Animations */
@keyframes fade-in {
  from {
    opacity: 0;
    transform: translateY(-20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
@keyframes slide-in {
  from {
    opacity: 0;
    transform: translateX(-100%);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}
@keyframes pulse {
  0% {
    transform: scale(1);
  }
  50% {
    transform: scale(1.05);
  }
  100% {
    transform: scale(1);
  }
}
.animate-fade-in {
  animation: fade-in 1s ease-out;
}
.animate-slide-in {
  animation: slide-in 1s ease-out;
}
.animate-pulse {
  animation: pulse 2s infinite;
}
/* Hover Effect */
.hover\:scale-105:hover {
  transform: scale(1.05);
}
.transition-transform {
  transition: transform 0.3s ease;
}
</style>