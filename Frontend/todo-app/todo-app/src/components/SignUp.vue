<template>
  <div class="signup">
    <h1>Start a quest today!</h1>
    <form @submit.prevent="registerUser" class="form-container">
      <div class="input-container">
        <input v-model="email" type="email" placeholder="Email" required />
      </div>
      <div class="input-container">
        <input v-model="username" type="text" placeholder="Username" required />
      </div>
      <div class="input-container">
        <input v-model="password" type="password" placeholder="Password" required />
      </div>
      <div class="input-container">
        <input v-model="confirmPassword" type="password" placeholder="Confirm Password" required />
      </div>
      <button type="submit">Sign Up</button>
    </form>
    <p v-if="successMessage" class="success-message">{{ successMessage }}</p>
    <p v-if="errorMessage" class="error-message">{{ errorMessage }}</p>
    <p>Already have an account? <router-link to="/login">Login</router-link></p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      email: '',
      username: '',
      password: '',
      confirmPassword: '',
      successMessage: '',
      errorMessage: '',
    };
  },
  methods: {
    async registerUser() {
      if (this.password !== this.confirmPassword) {
        console.error('Passwords do not match');
        this.errorMessage = 'Passwords do not match';
        return;
      }

      console.log('Registering user with:', {
        name: this.username,
        email: this.email,
        password: this.password,
      });

      try {
        const response = await fetch('http://localhost:8000/api/register', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            name: this.username,
            email: this.email,
            password: this.password,
          }),
        });
        const data = await response.json();
        if (response.ok) {
          console.log('User registered successfully:', data);
          this.successMessage = 'Registration successful! Welcome aboard!';
          this.errorMessage = '';
        } else {
          console.error('Registration failed:', data);
          this.errorMessage = data.message || 'Registration failed';
        }
      } catch (err) {
        console.error('Error:', err);
        this.errorMessage = 'An error occurred. Please try again.';
      }
    },
  },
};
</script>

<style scoped>
.signup {
  background-color: #84592B;
  text-align: center;
  padding: 20px;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 83vh;
  display: flex;
}
.form-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 10px;
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
.success-message {
  color: green;
  margin-top: 20px;
}
.error-message {
  color: red;
  margin-top: 20px;
}
router-link {
  color: #007bff;
}
</style>
