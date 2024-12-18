<template>
  <div class="app-container">
    <!-- Notification Popup -->
    <notification-popup v-if="showPopup" :show="showPopup" @close="closePopup" />

    <!-- Header Section -->
    <header class="header">
      <img :src="require('@/assets/logo.jpg')" alt="logo" class="logo" />
      <div class="welcome">
        <h1>Welcome, {{ username }}!</h1>
        <p>{{ currentDate }}</p>
      </div>
      <div class="header-buttons">
        <button class="signup-login-button" @click="navigateToLogin">SIGN UP/LOGIN</button> 
        <button class="dashboard-button" @click="navigateToDashboard">Go to Dashboard</button>
        <button class="logout-button" @click="logout">Logout</button>
      </div>
    </header>

    <!-- Search Section -->
    <div class="search-section">
      <div class="search-bar">
        <span class="search-icon">🔍</span>
        <input type="text" placeholder="Search quest here" />
      </div>
    </div>

    <!-- Main Content Section -->
    <div class="main-content">
      <!-- Left Section -->
      <div class="priority-summary">
        <div class="priority-section">
          <h2>Priority</h2>
          <div class="priority-item high" @click="navigateTo('HighPriorityTasks')">High <span class="badge">17</span></div>
          <div class="priority-item medium" @click="navigateTo('MediumPriorityTasks')">Medium <span class="badge">5</span></div>
          <div class="priority-item basic" @click="navigateTo('BasicPriorityTasks')">Basic <span class="badge">20</span></div>
        </div>

        <div class="summary-section">
          <h2>Summary</h2>
          <div class="summary-item due-today" @click="navigateTo('DueToday')">Due Today <span class="arrow">➡</span></div>
          <div class="summary-item in-progress" @click="navigateTo('InProgress')">In Progress <span class="arrow">➡</span></div>
          <div class="summary-item special-quests" @click="navigateTo('SpecialQuest')">Special Quests <span class="arrow">➡</span></div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import NotificationPopup from './NotificationPopup.vue';

export default {
  name: "HomePage",
  components: {
    NotificationPopup
  },
  data() {
    return {
      username: "", // Nom d'utilisateur initialisé vide
      currentDate: new Date().toLocaleDateString(),
      showPopup: true // Afficher le pop-up au démarrage pour la démonstration
    };
  },
  created() {
    this.getUserInfo(); // Récupérer les infos de l'utilisateur lors de la création du composant
  },
  methods: {
    navigateTo(page) {
      this.$router.push({ name: page }).catch((err) => {
        console.error("Navigation error:", err.message);
      });
    },
    navigateToLogin() {
      this.$router.push({ name: 'LoginToo' }).catch((err) => {
        console.error("Navigation error:", err.message);
      });
    },
    navigateToDashboard() {
      this.$router.push({ name: 'UserDashboard' }).catch((err) => {
        console.error("Navigation error:", err.message);
      });
    },
    logout() {
      axios.post('/api/logout', {}, {
        headers: { 'Authorization': `Bearer ${localStorage.getItem('token')}` }
      })
      .then(() => {
        alert("You have been logged out.");
        this.username = "";
        localStorage.removeItem("username");
        localStorage.removeItem("token"); // Retirer le jeton de l'utilisateur
        this.$router.push({ name: 'LoginToo' });
      })
      .catch(err => {
        console.error("Logout error:", err.message);
        alert("Failed to logout. Please try again.");
      });
    },
    getUserInfo() {
      axios.get('/api/user', {
        headers: { 'Authorization': `Bearer ${localStorage.getItem('token')}` }
      }).then(response => {
        this.username = response.data.name;
        localStorage.setItem("username", this.username);
      }).catch(err => {
        console.error("Error fetching user info:", err.message);
      });
    },
    closePopup() {
      this.showPopup = false;
    }
  }
};
</script>




<style scoped>
/* General Styling */
body {
  padding: 0;
  margin: 0;
  font-family: 'Georgia', serif;
  background-color: #D8A673;
  color: #5A3825;
}

.app-container {
  display: flex;
  flex-direction: column;
}

/* Header Section */
.header {
  display: flex;
  align-items: center;
  padding: 20px;
  background-color: #a8742b;
  border-bottom: 2px solid #8B4513;
}

h2{
  color: #8B4513;
  margin-bottom:15px ;
}

.logo {
  width: 80px;
  height: 80px;
  background-color: #C4B3A3;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 14px;
  font-weight: bold;
  margin-right: 20px;
}

.welcome h1 {
  font-size: 34px;
  background:none;
  margin: 0;
  display: start;
}

.welcome p {
  margin: 0;
  font-size: 16px;
  color: #5A3825;
}

/* Header Buttons Section */
.header-buttons {
  display: flex;
  align-items: center;
  gap: 10px;
}

.signup-login-button, 
.dashboard-button, 
.logout-button {
  padding: 10px 20px;
  font-size: 16px;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.signup-login-button {
  background-color: #8B4513;
}

.signup-login-button:hover {
  background-color: #D8A673;
}

.dashboard-button {
  background-color: #5A3825;
}

.dashboard-button:hover {
  background-color: #8B4513;
}

.logout-button {
  background-color: #8B4513;
}

.logout-button:hover {
  background-color: #e0c5a3;
}

/* Search Section */
.search-section {
  padding: 20px;
  background-color: #E9D4B6;
  display: flex;
  justify-content: center;
  align-items: center;
}

.search-bar {
  background-color: #FFF6E5;
  border: 2px solid #8B4513;
  border-radius: 5px;
  display: flex;
  align-items: center;
  padding: 10px;
  width: 50%;
}

.search-icon {
  margin-right: 10px;
}

.search-bar input {
  width: 100%;
  border: none;
  outline: none;
  background: none;
  font-size: 16px;
}

/* Main Content Section */
.main-content {
  display: flex;
  flex: 1;
}

/* Left Section */
.priority-summary {
  flex: 1;
  padding: 20px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.priority-section,
.summary-section {
  background-color: #E9D4B6;
  border-radius: 10px;
  padding: 15px;
  box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
}

.priority-item,
.summary-item {
  background-color: #8B4513;
  color: #FFF;
  margin-bottom: 10px;
  padding: 10px;
  border-radius: 5px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 16px;
  box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
  cursor: pointer;
}

.badge {
  background-color: #D8A673;
  padding: 5px 10px;
  border-radius: 50%;
  font-size: 14px;
  font-weight: bold;
}

.arrow {
  font-size: 18px;
}
</style>
