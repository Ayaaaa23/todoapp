<template>
    <div class="terms-container">
      <!-- Back Button -->
      <button class="back-button" @click="goHome" >◀</button>
  
      <!-- Page Title -->
      <h1 class="page-title">Terms of Service</h1>
  
      <!-- Terms Content -->
      <div class="terms-content">
        <h2 class="section-title">1. Introduction</h2>
        <p class="section-text">Welcome to QuestGuardian! These Terms of Service govern your use of our app.</p>
  
        <h2 class="section-title">2. Acceptance of Terms</h2>
        <p class="section-text">By using our app, you agree to be bound by these terms.</p>
  
        <h2 class="section-title">3. Modifications to Terms</h2>
        <p class="section-text">We may update these terms from time to time.</p>
  
        <h2 class="section-title">4. User Responsibilities</h2>
        <p class="section-text">You are responsible for your use of the app and any content you create.</p>
  
        <h2 class="section-title">5. Termination</h2>
        <p class="section-text">We may terminate your access to the app if you violate these terms.</p>
  
        <h2 class="section-title">6. Contact Information</h2>
        <p class="section-text">If you have any questions about these terms, please contact us at support@questguardian.com.</p>
      </div>
  
      <!-- Accept Button -->
      <button class="accept-button" @click="acceptTerms">I accept</button>
    </div>
  </template>
  
  <script>
  export default {
    methods: {
      acceptTerms() {
        // Handle the acceptance of terms (e.g., redirect or show a confirmation)
        alert("You have accepted the terms.");
      },
      
    goHome() {
      this.$router.push({ name: 'HomePage' });
    },
    
    },
  };
  </script>
  
  <style scoped>
/* Global Container */
.terms-container {
  background-color: #f5deb3; /* Beige clair */
  color: #8b4513; /* Marron foncé */
  font-family: 'Georgia', serif;
  padding: 30px;
  height: 100vh;
  width:100vw;
  text-align: center;
  
 
  box-shadow: 0 10px 15px rgba(0, 0, 0, 0.2);
}

/* Back Button */
.back-button {
  background: none;
  border: none;
  color: #8b4513;
  font-size: 30px;
  cursor: pointer;
  position: absolute;
  top: 20px;
  left: 20px;
  font-family: 'Georgia', serif;
}

/* Page Title */
.page-title {
  font-size: 48px;
  font-weight: bold;
  color: #8b4513;
  margin-bottom: 20px;
  font-family: 'Georgia', serif;
  text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1); /* Ombre pour le titre */
}

/* Term Section */
.term-section {
  padding: 20px;
  background-color: #fff8e1; /* Fond clair pour chaque section */
  margin-bottom: 20px;
  border-radius: 10px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.section-title {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 10px;
  color: #8b4513;
  text-decoration: none;
}

.section-content {
  font-size: 18px;
  color: #8b4513;
  line-height: 1.6;
  margin-bottom: 10px;
}

/* Accept Button */
.accept-button {
  display: inline-block;
  margin-top: 30px;
  padding: 15px 40px;
  background-color: #8b4513; /* Bouton marron foncé */
  color: #f5deb3; /* Texte beige */
  font-size: 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: all 0.3s ease;
  font-family: 'Georgia', serif;
}

.accept-button:hover {
  background-color: #5c3a1b; /* Couleur plus foncée au survol */
  transform: scale(1.05); /* Effet d'agrandissement au survol */
}
</style>
