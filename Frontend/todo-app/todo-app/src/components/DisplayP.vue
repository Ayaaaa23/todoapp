<template>
    <div class="display-container">
      <!-- Back Button -->
      <button class="back-button" @click="goHome" >◀</button>
  
      <!-- Page Title -->
      <h1 class="page-title">Display Settings</h1>
  
      <!-- Display Sections -->
      <div class="settings-sections">
        <!-- Font Size Section -->
        <div class="settings-section">
          <h2 class="section-title">Font Size</h2>
          <div class="setting-item">
            <label>
              <input type="radio" value="small" v-model="settings.fontSize" />
              Small
            </label>
          </div>
          <div class="setting-item">
            <label>
              <input type="radio" value="medium" v-model="settings.fontSize" />
              Medium
            </label>
          </div>
          <div class="setting-item">
            <label>
              <input type="radio" value="large" v-model="settings.fontSize" />
              Large
            </label>
          </div>
        </div>
  
        <!-- Theme Section -->
        <div class="settings-section">
          <h2 class="section-title">Theme</h2>
          <div class="setting-item">
            <label>
              <input type="radio" value="light" v-model="settings.theme" />
              Light Theme
            </label>
          </div>
          <div class="setting-item">
            <label>
              <input type="radio" value="dark" v-model="settings.theme" />
              Dark Theme
            </label>
          </div>
        </div>
  
        <!-- Language Section -->
        <div class="settings-section">
          <h2 class="section-title">Language</h2>
          <div class="setting-item">
            <label>
              <input type="radio" value="english" v-model="settings.language" />
              English
            </label>
          </div>
          <div class="setting-item">
            <label>
              <input type="radio" value="french" v-model="settings.language" />
              French
            </label>
          </div>
          <div class="setting-item">
            <label>
              <input type="radio" value="arabic" v-model="settings.language" />
              Arabic
            </label>
          </div>
        </div>
      </div>
  
      <!-- Apply Changes Button -->
      <button class="apply-button" @click="applySettings">Apply</button>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        settings: {
          fontSize: 'medium', // Default font size
          theme: 'light', // Default theme
          language: 'english', // Default language
        },
      };
    },
    methods: {
      applySettings() {
        // Apply font size
        document.body.style.fontSize = this.settings.fontSize === 'small' ? '12px' : this.settings.fontSize === 'medium' ? '16px' : '20px';
  
        // Apply theme
        if (this.settings.theme === 'dark') {
          document.body.style.backgroundColor = '#333';
          document.body.style.color = '#fff';
        } else {
          document.body.style.backgroundColor = '#f5deb3';
          document.body.style.color = '#8b4513';
        }
  
        // Apply language (for now, just console log as an example)
        console.log(`Language set to: ${this.settings.language}`);
      },
    
    
    goHome() {
      this.$router.push({ name: 'HomePage' });
    },
  },
  };
  </script>
  
  <style scoped>
  /* Global Container */
  .display-container {
    background-color: #f5deb3;
    color: #8b4513;
    font-family: 'Georgia', serif;
    padding: 20px;
    min-height: 100vh;
    position: relative;
  }
  
  /* Back Button */
  .back-button {
    background: none;
    border: none;
    color: #8b4513;
    font-size: 24px;
    cursor: pointer;
    position: absolute;
    top: 20px;
    left: 20px;
  }
  
  /* Page Title */
  .page-title {
    text-align: center;
    font-size: 36px;
    margin-bottom: 30px;
  }
  
  /* Settings Sections */
  .settings-sections {
    display: grid;
    grid-template-columns: repeat(1, 1fr);
    gap: 20px;
    margin-bottom: 20px;
  }
  
  .settings-section {
    background-color: #8b4513;
    color: #f5deb3;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
  }
  
  .section-title {
    font-size: 20px;
    margin-bottom: 15px;
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
  
  input[type="radio"] {
    margin-left: 10px;
  }
  
  /* Apply Button */
  .apply-button {
    display: block;
    margin: 30px auto;
    padding: 10px 20px;
    background-color: #8b4513;
    color: #fff;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
  }
  </style>
  