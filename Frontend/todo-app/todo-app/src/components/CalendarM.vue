<template>
  <div>
    <!-- Page Calendrier -->
    <div v-if="currentView === 'calendar'" class="calendar-page">
      <div class="calendar-header">
        <button @click="prevMonth" class="nav-button">←</button>
        <h2>{{ monthName }} {{ year }}</h2>
        <button @click="nextMonth" class="nav-button">→</button>
      </div>

      <div class="calendar">
        <div class="weekdays">
          <div v-for="(day, index) in weekdays" :key="index" class="weekday">
            {{ day }}
          </div>
        </div>

        <div class="days">
          <div
            v-for="(day, index) in daysInMonth"
            :key="index"
            class="day"
            :class="{ today: isToday(day) }"
          >
            {{ day }}
          </div>
        </div>
      </div>

      <div class="today-events">
        <h3>Today</h3>
        <div class="event" v-for="(event, index) in events" :key="index">
          <span class="event-title">{{ event.title }}</span>
          <span class="event-time">{{ event.time }}</span>
          <button @click="markInProgress" class="status-btn">{{ event.status }}</button>
        </div>

        <button @click="addEvent" class="add-event-btn">+</button>
      </div>
    </div>

    <!-- Page Créer une Tâche -->
    <div v-else-if="currentView === 'createTask'" class="create-task-page">
      <div class="header">
        <button class="cancel-button" @click="goBack">Cancel</button>
        <h1>Create New Task</h1>
      </div>
      <div class="form">
        <div class="form-group">
          <label for="date">Date</label>
          <input id="date" type="date" placeholder="Select date" />
        </div>
        <div class="form-group">
          <label for="time">Time</label>
          <div class="time-inputs">
            <input id="hour" type="number" min="0" max="23" placeholder="Hour" />
            <span>:</span>
            <input id="minute" type="number" min="0" max="59" placeholder="Minute" />
          </div>
        </div>
        <div class="form-group">
          <label for="quest-name">Quest Name</label>
          <input id="quest-name" type="text" placeholder="Write task name here" />
        </div>
        <div class="form-group">
          <label for="description">Description</label>
          <textarea id="description" placeholder="Write details here"></textarea>
        </div>
        <div class="form-actions">
          <button class="save-button">Save Task</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "CalendarM",
  data() {
    return {
      currentView: "calendar", // Vue actuelle : 'calendar' ou 'createTask'
      currentDate: new Date(),
      events: [
        { date: 17, title: "Client meeting", time: "10:00am - 12:00am", status: "In Progress" },
        { title: "Dinner with Sarah", time: "9:00pm", status: "Not done yet" },
        { title: "Design meeting", time: "11:00am", status: "Pending" },
      ],
    };
  },
  computed: {
    monthName() {
      const options = { month: "long" };
      return new Intl.DateTimeFormat("en-US", options).format(this.currentDate);
    },
    year() {
      return this.currentDate.getFullYear();
    },
    weekdays() {
      return ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    },
    daysInMonth() {
      const daysInMonth = new Date(this.currentDate.getFullYear(), this.currentDate.getMonth() + 1, 0).getDate();
      const days = [];
      for (let i = 1; i <= daysInMonth; i++) {
        days.push(i);
      }
      return days;
    },
  },
  methods: {
    isToday(day) {
      return (
        day === this.currentDate.getDate() &&
        this.currentDate.getMonth() === new Date().getMonth() &&
        this.currentDate.getFullYear() === new Date().getFullYear()
      );
    },
    prevMonth() {
      this.currentDate.setMonth(this.currentDate.getMonth() - 1);
    },
    nextMonth() {
      this.currentDate.setMonth(this.currentDate.getMonth() + 1);
    },
    markInProgress() {
      alert("Event marked as in progress");
    },
    addEvent() {
      // Change la vue à "createTask" pour afficher le formulaire de création
      this.currentView = "createTask";
    },
    goBack() {
      // Retourne à la vue "calendar"
      this.currentView = "calendar";
    },
  },
};
</script>

