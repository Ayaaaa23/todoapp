<template>
  <div class="pomodoro-timer">
    <!-- Affichage basé sur la condition -->
    
    <div v-if="!showDetailsPage">
      <!-- Partie existante du Pomodoro Timer -->
      <!-- Header -->
      <header class="header">
        <button class="back-button" @click="goHome" >◀</button>
        <h1>Pomodoro Timer</h1>
      </header>

      <!-- Quest Section -->
      <div class="quest-section">
        <label for="quest">Quest:</label>
        <input
          id="quest"
          v-model="questName"
          type="text"
          placeholder="Enter your task..."
        />
      </div>

      <!-- Timer Display -->
      <div class="timer-display">
        <h2>{{ formatTime }}</h2>
        <p>Cycle of Time: <strong>Pomodoro {{ currentCycle }}</strong></p>
      </div>

      <!-- Controls -->
      <div class="controls">
        <button @click="startTimer" :disabled="isRunning">▶</button>
        <button @click="pauseTimer" :disabled="!isRunning">⏸</button>
        <button @click="resetTimer">✖</button>
      </div>

      <!-- Progress Indicator -->
      <div class="progress-indicator">
        <span v-for="n in totalCycles" :key="n" :class="{ active: n <= currentCycle }">●</span>
      </div>

      <!-- Buttons -->
      <div class="buttons">
        <button @click="showDetailsPage = true">More Details?</button>
        <button @click="takeBreak">Take Break</button>
      </div>
    </div>

    <!-- Section "More Details" -->
    <div v-else>
      <!-- Header -->
      <header class="header">
        <button class="back-button" @click="showDetailsPage = false">◀</button>
        <h1>Settings</h1>
      </header>

      <!-- Settings Section -->
      <div class="settings-container">
        <div class="setting">
          <label>Focus Time</label>
          <select v-model="focusTime">
            <option v-for="time in focusOptions" :key="time" :value="time">{{ time }} min</option>
          </select>
        </div>

        <div class="setting">
          <label>Short Break</label>
          <select v-model="shortBreak">
            <option v-for="time in breakOptions" :key="time" :value="time">{{ time }} min</option>
          </select>
        </div>

        <div class="setting">
          <label>Long Break</label>
          <select v-model="longBreak">
            <option v-for="time in breakOptions" :key="time" :value="time">{{ time }} min</option>
          </select>
        </div>

        <div class="setting">
          <label>Interval</label>
          <select v-model="interval">
            <option v-for="interval in intervalOptions" :key="interval" :value="interval">{{ interval }}</option>
          </select>
        </div>
      </div>

      <!-- Save Button -->
      <button class="save-button" @click="saveSettings">Save</button>
    </div>
  </div>
</template>

<script>


export default {
  data() {
    return {
      questName: "",
      timeLeft: 25 * 60, // 25 minutes in seconds
      isRunning: false,
      intervalId: null,
      currentCycle: 1,
      totalCycles: 4,
      showDetailsPage: false, // État pour basculer entre la minuterie et "More Details"

      // Settings data
      focusTime: 25,
      shortBreak: 5,
      longBreak: 15,
      interval: 4,
      focusOptions: [15, 20, 25, 30, 35, 40],
      breakOptions: [3, 5, 10, 15],
      intervalOptions: [2, 3, 4, 5],
    };
  },
  computed: {
    formatTime() {
      const minutes = Math.floor(this.timeLeft / 60)
        .toString()
        .padStart(2, "0");
      const seconds = (this.timeLeft % 60).toString().padStart(2, "0");
      return `${minutes}:${seconds}`;
    },
  },
  methods: {
    startTimer() {
      if (!this.isRunning) {
        this.isRunning = true;
        this.intervalId = setInterval(() => {
          if (this.timeLeft > 0) {
            this.timeLeft--;
          } else {
            this.completeCycle();
          }
        }, 1000);
      }
    },
    pauseTimer() {
      this.isRunning = false;
      clearInterval(this.intervalId);
    },
    resetTimer() {
      this.pauseTimer();
      this.timeLeft = this.focusTime * 60;
    },
    completeCycle() {
      this.pauseTimer();
      this.currentCycle++;
      if (this.currentCycle > this.totalCycles) {
        alert("Pomodoro session complete!");
        this.resetTimer();
        this.currentCycle = 1;
      } else {
        alert("Cycle complete! Take a break.");
        this.timeLeft = this.shortBreak * 60; // Temps de pause court
      }
    },
    takeBreak() {
      this.pauseTimer();
      this.timeLeft = this.shortBreak * 60; // Pause courte
    },
    saveSettings() {
      alert(
        `Settings Saved:\nFocus Time: ${this.focusTime} min\nShort Break: ${this.shortBreak} min\nLong Break: ${this.longBreak} min\nInterval: ${this.interval}`
      );
      this.showDetailsPage = false;
      this.resetTimer();
    },
    
    goHome() {
      this.$router.push({ name: 'HomePage' });
    },
    
  },
};
</script>



