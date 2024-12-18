<template>
  <div class="forget-password">
    <h1>Forgot your Password?</h1>
    <h2>Enter your email to reset it</h2>
    
    <form @submit.prevent="handleResetPassword" class="form-container">
      <input v-model="email" type="email" placeholder="Enter your email" required />
      <button type="submit">Reset Password</button>
    </form>
    <p v-if="message" class="message">{{ message }}</p>
    <p v-if="errorMessage" class="error-message">{{ errorMessage }}</p>
    <p>Remember? <router-link to="/login">Login</router-link></p>
  </div>
</template>

<script>
export default {
  name: "ForgetPassword",
  data() {
    return {
      email: "",
      message: "",
      errorMessage: "",
    };
  },
  methods: {
    async handleResetPassword() {
      console.log("Resetting password for:", this.email);
      try {
        const response = await fetch('http://localhost:8000/api/forgot-password', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ email: this.email }),
        });
        const data = await response.json();
        if (response.ok) {
          this.message = data.message;
          this.errorMessage = '';
        } else {
          this.errorMessage = data.message || 'Failed to send reset link';
          this.message = '';
        }
      } catch (err) {
        this.errorMessage = 'An error occurred. Please try again.';
        this.message = '';
      }
    },
  },
};
</script>

<style scoped>
.form-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 10px;
}

.forget-password {
  text-align: center;
  padding: 50px;
  background-color: #84592B;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 83vh;
  display: flex;
}
h1{
  color:#e8D1A7;
}
input {
  margin: 10px;
  padding: 10px;
  width: 100%;
  max-width: 300px;
  font-size: 16px;
  border-radius: 5px;
  border: 1px solid #ccc;
}

button {
  padding: 10px 10px;
  font-size: 16px;
  cursor: pointer;
  display: flex;
  border-radius: 15px;
  text-align: center;
  margin: auto;
  background-color: #743014;
  border: none;
}

.message {
  color: green;
  margin-top: 20px;
}

.error-message {
  color: red;
  margin-top: 20px;
}
</style>
