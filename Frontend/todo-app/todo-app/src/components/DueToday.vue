<template>
  <div id="app" class="container">
    <!-- Header Section -->
    <header class="header">
      <button class="back-button" @click="goHome">◀</button>
      <div class="title">
        <h1>Due Today</h1>
        <p>{{ currentDate }}</p>
      </div>
      <button class="new-task-button" @click="addTask">+ New Task</button>
    </header>

    <!-- Tabs Section -->
    <nav class="tabs">
      <button v-for="tab in tabs" :key="tab" :class="{ active: tab === activeTab }" @click="activeTab = tab">
        {{ tab }}
      </button>
    </nav>

    <!-- Task List Section -->
    <main class="tasks">
      <div v-for="task in filteredTasks" :key="task.id" class="task-item">
        <h2>{{ task.title }}</h2>
        <p>{{ task.time }}</p>
        <p>{{ task.date }}</p>
        <button class="edit-button" @click="editTask(task.id)">Edit</button>
        <button class="delete-button" @click="deleteTask(task.id)">Delete</button>
      </div>
    </main>

    <!-- Edit Task Modal -->
    <div v-if="isEditing" class="modal">
      <div class="modal-content">
        <span class="close" @click="closeEditModal">&times;</span>
        <h2>Edit Task</h2>
        <input type="text" v-model="editingTask.title" placeholder="Task Title" />
        <input type="text" v-model="editingTask.time" placeholder="Task Time" />
        <input type="text" v-model="editingTask.date" placeholder="Task Date" />
        <button @click="saveTask">Save</button>
      </div>
    </div>
  </div>
</template>


  
<script>
export default {
  data() {
    return {
      tabs: ["All", "Work", "Personal", "Health"],
      activeTab: "All",
      tasks: [
        { id: 1, title: "Client review and feedback", time: "Today 10:00 PM - 11:45 PM", date: "2024-05-11", category: "Work" },
        { id: 2, title: "Wireframes", time: "Today 10:00 PM - 11:45 PM", date: "2024-05-11", category: "Personal" },
        { id: 3, title: "Meeting with the team", time: "Today 10:00 PM - 11:45 PM", date: "2024-05-11", category: "Work" },
      ],
      nextTaskId: 4, // ID pour la prochaine tâche ajoutée
      currentDate: new Date().toLocaleDateString(),
      isEditing: false,
      editingTask: {}
    };
  },
  computed: {
    filteredTasks() {
      if (this.activeTab === "All") {
        return this.tasks;
      }
      return this.tasks.filter((task) => task.category === this.activeTab);
    },
  },
  methods: {
    goHome() {
      this.$router.push({ name: 'HomePage' });
    },
    addTask() {
      const newTask = { id: this.nextTaskId++, title: "New Task", time: "No time set", date: this.currentDate, category: this.activeTab === "All" ? "Work" : this.activeTab };
      this.tasks.push(newTask);
    },
    deleteTask(taskId) {
      this.tasks = this.tasks.filter(task => task.id !== taskId);
    },
    editTask(taskId) {
      this.isEditing = true;
      this.editingTask = { ...this.tasks.find(task => task.id === taskId) };
    },
    saveTask() {
      const index = this.tasks.findIndex(task => task.id === this.editingTask.id);
      if (index !== -1) {
        this.tasks.splice(index, 1, this.editingTask);
      }
      this.isEditing = false;
    },
    closeEditModal() {
      this.isEditing = false;
    }
  },
};
</script>

  
<style scoped>
/* General Styling */
body {
  height: 100vh;
  margin: 0;
  font-family: "Arial", sans-serif;
  background-color: #e8d1a7;
}

.container {
  height: 100vh;
  display: flex;
  flex-direction: column;
}

/* Header Styling */
.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #84592b;
  color: #e8d1a7;
  padding: 10px;
  border-radius: 10px;
}

.back-button {
  background-color: transparent;
  border: none;
  color: #e8d1a7;
  font-size: 20px;
  cursor: pointer;
}

.title {
  text-align: center;
}

.new-task-button {
  background-color: #743014;
  border: none;
  color: #e8d1a7;
  padding: 10px;
  border-radius: 5px;
  cursor: pointer;
}

/* Tabs Styling */
.tabs {
  display: flex;
  justify-content: space-around;
  margin: 20px 0;
}

.tabs button {
  background-color: transparent;
  border: none;
  font-size: 16px;
  color: #743014;
  cursor: pointer;
  padding: 5px 10px;
}

.tabs button.active {
  font-weight: bold;
  text-decoration: underline;
}

/* Tasks Section */
.tasks {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.task-item {
  background-color: #84592b;
  color: #e8d1a7;
  padding: 10px;
  border-radius: 10px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.task-item h2 {
  margin: 0;
}

.task-item p {
  margin: 5px 0 0;
  font-size: 14px;
  color: #d1c3a7;
}

/* Buttons */
.delete-button {
  background-color: #84592b;
  color: #f5deb3;
  border: none;
  padding: 5px 10px;
  font-size: 14px;
  border-radius: 5px;
  cursor: pointer;
  margin-top: 10px;
}

.delete-button:hover {
  background-color: #e0c5a3;
}
</style>
