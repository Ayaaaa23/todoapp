<template>
  <div id="app" class="container">
    <!-- Header Section -->
    <header>
      <div class="header-left">
        <img :src="require('@/assets/logo.jpg')" alt="logo" class="logo" />
        <h1>My Lists</h1>
      </div>
      <button class="add-list-button" @click="navigateTo('CreateTask')">+</button>
    </header>

    <!-- Main Content -->
    <div class="content">
      <!-- Work Section -->
      <section class="work-section">
        <h2>WORK</h2>
        <ul>
          <li v-for="task in tasks" :key="task.id" :class="{ done: task.done }" class="task">
            <label>
              <input type="checkbox" v-model="task.done" @change="toggleTaskCompletion(task)" />
              {{ task.title }}
            </label>
            <button @click="navigateTo('EditCertain', task.id)">Edit</button>
            <button @click="deleteTask(task.id)">Delete</button>
          </li>
        </ul>
        <div class="add-task">
          <input v-model="newTaskTitle" type="text" placeholder="Add new task here" class="task-input" @keyup.enter="createTask" />
        </div>
      </section>
      
      <!-- Action Buttons Section -->
      <section class="actions">
        <button class="action-button" @click="navigateTo('TaskEditor')">Edit Quest List</button>
        <button v-if="selectedTaskId" class="action-button" @click="editCertainQuest">Edit a Certain Quest</button>
        <button class="action-button" @click="navigateTo('SpecialQuest')">Update your Mission and Reorganize Steps</button>
      </section>
    </div>
  </div>
</template>

<script>
import taskService from '@/services/taskService';

export default {
  data() {
    return {
      tasks: [],
      newTaskTitle: '',
      selectedTaskId: null, // Assure que l'ID de tâche sélectionné est initialisé
    };
  },
  methods: {
    fetchTasks() {
      taskService.getTasks().then(response => {
        this.tasks = response.data;
      }).catch((error) => {
        console.error("Error fetching tasks:", error);
        alert("Failed to fetch tasks. Please try again.");
      });
    },
    createTask() {
      if (this.newTaskTitle.trim()) {
        const newTask = { title: this.newTaskTitle, done: false };
        taskService.createTask(newTask).then(() => {
          this.fetchTasks(); // Rafraîchir la liste des tâches
          this.newTaskTitle = ''; // Réinitialiser le champ de saisie
        }).catch((error) => {
          console.error("Error creating task:", error);
          alert("Failed to create task. Please try again.");
        });
      } else {
        alert("Please enter a task title before adding!");
      }
    },
    toggleTaskCompletion(task) {
      const updatedTask = {
        ...task,
        done: !task.done,
      };
      taskService.updateTask(task.id, updatedTask).then(() => {
        const taskIndex = this.tasks.findIndex(t => t.id === task.id);
        if (taskIndex !== -1) {
          this.tasks.splice(taskIndex, 1, updatedTask);
        }
      }).catch((error) => {
        console.error("Error updating task:", error);
        alert("Failed to update task. Please try again.");
      });
    },
    deleteTask(id) {
      taskService.deleteTask(id).then(() => {
        this.fetchTasks(); // Rafraîchir la liste des tâches
      }).catch((error) => {
        console.error("Error deleting task:", error);
        alert("Failed to delete task. Please try again.");
      });
    },
    navigateTo(page, id = null) {
      const routeParams = id ? { name: page, params: { id } } : { name: page };
      this.$router.push(routeParams).catch((err) => {
        console.error("Navigation error:", err.message);
        alert("Navigation error. Please try again.");
      });
    },
    navigateToCreateTask() {
      this.navigateTo('CreateTask');
    },
    editCertainQuest() {
      if (this.selectedTaskId) {
        this.navigateTo('EditCertain', this.selectedTaskId);
      } else {
        console.error("No task selected for editing.");
      }
    },
    updateMission() {
      this.navigateTo('SpecialQuest');
    }
  },
  mounted() {
    this.fetchTasks();
  },
};
</script>

<style scoped>
/* Styles ici */
body {
  margin: 0;
  font-family: 'Caveat', cursive;
  background-color: #F5E6D8;
}

#app {
  display: flex;
  flex-direction: column;
  height: 100vh;
  font-family: Arial, sans-serif;
  color: #5C3A24;
}

/* Header */
header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 20px;
  background-color: #84592B;
  color: #F5E6D8;
}

.header, h1 {
  color: #e8d1a7;
  font-size: 60px;
}

.header-left {
  display: flex;
  align-items: center;
}

.logo {
  margin: 10px;
  border-radius: 50%;
  height: 60px;
}

.add-list-button {
  background-color: #743014;
  border: none;
  color: #F5E6D8;
  font-size: 24px;
  border-radius: 50%;
  width: 40px;
  height: 40px;
  cursor: pointer;
}

/* Main Content */
.content {
  display: flex;
  flex-direction: row;
  gap: 20px;
  padding: 20px;
}

.work-section {
  flex: 3;
  background-color: #F5E6D8;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.work-section h2 {
  margin-bottom: 20px;
  font-size: 24px;
  font-weight: bold;
  color: #743014;
}

ul {
  padding: 0;
  list-style: none;
}

.task {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

.task.done {
  text-decoration: line-through;
  color: gray;
}

.task input[type="checkbox"] {
  margin-right: 10px;
}

.add-task {
  display: flex;
  align-items: center;
  margin-top: 20px;
}

.task-input {
  flex: 1;
  padding: 10px;
  border: 1px solid #743014;
  border-radius: 5px;
  margin-right: 10px;
}

.task-add-button {
  padding: 10px;
  background-color: #743014;
  color: #F5E6D8;
  border: none;
  border-radius: 50%;
}

.actions {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.action-button {
  padding: 10px;
  background-color: #84592B;
  color: #F5E6D8;
  border: none;
  border-radius: 5px;
  font-size: 14px;
  text-align: center;
}
</style>
