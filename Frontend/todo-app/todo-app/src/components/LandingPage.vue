<template>
    <div class="landing-page">
      <header>
        <h1>Welcome to TodoApp!</h1>
        <p>Please log in or sign up to continue.</p>
      </header>
      <div class="buttons">
        <button @click="navigateToLogin">Login</button>
        <button @click="navigateToSignUp">Sign Up</button>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: 'LandingPage',
    methods: {
      navigateToLogin() {
        this.$router.push({ name: 'LoginToo' });
      },
      navigateToSignUp() {
        this.$router.push({ name: 'SignUp' });
      }
    }
  };
  </script>
  
  <style scoped>
  .landing-page {
    text-align: center;
    padding: 50px;
    background-color: navajowhite;
  }
  
  header {
    margin-bottom: 30px;
  }
  
  .buttons button {
    margin: 10px;
    padding: 10px 20px;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    background-color: #5a82a6;
    color: white;
  }
  
  .buttons button:hover {
    background-color: #3a6286;
  }
  </style>
  