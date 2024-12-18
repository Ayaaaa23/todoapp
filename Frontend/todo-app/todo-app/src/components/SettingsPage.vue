<template>
  <div class="settings-page">
    <button class="back-button" @click="goHome">◀</button>
    <h1 class="title">Settings</h1>
    <p class="subtitle">Unveil the secrets of your realm</p>

    <div class="settings-sections">
      <!-- Notifications Section -->
      <div class="settings-section">
        <h2 class="section-title">Notifications</h2>
        <div class="setting-item">
          <label>
            Push notifications
            <input type="checkbox" v-model="settings.pushNotifications" />
          </label>
        </div>
        <div class="setting-item">
          <label>
            Email notifications
            <input type="checkbox" v-model="settings.emailNotifications" />
          </label>
        </div>
        <div class="setting-item">
          <label>
            Sound and vibration
            <input type="checkbox" v-model="settings.soundAndVibration" />
          </label>
        </div>
      </div>

      <!-- Display Section -->
      <div class="settings-section">
        <h2 class="section-title">Display</h2>
        <div class="setting-item">
          <label>
            <input type="radio" value="Theme" v-model="settings.display" />
            Theme
          </label>
        </div>
        <div class="setting-item">
          <label>
            <input type="radio" value="Font size" v-model="settings.display" />
            Font size
          </label>
        </div>
        <div class="setting-item">
          <label>
            <input type="radio" value="Language" v-model="settings.display" />
            Language
          </label>
        </div>
      </div>

      <!-- Privacy Section -->
      <div class="settings-section">
        <h2 class="section-title">Privacy and Security</h2>
        <div class="setting-item">
          <label>
            Privacy lock
            <input type="radio" value="Privacy lock" v-model="settings.privacy" />
          </label>
        </div>
        <div class="setting-item">
          <label>
            App lock
            <input type="radio" value="App lock" v-model="settings.privacy" />
          </label>
        </div>
        <div class="setting-item">
          <label>
            Login activity
            <input type="radio" value="Login activity" v-model="settings.privacy" />
          </label>
        </div>
        <div class="setting-item">
          <button @click="goToPrivacyPage">Go to Privacy Page</button>
        </div>
      </div>

      <!-- Support Section -->
      <div class="settings-section">
        <h2 class="section-title">Support and Feedback</h2>
        <div class="setting-item">
          <label>
            Help center
            <input type="radio" value="Help center" v-model="settings.support" />
          </label>
        </div>
        <div class="setting-item">
          <label>
            Contact support
            <input type="radio" value="Contact support" v-model="settings.support" />
          </label>
        </div>
        <div class="setting-item">
          <label>
            Feedback
            <input type="radio" value="Feedback" v-model="settings.support" />
          </label>
        </div>
      </div>

      <!-- Legal Section -->
      <div class="settings-section">
        <h2 class="section-title">Legal and About</h2>
        <div class="setting-item">
          <label>
            Terms Of Service
            <input type="radio" value="Terms Of Service" v-model="settings.legal" />
          </label>
        </div>
        <div class="setting-item">
          <label>
            About Us
            <input type="radio" value="About Us" v-model="settings.legal" />
          </label>
        </div>
        <div class="setting-item">
          <label>
            FAQs
            <input type="radio" value="FAQs" v-model="settings.legal" />
          </label>
        </div>
      </div>
    </div>
  </div>
</template>

  
<script>
export default {
  data() {
    return {
      settings: {
        pushNotifications: true,
        emailNotifications: false,
        soundAndVibration: true,
        display: "Theme",
        privacy: "Privacy lock",
        support: "Help center",
        legal: "Terms Of Service"
      },
    };
  },
  methods: {
    goHome() {
      this.$router.push({ name: 'HomePage' });
    },
    goToPrivacyPage() {
      this.$router.push({ name: 'PrivacyPage' });
    }
  },
};
</script>

  
  <style scoped>
  /* Styles pour le design */
  .settings-page {
    font-family: "Times New Roman", serif;
    background-color: #8c4f2b;
    color: #fff;
    padding: 20px;
    height: 100vh;
    box-sizing: border-box;
  }
  
  .back-button {
    background: none;
    border: none;
    color: #fff;
    font-size: 24px;
    cursor: pointer;
  }
  
  .title {
    font-size: 36px;
    text-align: center;
    margin-bottom: 10px;
  }
  
  .subtitle {
    text-align: center;
    margin-bottom: 20px;
    font-style: italic;
  }
  
  .settings-sections {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: space-between;
  }
  
  .settings-section {
    flex: 1 1 calc(45% - 20px);
    background-color: #7a6453;
    border-radius: 10px;
    padding: 15px;
    box-sizing: border-box;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
  }
  
  .section-title {
    font-size: 18px;
    margin-bottom: 10px;
    text-align: center;
    text-decoration: underline;
  }
  
  .setting-item {
    margin-bottom: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  
  .setting-item label {
    font-size: 16px;
    cursor: pointer;
  }
  
  input[type="checkbox"],
  input[type="radio"] {
    margin-left: 10px;
  }
  </style>
  