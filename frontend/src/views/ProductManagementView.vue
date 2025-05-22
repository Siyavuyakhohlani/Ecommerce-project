<template>
  <div class="container mt-5">
    <!-- Centered Heading -->
    <h1 class="text-center mb-4">Admin - Product Management</h1>

    <!-- Centered Add Product Button -->
    <div class="text-center mb-3">
      <button class="btn btn-primary" @click="openAddModal">Add Product</button>
    </div>

    <!-- Product Table with Bootstrap Striped and Hover -->
    <table class="table table-striped table-hover">
      <thead>
        <tr>
          <th>Image</th>
          <th>Name</th>
          <th>Description</th>
          <th>Color</th>
          <th>Price</th>
          <th>Stock</th>
          <th>Category</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="product in products" :key="product.product_id">
          <td>
            <img :src="getImageUrl(product)" alt="Product Image" class="img-thumbnail" width="80">
          </td>
          <td>{{ product.product_name }}</td>
          <td>{{ product.description }}</td>
          <td>{{ product.color }}</td>
          <td>R{{ product.price }}</td>
          <td>{{ product.stock }}</td>
          <td>{{ product.category_name }}</td>
          <td>
            <button class="btn btn-warning btn-sm me-2" @click="openEditModal(product)">Edit</button>
            <button class="btn btn-danger btn-sm" @click="deleteProduct(product.product_id)">Delete</button>
          </td>
        </tr>
      </tbody>
    </table>

    <!-- Product Form Modal -->
    <div class="modal fade" id="productModal" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">{{ isEditing ? 'Edit Product' : 'Add Product' }}</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>
          <div class="modal-body">
            <form @submit.prevent="isEditing ? updateProduct() : addProduct()">
              <div class="mb-3">
                <label class="form-label">Product Name</label>
                <input v-model="data.product_name" type="text" class="form-control" required>
              </div>
              <div class="mb-3">
                <label class="form-label">Description</label>
                <textarea v-model="data.description" class="form-control" required></textarea>
              </div>
              <div class="mb-3">
                <label class="form-label">Color</label>
                <input v-model="data.color" type="text" class="form-control">
              </div>
              <div class="mb-3">
                <label class="form-label">Price (R)</label>
                <input v-model="data.price" type="number" class="form-control" required>
              </div>
              <div class="mb-3">
                <label class="form-label">Stock</label>
                <input v-model="data.stock" type="number" class="form-control" required>
              </div>
              <div class="mb-3">
                <label class="form-label">Category</label>
                <select v-model="data.category_name" class="form-control" required>
                  <option>Men</option>
                  <option>Women</option>
                  <option>Kids</option>
                  <option>Other</option>
                </select>
              </div>
              <div class="mb-3">
                <label class="form-label">Image URL</label>
                <input v-model="data.image_url" type="text" class="form-control" required>
              </div>
              <button type="submit" class="btn btn-success">{{ isEditing ? 'Update' : 'Add' }}</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import { Modal } from 'bootstrap';

export default {
  data() {
    return {
      products: [],
      data: {
        product_id: null,
        product_name: '',
        description: '',
        color: '',
        price: '',
        stock: '',
        category_name: '',
        image_url: ''
      },
      isEditing: false,
      modalInstance: null,
    };
  },
  methods: {
    async fetchProducts() {
      try {
        const response = await axios.get("https://ecommerce-project-6wed.onrender.com/products");
        this.products = response.data.All_Products;
      } catch (error) {
        console.error("Error fetching products:", error);
      }
    },
    getImageUrl(product) {
      let baseUrl = "https://raw.githubusercontent.com/awonkenkibi/images/main/";
      if (product.category_name === "Men") {
        baseUrl += "MenProducts/";
      } else if (product.category_name === "Women") {
        baseUrl += "WomenProducts/";
      } else if (product.category_name === "Kids") {
        baseUrl += "KidsProducts/";
      } else {
        baseUrl += "OtherProducts/";
      }
      return `${baseUrl}${product.image_url.split("/").pop()}`;
    },
    openAddModal() {
      this.isEditing = false;
      this.data = {
        name: '',
        description: '',
        color: '',
        price: '',
        stock: '',
        category_name: '',
        image_url: ''
      };
      this.showModal();
    },
    openEditModal(product) {
      this.isEditing = true;
      this.data = { ...product };
      this.showModal();
    },
    showModal() {
      const modalElement = document.getElementById('productModal');
      this.modalInstance = new Modal(modalElement);
      this.modalInstance.show();
    },
    hideModal() {
      if (this.modalInstance) {
        this.modalInstance.hide();
      }
    },
    async addProduct() {
      try {
        await axios.post("https://ecommerce-project-6wed.onrender.com/products", this.data);
        this.fetchProducts();
        this.hideModal();
      } catch (error) {
        console.error("Error adding product:", error);
      }
    },
    async updateProduct() {
      try {
        await axios.patch(`https://ecommerce-project-6wed.onrender.com/products/${this.data.product_id}`, this.data);
        this.fetchProducts();
        this.hideModal();
      } catch (error) {
        console.error("Error updating product:", error);
      }
    },
    async deleteProduct(product_id) {
      if (confirm("Are you sure you want to delete this product?")) {
        try {
          await axios.delete(`https://ecommerce-project-6wed.onrender.com/products/${product_id}`);
          this.fetchProducts();
        } catch (error) {
          console.error("Error deleting product:", error);
        }
      }
    }
  },
  mounted() {
    this.fetchProducts();
  }
};

</script>
