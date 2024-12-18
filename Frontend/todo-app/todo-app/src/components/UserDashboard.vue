<template>
  <div class="dashboard">
    <header class="dashboard-header">
      <h1>Welcome to your Dashboard, [UserName]!</h1>
      <p>Today's Date: {{ currentDate }}</p>
    </header>
    
    <section class="dashboard-content">
      <!-- Summary Section -->
      <div class="summary">
        <h2>Task Summary</h2>
        <ul>
          <li>Total Tasks: {{ totalTasks }}</li>
          <li>Completed Tasks: {{ completedTasks }}</li>
          <li>Pending Tasks: {{ pendingTasks }}</li>
          <li>Due Today: {{ dueToday }}</li>
        </ul>
      </div>
  
      <!-- Graphs Section -->
      <div class="graphs">
        <h2>Progress Graph</h2>
        <canvas id="myChart"></canvas>
      </div>
  
      <!-- Notifications Section -->
      <div class="notifications">
        <h2>Notifications</h2>
        <ul>
          <li v-for="notification in notifications" :key="notification">{{ notification }}</li>
        </ul>
      </div>
  
      <!-- Quick Links Section -->
      <div class="quick-links">
        <h2>Quick Links</h2>
        <button @click="navigateTo('CreateTask')">Create New Task</button>
        <button @click="navigateTo('TaskList')">View All Tasks</button>
        <button @click="navigateTo('SettingsPage')">Settings</button>
        <button @click="navigateTo('NotePage')">Notes</button>
      </div>
    </section>
  </div>
</template>

<script>
import { Chart } from 'chart.js';

export default {
  name: 'UserDashboard',
  data() {
    return {
      currentDate: new Date().toLocaleDateString(),
      totalTasks: 50,
      completedTasks: 23,
      pendingTasks: 17,
      dueToday: 3,
      notifications: []
    };
  },
  methods: {
    navigateTo(page) {
      this.$router.push({ name: page }).catch((err) => {
        console.error("Navigation error:", err.message);
      });
    },
    generateNotifications() {
      this.notifications = [
        `You have ${this.pendingTasks} pending tasks.`,
        `You have ${this.dueToday} tasks due today.`,
        "Don't forget to review your completed tasks."
      ];
    },
    renderChart() {
      new Chart(document.getElementById('myChart'), {
        type: 'bar',
        data: {
          labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
          datasets: [{
            label: 'Tasks Completed',
            data: [12, 19, 3, 5],
            backgroundColor: [
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
            ],
            borderColor: [
              'rgba(255, 99, 132, 1)',
              'rgba(54, 162, 235, 1)',
              'rgba(75, 192, 192, 1)',
              'rgba(153, 102, 255, 1)',
            ],
            borderWidth: 1
          }]
        },
        options: {
          scales: {
            y: {
              beginAtZero: true
            }
          }
        }
      });
    }
  },
  mounted() {
    const token = localStorage.getItem('token');
    if (!token) {
      this.$router.push('/login');
    } else {
      this.renderChart();
      this.generateNotifications();
    }
  },
};
</script>

<style scoped>
.dashboard {
  padding: 20px;
  font-family: 'Arial, sans-serif';
  background-color: #f7f7f7;
}

.dashboard-header {
  background-color: #6c757d;
  color: white;
  padding: 15px;
  border-radius: 5px;
  margin-bottom: 20px;
}

.dashboard-header h1 {
  margin: 0;
  font-size: 24px;
}

.dashboard-header p {
  margin: 5px 0 0;
  font-size: 14px;
}

.dashboard-content {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
}

.summary, .graphs, .notifications, .quick-links {
  background-color: white;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  flex: 1 1 300px;
}

.summary ul, .notifications ul {
  list-style-type: none;
  padding: 0;
}

.summary li, .notifications li {
  margin-bottom: 10px;
}

button {
  padding: 10px 20px;
  margin: 5px 0;
  background-color: #6c757d;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

button:hover {
  background-color: #5a6268;
}
</style>
