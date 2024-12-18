<template>
    <div class="notifications-page">
      <h1 class="title">Notifications</h1>
      <!-- Onglets -->
      <div class="tabs">
        <button
          v-for="tab in tabs"
          :key="tab"
          :class="{ active: tab === activeTab }"
          @click="selectTab(tab)"
        >
          {{ tab }}
        </button>
      </div>
  
      <!-- Liste des notifications -->
      <div class="notifications-list">
        <div
          v-for="(notification, index) in filteredNotifications"
          :key="index"
          class="notification-item"
        >
          <div class="notification-header">
            <span class="date">{{ notification.date }}</span>
            <span class="type">[{{ notification.type }}]</span>
          </div>
          <p class="message">{{ notification.message }}</p>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: "NotificationP",
    data() {
      return {
        // Onglets disponibles
        tabs: ["All", "Tasks", "Quests", "Achievements"],
        activeTab: "All",
        // Notifications simulées
        notifications: [
          {
            date: "2024-11-24",
            message: "Complete your daily quest: Organize your workspace.",
            type: "Task Reminder",
            category: "Tasks",
          },
          {
            date: "2024-11-24",
            message: "You have unlocked a new quest: complete 5 goals.",
            type: "Quest Update",
            category: "Quests",
          },
          {
            date: "2024-11-24",
            message: "Congratulations! You have earned the 'Task Master' badge.",
            type: "Achievement Unlocked",
            category: "Achievements",
          },
          {
            date: "2024-11-24",
            message:
              "You have logged in for 7 consecutive days. Here is your reward: 50 points.",
            type: "Daily Login Reward",
            category: "Achievements",
          },
        ],
      };
    },
    computed: {
      filteredNotifications() {
        // Filtrer les notifications en fonction de l'onglet actif
        if (this.activeTab === "All") {
          return this.notifications;
        }
        return this.notifications.filter(
          (notification) => notification.category === this.activeTab
        );
      },
    },
    methods: {
      selectTab(tab) {
        this.activeTab = tab;
      },
    },
  };
  </script>
  
  <style scoped>
  /* Styles principaux */
  .notifications-page {
    font-family: "Arial", sans-serif;
    background-color: #f5e3c3;
    padding: 20px;
    border: 2px solid #7a5230;
    border-radius: 10px;
    width: 80%;
    margin: auto;
  }
  
  /* Titre */
  .title {
    font-size: 2rem;
    font-weight: bold;
    text-align: center;
    color: #5a3d2c;
    margin-bottom: 20px;
  }
  
  /* Onglets */
  .tabs {
    display: flex;
    justify-content: space-around;
    margin-bottom: 20px;
  }
  
  .tabs button {
    background: none;
    border: none;
    font-size: 1.2rem;
    cursor: pointer;
    padding: 10px 20px;
    color: #5a3d2c;
    border-bottom: 2px solid transparent;
    transition: 0.3s;
  }
  
  .tabs button.active {
    border-bottom: 2px solid #5a3d2c;
    font-weight: bold;
  }
  
  /* Liste des notifications */
  .notifications-list {
    background-color: #fff8e1;
    border: 1px solid #7a5230;
    border-radius: 10px;
    padding: 10px;
  }
  
  .notification-item {
    border-bottom: 1px solid #7a5230;
    padding: 10px 0;
  }
  
  .notification-item:last-child {
    border-bottom: none;
  }
  
  /* En-tête des notifications */
  .notification-header {
    display: flex;
    justify-content: space-between;
    font-size: 0.9rem;
    color: #7a5230;
  }
  
  .message {
    font-size: 1rem;
    color: #5a3d2c;
    margin-top: 5px;
  }

.notifications-page {
  position: absolute; /* Assure que l'élément couvre tout l'écran */
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: #f5e3c3; /* Couleur de fond */
  padding: 20px;
  box-sizing: border-box; /* Inclut les bordures/marges dans la largeur/hauteur */
  overflow-y: auto; /* Permet le défilement si le contenu dépasse l'écran */
  border: none; /* Optionnel : retire les bordures */
}
  </style>