<style scoped>
/* General Styles */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Arial', sans-serif;
  background-color: #3e2b2b; /* Dark brown background */
  color: #e0c5a3; /* Light beige text */
}

/* Header Styles */
.calendar-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #b25a2c; /* Light brown header */
  padding: 10px 20px;
  border-radius: 10px;
  margin-bottom: 20px;
}

.calendar-header button.nav-button {
  background-color: #f0e2d0;
  border: none;
  padding: 10px;
  cursor: pointer;
  font-size: 1.5em;
  border-radius: 5px;
  transition: background-color 0.3s;
}

.calendar-header button.nav-button:hover {
  background-color: #e0c5a3;
}

.calendar-header h2 {
  font-size: 2em;
  font-weight: bold;
  color: #e0c5a3;
}

/* Calendar Layout */
.calendar {
  display: flex;
  flex-direction: column;
}

.weekdays {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  background-color: #f0e2d0;
  text-align: center;
  color: #3e2b2b;
}

.weekday {
  font-weight: bold;
  padding: 10px 0;
}

.days {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  gap: 10px;
  padding: 10px 0;
}

.day {
  background-color: #fff;
  text-align: center;
  padding: 15px;
  cursor: pointer;
  border-radius: 8px;
  transition: background-color 0.3s;
}

.day:hover {
  background-color: #e0c5a3;
}

.day.today {
  background-color: #ffeb3b;
}

.day.today:hover {
  background-color: #ffeb3b;
  color: #3e2b2b;
}

/* Today Event Section */
.today-events {
  margin-top: 20px;
  background-color: #b25a2c; /* Light brown background */
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.today-events h3 {
  font-size: 1.5em;
  margin-bottom: 10px;
  color: #e0c5a3;
}

.event {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 10px;
  color: #e0c5a3;
}

.event-title {
  font-weight: bold;
}

.status-btn {
  background-color: #42b983;
  color: white;
  border: none;
  padding: 5px 10px;
  border-radius: 2px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.status-btn:hover {
  background-color: #38a169;
}

.add-event-btn {
  background-color: #f0e2d0;
  padding: 10px;
  border: none;
  cursor: pointer;
  font-size: 1.5em;
  border-radius: 50%;
  margin-top: 10px;
  transition: background-color 0.3s, box-shadow 0.3s;
}

.add-event-btn:hover {
  background-color: #e0c5a3;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* Create Task Page */
.create-task-page {
  max-width: 600px;
  margin: 0 auto;
  padding: 20px;
  background-color: #f0e2d0;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.cancel-button {
  background-color: #b25a2c;
  color: #fff;
  border: none;
  padding: 10px 15px;
  border-radius: 5px;
  cursor: pointer;
  font-size: 1em;
  transition: background-color 0.3s;
}

.cancel-button:hover {
  background-color: #943a1e;
}

h1 {
  color: #3e2b2b;
  font-size: 1.8em;
}

.form {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.form-group {
  display: flex;
  flex-direction: column;
}

label {
  font-size: 1.1em;
  margin-bottom: 5px;
  color: #3e2b2b;
}

input, textarea {
  padding: 10px;
  font-size: 1em;
  border: 1px solid #b25a2c;
  border-radius: 5px;
  transition: border-color 0.3s, box-shadow 0.3s;
}

textarea {
  resize: none;
  height: 80px;
}

input:focus, textarea:focus {
  outline: none;
  border-color: #e0c5a3;
  box-shadow: 0 0 5px #e0c5a3;
}

.time-inputs {
  display: flex;
  align-items: center;
  gap: 5px;
}

.save-button {
  background-color: #42b983;
  color: #fff;
  padding: 10px;
  font-size: 1em;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  align-self: flex-end;
  transition: background-color 0.3s;
}

.save-button:hover {
  background-color: #38a169;
}
</style>
