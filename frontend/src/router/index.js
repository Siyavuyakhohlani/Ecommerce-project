import { createRouter, createWebHashHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import ProductsView from '../views/ProductsView.vue'
import LoginView from '@/views/LoginView.vue'
import register from '@/components/register.vue'
import AboutView from '@/views/AboutView.vue'
import ProductDetails from '../components/ProductDetails.vue'
import CartView from '../views/CartView.vue'
import CheckOutView from '@/views/CheckOutView.vue'
import payment from '@/components/payment.vue'
import ForgetPasswordView from '../views/ForgetPasswordView.vue'
import ResetPasswordView from '../views/ResetPasswordView.vue'
import ConfirmationView from '@/views/ConfirmationView.vue'

// Admin
import AdminDashboardView from '@/views/AdminDashboardView.vue';
import ProductManagementView from '@/views/ProductManagementView.vue';
import OrderManagementView from '@/views/OrderManagementView.vue';
import AdminLoginView from '@/views/AdminLoginView.vue';
import AdminRegisterView from '@/views/AdminRegisterView.vue';
import UsersView from '@/views/UsersView.vue';





function authGuard(to, from, next) {
  const role = localStorage.getItem("role");
  if (role === "admin") {
    next();
  } else {
    next("/login"); // Redirect if not admin
  }
}

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path:'/login',
    name:'login',
    component: LoginView
  },
  {
    path:'/register',
    name:'register',
    component: register
  },
  {
    path:'/confirmation',
    name:'confirmation',
    component: ConfirmationView
  },
  {
    path:'/forgot-password',
    name:'forgot-password',
    component: ForgetPasswordView
  },
  {
    path: "/reset-password",
    name: "reset-password",
    component: ResetPasswordView,
    props: route => ({
      token: route.query.token,
      email: route.query.email
    })
  },
  {
    path: '/products',
    name: 'products',
    component: ProductsView
  },
  {
    path: '/about',
    name: 'about',
    component: AboutView
  },
  {
    path: '/cart',
    name: 'cart',
    component: CartView
  },
  {
    path: '/checkout',
    name: 'checkout',
    component: CheckOutView
  },
  {
    path: "/product/:id",
    name: "ProductDetails",
    component: ProductDetails,
    props: (route) => ({
      product: JSON.parse(route.query.product),
    }),
  },
  {
    path: "/payment",
    name: "payment",
    component: payment
  },
  {
    path: "/admin",
    name: "Dashboard",
    component: AdminDashboardView,
    beforeEnter: authGuard // Protect admin routes
  },
  {
    path: "/admin/products",
    name: "Product",
    component: ProductManagementView,
    beforeEnter: authGuard // Protect admin routes
  },
  {
    path: "/admin/orders",
    name: "Orders", 
    component: OrderManagementView,
    beforeEnter: authGuard // Protect admin routes
  },
  {
    path: "/admin/login",
    name: "adminLogin",
    component: AdminLoginView,
  },
  {
    path: "/admin/users",
    name: "users",
    component: UsersView,
  },
  {
    path: "/admin/register",
    name: "adminRegister",
    component: AdminRegisterView
  }
  
]
const router = createRouter({
  history: createWebHashHistory(),
  routes
});


export default router