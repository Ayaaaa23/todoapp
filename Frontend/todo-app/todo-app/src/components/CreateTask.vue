<template>
  <div class="create-task">
    <!-- Header -->
    <header class="header">
      <button class="cancel-btn" @click="cancel">Cancel</button>
      <h1>Create New Task</h1>
    </header>

    <!-- Form Content -->
    <form class="task-form" @submit.prevent="saveTask">
      <!-- Date Picker -->
      <div class="date-picker">
        <h2>Date</h2>
        <div class="scroll-bar">
          <select v-model="task.day">
            <option value="" disabled>Select Day</option>
            <option v-for="day in days" :key="day" :value="day">{{ day }}</option>
          </select>
          <select v-model="task.month">
            <option value="" disabled>Select Month</option>
            <option v-for="month in months" :key="month" :value="month">{{ month }}</option>
          </select>
          <select v-model="task.year">
            <option value="" disabled>Select Year</option>
            <option v-for="year in years" :key="year" :value="year">{{ year }}</option>
          </select>
        </div>
      </div>

      <!-- Time Picker -->
      <div class="time-picker">
        <h2>Time</h2>
        <div class="time-inputs">
          <input type="number" v-model="task.time.hour" min="0" max="23" class="time-input" placeholder="Hour"/> :
          <input type="number" v-model="task.time.minute" min="0" max="59" class="time-input" placeholder="Minute"/>
        </div>
      </div>

      <!-- Task Name -->
      <section class="form-section">
        <h2>Task Name</h2>
        <input v-model="task.name" type="text" placeholder="Write title here" class="task-name-input"/>
      </section>

      <!-- Category Selector -->
      <section class="form-section category-section">
        <h2>Category</h2>
        <select v-model="task.category" class="category-dropdown">
          <option value="" disabled>Select Category</option>
          <option value="Work">Work</option>
          <option value="Personal">Personal</option>
          <option value="Health">Health</option>
        </select>
      </section>

      <!-- Alarm -->
      <section class="form-section alarm-section">
        <label>
          <input type="checkbox" v-model="task.alarm"/>
          Alarm
        </label>
      </section>

      <!-- Buttons -->
      <div class="form-buttons">
        <button type="button" class="more-details-btn">More Task Details</button>
        <button type="submit" class="save-btn">Save</button>
      </div>
    </form>
  </div>
</template>

<script>
import taskService from '@/services/taskService'; // Importation du service taskService

export default {
  data() {
    return {
      task: {
        name: "",
        day: null,
        month: "November",
        year: new Date().getFullYear(),
        time: {
          hour: 0,
          minute: 0,
        },
        category: "",
        alarm: false,
      },
      days: Array.from({ length: 31 }, (_, i) => i + 1),
      months: [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December",
      ],
      years: Array.from({ length: 21 }, (_, i) => new Date().getFullYear() + i),
    };
  },
  methods: {
    // Méthode saveTask ajoutée ici
    saveTask() {
      const newTask = {
        title: this.task.name,
        date: `${this.task.year}-${this.task.month}-${this.task.day}`,
        time: `${this.task.time.hour}:${this.task.time.minute}`,
        category: this.task.category,
        alarm: this.task.alarm,
      };

      taskService.createTask(newTask).then(() => {
        alert("Task saved successfully!");
        this.$router.push('/tasks'); // Redirection vers la liste des tâches
      }).catch((error) => {
        console.error("Error saving task:", error);
        alert("Failed to save task. Please try again.");
      });
    },
    cancel() {
      alert("Task creation canceled!");
      this.$router.push('/tasks'); // Redirection vers la liste des tâches
    },
  },
};
</script>

<style scoped>
/* General Layout */
.create-task {
  font-family: 'Arial', sans-serif;
  background-color: #f3e0cf;
  color: #5c3a2e;
  max-width: 600px;
  margin: 20px auto;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* Header */
.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.header h1 {
  font-size: 24px;
}

.cancel-btn {
  background-color: transparent;
  color: #d2691e;
  border: none;
  cursor: pointer;
  font-size: 16px;
}

/* Date Picker */
.date-picker {
  margin-top: 20px;
}

.scroll-bar {
  display: flex;
  gap: 10px;
}

.scroll-bar select {
  padding: 10px;
  border: 1px solid #5c3a2e;
  border-radius: 4px;
  background-color: #e6d1bf;
}

/* Time Picker */
.time-input {
  width: 40px;
  padding: 5px;
  margin-right: 5px;
  border: 1px solid #5c3a2e;
  border-radius: 4px;
}

/* Task Name Input */
.task-name-input {
  width: 100%;
  padding: 10px;
  margin-top: 10px;
  border: 1px solid #5c3a2e;
  border-radius: 4px;
}

/* Category Selector */
.category-section {
  margin-top: 20px;
}

.category-dropdown {
  width: 100%;
  padding: 10px;
  border: 1px solid #5c3a2e;
  border-radius: 4px;
  background-color: #e6d1bf;
}

/* Alarm Section */
.alarm-section {
  display: flex;
  align-items: center;
  margin-top: 20px;
}

/* Buttons */
.form-buttons {
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
}

.more-details-btn, .save-btn {
  background-color: #5c3a2e;
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.more-details-btn:hover, .save-btn:hover {
  background-color: #734b37;
}

h2 {
  text-align: start;
  margin: 10px;
}
</style>
