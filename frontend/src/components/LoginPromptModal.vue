<template>
    <div class="modal fade" id="loginPromptModal" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Login Required</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <p>You need to login or register to continue.</p>
          </div>
          <div class="modal-footer">
            <router-link to="/login" class="btn btn-warning">Login</router-link>
            <router-link to="/register" class="btn btn-secondary">Register</router-link>
          </div>
        </div>
      </div>
    </div>
</template>
  
<script>
  export default {
    methods: {
      show() {
        const modal = new bootstrap.Modal(document.getElementById('loginPromptModal'));
        modal.show();
      }
    }
  };
</script>
  