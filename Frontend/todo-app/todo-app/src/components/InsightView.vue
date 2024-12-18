<template>
  <div class="dashboard">
    <div class="header">
      <button class="back-button" @click="goHome" >◀</button>
      <h1 class="title">Insights</h1>
    </div>

    <div class="insights">
      <!-- Task Completion Chart -->
      <div class="chart task-completion">
        <h2>Task completion</h2>
        <canvas id="taskChart"></canvas>
      </div>

      <!-- Productivity Chart -->
      <div class="chart productivity">
        <h2>Productivity</h2>
        <canvas id="productivityChart"></canvas>
      </div>

      <!-- Mood Calendar -->
      <div class="mood-calendar">
        <h2>Mood calendar</h2>
        <div class="calendar">
          <div v-for="day in moodCalendar" :key="day.date" :class="['day', day.mood]"></div>
        </div>
        <div class="legend">
          <div class="legend-item">
            <span class="color-box negative"></span> Negative
          </div>
          <div class="legend-item">
            <span class="color-box positive"></span> Positive
          </div>
          <div class="legend-item">
            <span class="color-box neutral"></span> Neutral
          </div>
        </div>
      </div>

      <!-- Progress Chart -->
      <div class="progress">
        <h2>Progress</h2>
        <div class="progress-circle">
          <span>12 upcoming</span>
          <span>28 in progress</span>
          <span>20 completed</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Chart from 'chart.js/auto';

export default {
  data() {
    return {
      moodCalendar: [
        { date: '2024-12-01', mood: 'positive' },
        { date: '2024-12-02', mood: 'neutral' },
        { date: '2024-12-03', mood: 'negative' },
        { date: '2024-12-04', mood: 'positive' },
        // Add more data here
      ],
    };
  },
  mounted() {
    setTimeout(() => {
      this.drawTaskChart();
      this.drawProductivityChart();
    }, 100);
  },
  methods: {
    drawTaskChart() {
      const canvas = document.getElementById('taskChart');
      if (canvas) {
        const ctx = canvas.getContext('2d');
        new Chart(ctx, {
          type: 'bar',
          data: {
            labels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
            datasets: [
              {
                label: 'Tasks',
                data: [2, 6, 4, 10, 2, 3, 5],
                backgroundColor: '#8B4513',
              },
            ],
          },
          options: {
            responsive: true,
            plugins: {
              legend: { display: false },
            },
          },
        });
      } else {
        console.error("Canvas for Task Chart not found!");
      }
    },
    drawProductivityChart() {
      const canvas = document.getElementById('productivityChart');
      if (canvas) {
        const ctx = canvas.getContext('2d');
        new Chart(ctx, {
          type: 'line',
          data: {
            labels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
            datasets: [
              {
                label: 'Hours',
                data: [1, 3, 2, 6, 4, 8, 5],
                borderColor: '#8B4513',
                fill: false,
              },
            ],
          },
          options: {
            responsive: true,
            plugins: {
              legend: { display: false },
            },
          },
        });
      } else {
        console.error("Canvas for Productivity Chart not found!");
      }
    },
  },
  
    goHome() {
      this.$router.push({ name: 'HomePage' });
    },
  
};
</script>

<style scoped>
.dashboard {
  font-family: 'Arial', sans-serif;
  color: #5A3825;
  background-color: #F5E7CE;
  padding: 20px;
  height: 100vh;
  display: flex;
  flex-direction: column;
}

.header {
  display: flex;
  align-items: center;
  justify-content: space-between; /* Align items to the left and center */
  margin-bottom: 20px;
}

.back-button {
  background: none;
  border: none;
  font-size: 20px;
  cursor: pointer;
  margin-left: 0; /* Ensure no extra margin on the left */
}

.title {
  text-align: center;
  font-size: 26px;
  flex-grow: 1; /* Make the title take up remaining space */
  text-align: center;
}

.insights {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 20px;
}

.chart {
  background-color: #E9D4B6;
  padding: 15px;
  border-radius: 10px;
  box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
}

canvas {
  width: 100% !important;
  height: 300px;
}

.mood-calendar {
  background-color: #E9D4B6;
  padding: 15px;
  border-radius: 10px;
  box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
}

.calendar {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  gap: 5px;
  margin: 10px 0;
}

.day {
  width: 20px;
  height: 20px;
  border-radius: 3px;
}

.day.positive {
  background-color: #4CAF50;
}

.day.negative {
  background-color: #F44336;
}

.day.neutral {
  background-color: #FFC107;
}

.legend {
  display: flex;
  justify-content: space-between;
}

.legend-item {
  display: flex;
  align-items: center;
  font-size: 14px;
}

.color-box {
  width: 15px;
  height: 15px;
  margin-right: 5px;
  border-radius: 3px;
}

.color-box.negative {
  background-color: #F44336;
}

.color-box.positive {
  background-color: #4CAF50;
}

.color-box.neutral {
  background-color: #FFC107;
}

.progress {
  text-align: center;
  background-color: #E9D4B6;
  padding: 15px;
  border-radius: 10px;
  box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
}

.progress-circle {
  width: 150px;
  height: 150px;
  margin: 0 auto;
  border: 10px solid transparent;
  border-top-color: #8B4513;
  border-right-color: #5A3825;
  border-bottom-color: #A0522D;
  border-radius: 50%;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 14px;
  font-weight: bold;
}

</style>
