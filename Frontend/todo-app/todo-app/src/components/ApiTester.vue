<template>
    <div class="api-tester">
      <button v-if="!hideButtons" @click="fetchUserInfo">Get User Info</button>
      <button v-if="!hideButtons" @click="logoutUser">Logout</button>
    </div>
  </template>
  
  <script>
  export default {
    name: 'ApiTester',
    data() {
      return {
        hideButtons: false // Ajouter une propriété pour masquer les boutons
      };
    },
    methods: {
      fetchUserInfo() {
        fetch('http://localhost:8000/api/user', {
          method: 'GET',
          headers: {
            'Authorization': 'Bearer ' + localStorage.getItem('token'),
            'Content-Type': 'application/json',
          }
        })
        .then(response => {
          if (!response.ok) {
            throw new Error('Network response was not ok: ' + response.statusText);
          }
          return response.json();
        })
        .then(data => {
          console.log('User info:', data);
        })
        .catch((error) => {
          console.error('Error fetching user info:', error);
        });
      },
      logoutUser() {
        fetch('http://localhost:8000/api/logout', {
          method: 'POST',
          headers: {
            'Authorization': 'Bearer ' + localStorage.getItem('token'),
            'Content-Type': 'application/json',
          }
        })
        .then(response => {
          if (!response.ok) {
            throw new Error('Network response was not ok: ' + response.statusText);
          }
          return response.json();
        })
        .then(data => {
          console.log('Logout successful:', data);
        })
        .catch((error) => {
          console.error('Logout error:', error);
        });
      }
    }
  };
  </script>
  
  <style scoped>
  .api-tester {
    display: none; /* Masquer les boutons par défaut */
  }
  
  button {
    padding: 10px;
    background-color: #6c757d;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }
  
  button:hover {
    background-color: #5a6268;
  }
  </style>
  