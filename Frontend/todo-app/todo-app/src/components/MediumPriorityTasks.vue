<template>
  <div class="tasks-container">
    <!-- Back Button -->
    <button class="back-button" @click="goHome">◀</button>
    <h1 class="page-title">Medium Priority Tasks</h1>

    <!-- Timeline Section -->
    <div class="timeline">
      <div v-for="(task, index) in tasks" :key="index" class="task-entry">
        <div class="timeline-marker"></div>
        <div class="task-box">
          <label :for="'task-' + index">Task {{ index + 1 }}:</label>
          <input
            type="text"
            :id="'task-' + index"
            v-model="tasks[index]"
            class="task-input"
            placeholder="Enter task details"
          />
          <button class="delete-button" @click="deleteTask(index)">Delete</button>
        </div>
      </div>
    </div>
    
    <button class="add-button" @click="addTask">Add Task</button>
    <button class="save-button" @click="saveTasks">Save Tasks</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tasks: ["", "", ""], // Three empty tasks for input
    };
  },
  methods: {
    goHome() {
      this.$router.push({ name: 'HomePage' });
    },
    addTask() {
      this.tasks.push("");
    },
    deleteTask(index) {
      this.tasks.splice(index, 1);
    },
    saveTasks() {
      alert("Tasks saved: " + JSON.stringify(this.tasks));
      // You can replace this with actual saving logic, e.g., API call
    }
  },
};
</script>

  
<style scoped>
/* Global Container */
.tasks-container {
  background-color: #f5deb3;
  color: #8b4513;
  font-family: 'Georgia', serif;
  padding: 20px;
  min-height: 100vh;
}

/* Back Button */
.back-button {
  background: none;
  border: none;
  color: #8b4513;
  font-size: 24px;
  cursor: pointer;
  margin-bottom: 20px;
}

/* Title Styles */
.page-title {
  text-align: center;
  font-size: 36px;
  margin-bottom: 30px;
}

/* Timeline Section */
.timeline {
  position: relative;
  margin-left: 30px;
  padding: 10px 0;
}

.task-entry {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
}

.timeline-marker {
  width: 20px;
  height: 20px;
  border-radius: 50%;
  background-color: #8b4513;
  border: 3px solid #f5deb3;
  margin-right: 15px;
}

.task-box {
  flex-grow: 1;
  background-color: #a0522d;
  padding: 10px;
  border-radius: 5px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
}

.task-box label {
  display: block;
  font-size: 16px;
  margin-bottom: 5px;
  color: #f5deb3;
}

.task-input {
  width: 100%;
  padding: 8px;
  font-size: 14px;
  border: none;
  border-radius: 4px;
  background-color: #f5deb3;
  color: #8b4513;
}

.task-input::placeholder {
  color: #8b4513;
}

.task-input:focus {
  outline: none;
  box-shadow: 0 0 4px #8b4513;
}

/* Buttons */
.add-button,
.save-button,
.delete-button {
  background-color: #8b4513;
  color: #f5deb3;
  border: none;
  padding: 10px 15px;
  font-size: 14px;
  border-radius: 5px;
  cursor: pointer;
  margin-top: 20px;
  display: block;
  margin-left: auto;
}

.save-button {
  background-color: #4caf50;
  margin-top: 10px;
}

.delete-button {
  background-color: #e74c3c;
  margin-top: 10px;
}

.add-button:hover,
.save-button:hover,
.delete-button:hover {
  background-color: #e0c5a3;
}
</style>
