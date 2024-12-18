<template>
    <div class="faq-container">
      <!-- Bouton de retour -->
      <button class="back-button" @click="goHome" >◀</button>
  
      <!-- Titre de la page -->
      <h1 class="page-title">FAQs</h1>
  
      <!-- Sections FAQ -->
      <div class="faq-item" v-for="(faq, index) in faqs" :key="index">
        <h2 class="faq-question">{{ faq.question }}</h2>
        <p class="faq-answer">{{ faq.answer }}</p>
      </div>
  
      <!-- Bouton "I accept" -->
      <button class="accept-button" @click="accept">I accept</button>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        faqs: [
          { question: "What is QuestGuardian?", answer: "QuestGuardian is an app designed to help you..." },
          { question: "How do I create a new quest?", answer: "To create a new quest, tap on the '+' icon" },
          { question: "Can I sync my tasks with my calendar?", answer: "Yes, you can sync your tasks with your calendar..." },
          { question: "How do I track my progress?", answer: "You can track your progress by..." },
          { question: "How do I contact support?", answer: "You can contact our support team by..." },
        ],
      };
    },
    methods: {
    goHome() {
      this.$router.push({ name: 'HomePage' });
    },
    },
  };
  </script>
  
  
  <style scoped>
  /* Container principal */
.faq-container {
  background-color: #f5deb3; /* Couleur de fond beige clair */
  color: #8b4513; /* Couleur de texte marron foncé */
  font-family: 'Georgia', serif;
  padding: 30px;
  height: 100vh;
  width:100vw;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: center;
  box-sizing: border-box;
  overflow-y: auto;
}

/* Titre de la page */
.page-title {
  font-size: 48px;
  font-weight: bold;
  color: #8b4513;
  margin-bottom: 40px;
  text-align: center;
  text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
}

/* Style des sections FAQ */
.faq-item {
  background-color: #f5deb3; /* Fond beige clair */
  color: #8b4513; /* Couleur marron pour le texte */
  padding: 25px;
  margin-bottom: 30px;
  border-radius: 10px;
  width: 90%;
  max-width: 800px;
  box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
  font-family: 'Georgia', serif;
}

/* Question */
.faq-question {
  font-size: 24px;
  font-weight: bold;
  text-decoration: underline;
  margin-bottom: 15px;
  color: #8b4513;
}

/* Réponse */
.faq-answer {
  font-size: 18px;
  line-height: 1.6;
  margin-bottom: 20px;
  text-align: justify;
  color: #8b4513;
}

/* Style du bouton "Retour" */
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

/* Bouton "I accept" */
.accept-button {
  padding: 15px 40px;
  background-color: #8b4513;
  color: #f5deb3;
  font-size: 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: all 0.3s ease;
  font-family: 'Georgia', serif;
  margin-top: 50px;
}

.accept-button:hover {
  background-color: #5c3a1b;
  transform: scale(1.05);
}

  </style>
  