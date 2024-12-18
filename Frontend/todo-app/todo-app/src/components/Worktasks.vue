<template>
    <div class="work-tasks">
      <h2>Work Tasks</h2>
      <!-- Liste des tâches de travail -->
      <ul>
        <li v-for="task in tasks" :key="task.id">{{ task.title }} ({{ task.time }})</li>
      </ul>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        tasks: [
          { id: 1, title: 'Client review and feedback', time: 'Today 10:00 PM - 11:45 PM' },
          { id: 2, title: 'Meeting with the team', time: 'Today 10:00 PM - 11:45 PM' },
        ]
      };
    }
  };
  </script>
  
  <style scoped>
  
  </style>
  