<template>
  <div class="login">
    <h1 class="name">Enter your realm</h1>
    <form @submit.prevent="loginUser" class="form-container">
      <div>
        <label for="email">Email:</label>
        <input type="email" id="email" v-model="email" required />
      </div>
      <div>
        <label for="password">Password:</label>
        <input type="password" id="password" v-model="password" required />
      </div>
      <button type="submit">Login</button>
    </form>
    <p v-if="errorMessage" class="error-message">{{ errorMessage }}</p>
    <p class="signup"> <router-link to="/signup">Don't have an account?</router-link></p>
    <p class="forget"> <router-link to="/forgot-password">Forgot password?</router-link></p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      email: '',
      password: '',
      errorMessage: '',
    };
  },
  methods: {
    async loginUser() {
      console.log('Logging in:', this.email, this.password);

      try {
        const response = await fetch('http://localhost:8000/api/login', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            email: this.email,
            password: this.password,
          }),
        });
        const data = await response.json();
        if (response.ok) {
          console.log('Login successful:', data);
          localStorage.setItem('token', data.token); // Stocker le token dans le localStorage
          this.$router.push('/dashboard'); // Rediriger vers le tableau de bord
        } else {
          console.error('Login failed:', data);
          this.errorMessage = data.message || 'Login failed';
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
  position: absolute;
  bottom: 10px;
  right: 10px;
  color: #E8D1A7;
  text-decoration: none;
  font-size: 18px;
}
.forget {
  position: absolute;
  bottom: 10px;
  left: 10px;
  color: #E8D1A7;
  font-size: 18px;
}
.name {
  color: #E8D1A7;
}
.login {
  background-color: #84592B;
  color: #E8D1A7;
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

p{
  text-decoration: none;
}
label{
  color: #E8D1A7;
  margin: 20px;
  font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
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
  color: #E8D1A7;
}
.error-message {
  color: red;
  margin-top: 20px;
}
router-link {
  color: #84592B;
  text-decoration: none;

}
</style>
