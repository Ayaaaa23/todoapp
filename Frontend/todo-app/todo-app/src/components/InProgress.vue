<template>
  <div id="in-progress-page" class="container">
    <!-- Header Section -->
    <header>
      <button class="back-button" @click="goHome" >◀</button>
      <h1>In Progress</h1>
    </header>

    <!-- Main Content -->
    <div class="progress-content">
      <div class="progress-item" v-for="(task, index) in tasks" :key="index">
        <h3>{{ task.date }}</h3>
        <h2>{{ task.title }}</h2>
        <div class="progress-bar">
          <div
            class="progress-fill"
            :style="{ width: task.progress + '%' }"
          ></div>
        </div>
        <p>{{ task.progress }}%</p>
        <p>{{ task.daysLeft }} days left</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tasks: [
        {
          date: "December 18th 2024",
          title: "PAW",
          progress: 95,
          daysLeft: 1,
        },
        {
          date: "January 4th 2025",
          title: "Exams",
          progress: 5,
          daysLeft: 18,
        },
        {
          date: "January 17th 2025",
          title: "Working On PFE",
          progress: 0,
          daysLeft: 30,
        },
        {
          date: "April 30th 2025",
          title: "Get feedback",
          progress: 10,
          daysLeft: 17,
        },
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
.container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
  background-color: #e8d1a7;
  font-family: "Arial", sans-serif;
  height: 100vh;
  padding: 20px;
}

header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  padding: 10px 0;
  background-color: #743014;
  color: #e8d1a7;
}

header h1 {
  font-size: 24px;
  text-align: center;
  flex: 1;
}

.back-button {
  background: none;
  border: none;
  color: #e8d1a7;
  font-size: 20px;
  cursor: pointer;
}

.progress-content {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 20px;
  width: 100%;
  padding: 20px;
}

.progress-item {
  background-color: #84592b;
  color: #e8d1a7;
  border-radius: 10px;
  padding: 15px;
  display: flex;
  flex-direction: column;
  align-items: center;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.progress-item h2 {
  font-size: 18px;
  margin: 10px 0;
}

.progress-item h3 {
  font-size: 14px;
  margin: 5px 0;
}

.progress-bar {
  background-color: #e8d1a7;
  border-radius: 5px;
  width: 100%;
  height: 10px;
  margin: 10px 0;
  overflow: hidden;
}

.progress-fill {
  height: 100%;
  background-color: #743014;
}

.progress-item p {
  font-size: 14px;
  margin: 5px 0;
}
</style>