<style scoped>
/* Container */
.pomodoro-timer {
  font-family: Arial, sans-serif;
  text-align: center;
  background-color: #f4e3c0;
  min-height: 100vh;
  padding: 20px;
  color: #743014;
}

/* Header */
.header {
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: #743014;
  color: #f4e3c0;
  padding: 10px;
  border-radius: 10px;
}

.back-button {
  position: absolute;
  left: 10px;
  background: none;
  border: none;
  color: #f4e3c0;
  font-size: 20px;
  cursor: pointer;
}

/* Quest Section */
.quest-section {
  margin: 20px 0;
}

.quest-section input {
  width: 80%;
  padding: 10px;
  border: 1px solid #743014;
  border-radius: 5px;
}

/* Timer Display */
.timer-display {
  margin: 20px 0;
}

.timer-display h2 {
  font-size: 48px;
  background-color: #743014;
  color: #f4e3c0;
  border-radius: 50%;
  width: 150px;
  height: 150px;
  line-height: 150px;
  margin: 0 auto;
}

/* Controls */
.controls button {
  font-size: 24px;
  margin: 10px;
  background-color: #743014;
  color: #f4e3c0;
  border: none;
  border-radius: 50%;
  width: 50px;
  height: 50px;
  cursor: pointer;
}

.controls button:disabled {
  background-color: #d3c4ad;
  cursor: not-allowed;
}

/* Progress Indicator */
.progress-indicator {
  margin: 20px 0;
}


.progress-indicator span {
  font-size: 20px;
  margin: 0 5px;
  color: #d3c4ad;
}

.progress-indicator .active {
  color: #743014;
}

/* Buttons */
.buttons button {
  margin: 10px;
  padding: 10px 20px;
  background-color: #743014;
  color: #f4e3c0;
  border: none;
  border-radius: 5px;
  font-size: 16px;
  cursor: pointer;
}

.buttons button:hover {
  background-color: #5a2610;
}

.header .back-button {
  position: absolute;
  left: 10px;
  background: none;
  border: none;
  color: #f4e3c0;
  font-size: 20px;
  cursor: pointer;
}
/* Global Container */
.pomodoro-settings {
  font-family: Arial, sans-serif;
  background-color: #f4e3c0;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 20px;
  color: #743014;
}
/* Header */
.header {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  background-color: #743014;
  color: #f4e3c0;
  padding: 10px;
  border-radius: 10px;
  margin-bottom: 20px;
}


/* Settings Container */
.settings-container {
  width: 100%;
  max-width: 400px;
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.setting {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #743014;
  padding: 10px;
  border-radius: 8px;
  color: #f4e3c0;
}

.setting select {
  background-color: #f4e3c0;
  border: none;
  border-radius: 5px;
  padding: 5px;
  font-size: 16px;
}

/* Save Button */
.save-button {
  background-color: #743014;
  color: #f4e3c0;
  border: none;
  border-radius: 10px;
  padding: 10px 20px;
  font-size: 18px;
  cursor: pointer;
  margin-top: 20px;
}

.save-button:hover {
  background-color: #5a2610;
}
</style>

