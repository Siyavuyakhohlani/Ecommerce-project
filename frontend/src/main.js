import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

// Import Bootstrap
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.bundle.min.js'

// Import Fonts & Icons
import "@/assets/fonts.css"
import '@fortawesome/fontawesome-free/css/all.min.css'

// Load user data from localStorage
const token = localStorage.getItem("token")
const role = localStorage.getItem("role")

if (token) {
  store.dispatch("setUser", { token, role }) // Set user state globally
}

createApp(App).use(store).use(router).mount('#app')
