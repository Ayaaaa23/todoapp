<template>
  <div class="privacy-container">
    <!-- Back Button -->
    <button class="back-button" @click="goHome">◀</button>
    <h1 class="page-title">Privacy and Security</h1>
    <p class="page-subtitle">Protect your information and secure your account</p>

    <!-- Privacy and Security Sections -->
    <div class="settings-grid">
      <!-- Privacy Lock Section -->
      <div class="settings-card">
        <h2 class="card-title">Privacy Lock</h2>
        <div class="setting-option">
          <label>Enable Privacy Lock</label>
          <input type="checkbox" v-model="privacySettings.privacyLock" />
        </div>
        <p v-if="privacySettings.privacyLock" class="info-text">
          - Hide sensitive information<br />
          - Mask notifications
        </p>
      </div>

      <!-- App Lock Section -->
      <div class="settings-card">
        <h2 class="card-title">App Lock</h2>
        <div class="setting-option">
          <label>Enable App Lock</label>
          <input type="checkbox" v-model="privacySettings.appLock" />
        </div>
        <div v-if="privacySettings.appLock">
          <div class="setting-option">
            <label>Set App Lock PIN/Password</label>
            <button class="action-button" @click="setAppLockPin">Set PIN/Password</button>
          </div>
          <div class="setting-option">
            <label>Change App Lock PIN/Password</label>
            <button class="action-button" @click="changeAppLockPin">Change PIN/Password</button>
          </div>
        </div>
      </div>

      <!-- Login Activity Section -->
      <div class="settings-card">
        <h2 class="card-title">Login Activity</h2>
        <p class="info-text">Last login: {{ loginActivity.lastLogin }}</p>
        <div class="setting-option">
          <label>Active Sessions</label>
          <ul class="device-list">
            <li v-for="(device, index) in loginActivity.activeSessions" :key="index">
              {{ device }}
            </li>
          </ul>
        </div>
        <div class="setting-option">
          <label>Terminate Other Sessions</label>
          <button class="action-button" @click="terminateOtherSessions">Terminate</button>
        </div>
      </div>
    </div>
  </div>
</template>

  
  <script>
  export default {
    data() {
      return {
        privacySettings: {
          privacyLock: false,
          appLock: false,
        },
        loginActivity: {
          lastLogin: "17/12/2024 23:30",
          activeSessions: ["Chrome on Windows", "Safari on iPhone", "Edge on Mac"],
        },
      };
    },
    methods: {
      setAppLockPin() {
        alert("Redirecting to set PIN/Password...");
      },
      changeAppLockPin() {
        alert("Redirecting to change PIN/Password...");
      },
      terminateOtherSessions() {
        alert("Terminating other sessions...");
      },
     
    goHome() {
      this.$router.push({ name: 'HomePage' });
    },
    
    },
  };
  </script>
  
  <style scoped>
  /* Global Container */
  .privacy-container {
    background-color: #8b4513;
    color: #f5deb3;
    font-family: 'Georgia', serif;
    padding: 20px;
    min-height: 100vh;
  }
  
  /* Back Button */
  .back-button {
    background: none;
    border: none;
    color: #f5deb3;
    font-size: 24px;
    cursor: pointer;
    margin-bottom: 20px;
  }
  
  /* Title Styles */
  .page-title {
    text-align: center;
    font-size: 36px;
    margin-bottom: 5px;
  }
  
  .page-subtitle {
    text-align: center;
    font-style: italic;
    margin-bottom: 30px;
  }
  
  /* Settings Grid */
  .settings-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
  }
  
  /* Card Style */
  .settings-card {
    background-color: #6a4f4b;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
  }
  
  .card-title {
    text-align: center;
    font-size: 20px;
    margin-bottom: 15px;
    text-decoration: underline;
  }
  
  /* Setting Option */
  .setting-option {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 15px;
  }
  
  .setting-option label {
    font-size: 16px;
  }
  
  input[type="checkbox"] {
    transform: scale(1.2);
  }
  
  /* Info Text */
  .info-text {
    font-size: 14px;
    margin-top: 10px;
  }
  
  /* Action Button */
  .action-button {
    background-color: #f5deb3;
    border: none;
    color: #8b4513;
    padding: 10px 15px;
    font-size: 14px;
    border-radius: 5px;
    cursor: pointer;
    text-align: center;
  }
  
  .action-button:hover {
    background-color: #e0c49a;
  }
  
  /* Device List */
  .device-list {
    list-style-type: none;
    padding: 0;
    margin: 10px 0;
  }
  
  .device-list li {
    margin: 5px 0;
  }
  </style>
  