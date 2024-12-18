<template>
    <div id="app">
      <h1>Which Quest are you gonna change?</h1>
  
      <!-- Title for the Task List -->
      <h2 class="list-title">{{ listTitle }}</h2>
  
      <!-- Task List -->
      <div class="task-list">
        <div 
          class="task-item" 
          v-for="(task, index) in tasks" 
          :key="index" 
          @click="openTaskEditor(index)"
        >
          {{ task.name }}
        </div>
      </div>
  
      <!-- Edit Modal -->
      <div v-if="isModalOpen">
        <div class="overlay" @click="closeModal"></div>
        <div class="modal">
          <button class="close-button" @click="closeModal">&#x2715; Cancel</button>
          <h2>{{ currentTask.name }}</h2>
  
          <!-- Form Fields -->
          <div class="form-field">
            <label>Rename Your Quest</label>
            <input type="text" v-model="currentTask.name" />
          </div>
  
          <div class="form-field">
            <label>Change Priority</label>
            <select v-model="currentTask.priority">
              <option>Low</option>
              <option>Medium</option>
              <option>High</option>
            </select>
          </div>
  
          <div class="form-field">
            <label>Change Your Realm</label>
            <select v-model="currentTask.realm">
              <option v-for="realm in realms" :key="realm" :value="realm">{{ realm }}</option>
            </select>
          </div>
  
          <div class="form-field">
            <label>Modify Alerts</label>
            <select v-model="currentTask.alerts">
              <option>None</option>
              <option>Email</option>
              <option>1 hour before</option>
              <option>1 day before</option>
            </select>
          </div>
  
          <div class="form-field">
            <label>Update Your Mission</label>
            <textarea v-model="currentTask.mission"></textarea>
          </div>
  
          <div class="form-field">
            <label>Adjust Your Deadline</label>
            <input type="date" v-model="currentTask.deadline" />
            <input type="time" v-model="currentTask.time" />
          </div>
  
          <div class="form-field">
            <label>Reorganize Steps</label>
            <div v-for="(subTask, index) in currentTask.subTasks" :key="index">
              <div class="sub-task">
                <label>Sub-Quest {{ index + 1 }}:</label>
                <textarea v-model="subTask.details"></textarea>
              </div>
            </div>
            <button class="add-sub-task" @click="addSubTask">+ Add new Sub-Quest</button>
          </div>
  
          <button @click="saveTask">Save Changes</button>
        </div>
      </div>
  
      <!-- Notification -->
      <div v-if="notification" class="notification">{{ notification }}</div>
    </div>
  </template>
  <script>
  export default {
    data() {
      return {
        listTitle: "Work", // Title for the task list
        tasks: [
          { 
            name: "Respond to emails", 
            priority: "Low", 
            realm: "Office", 
            alerts: "None", 
            mission: "", 
            deadline: "", 
            time: "", 
            subTasks: []
          },
          { 
            name: "Finish project report", 
            priority: "High", 
            realm: "Office", 
            alerts: "Email", 
            mission: "", 
            deadline: "", 
            time: "", 
            subTasks: []
          },
          { 
            name: "Team meeting", 
            priority: "Medium", 
            realm: "Office", 
            alerts: "1 hour before", 
            mission: "", 
            deadline: "", 
            time: "", 
            subTasks: []
          }
        ],
        realms: ["Office", "Home", "Personal"], // List of realms
        isModalOpen: false,
        currentTask: {},
        currentTaskIndex: null,
        notification: "" // Notification message
      };
    },
    methods: {
      openTaskEditor(index) {
        this.currentTaskIndex = index;
        this.currentTask = { ...this.tasks[index] };
        this.isModalOpen = true;
      },
      saveTask() {
        if (this.currentTaskIndex !== null) {
          this.tasks[this.currentTaskIndex] = { ...this.currentTask };
          this.showNotification("Task updated successfully!");
        }
        this.closeModal();
      },
      closeModal() {
        this.isModalOpen = false;
        this.currentTask = {};
        this.currentTaskIndex = null;
      },
      showNotification(message) {
        this.notification = message;
        setTimeout(() => {
          this.notification = "";
        }, 3000);
      },
      addSubTask() {
        if (!this.currentTask.subTasks) {
          this.currentTask.subTasks = [];
        }
        this.currentTask.subTasks.push({ details: "" });
      }
    }
  };
  </script>
  
  <style>
  body {
    font-family: 'Arial', sans-serif;
    background-color: #e8d1a7;
    color: #5e3c1b;
    text-align: center;
    margin: 0;
    padding: 0;
  }
  
  h1 {
    margin: 0;
    padding: 50px;
    background-color: #84592b;
    color: #e8d1a7;
    font-size: 3rem;
    font-family: 'fantasy';
  }
  
  .list-title {
    color: #743014;
    font-size: 40px;
    font-weight: bold;
    font-family: 'fantasy';
  }
  
  .task-list {
    padding: 10px;
    margin: 20px auto;
    width: 30%;
    text-align: left;
  }
  
  .task-item {
    padding: 10px;
    border: 1px solid #d4b895;
    border-radius: 5px;
    margin-bottom: 10px;
    cursor: pointer;
    background-color: #F4DDB8;
  }
  
  .task-item:hover {
    background-color: #ffe8cc;
  }
  
  .modal {
    display: block;
    position: fixed;
    top: 10%; /* Adjusted height for better visibility */
    left: 50%;
    transform: translate(-50%, 0);
    width: 800px;
    background-color: #fdf6e3;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    border-radius: 10px;
    padding: 40px;
    z-index: 1000;
    color: #5e3c1b;
    max-height: 80%; /* Limit the height for better usability */
    overflow-y: auto; /* Add scroll if content exceeds the modal */
  }
  
  .modal h2 {
    font-size: 2rem;
    text-align: left;
    margin-bottom:45px;
    margin-left:20px;
  }
  
  .form-field {
    margin-bottom: 25px;
    text-align: left;
    margin-bottom:25px;
  }
  
  .form-field label {
    display: block;
    font-weight: bold;
    margin-bottom: 8px;
  }
  
  .form-field input,
  .form-field textarea,
  .form-field select {
    width: 100%;
    padding: 15px;
    border: 1px solid #d4b895;
    border-radius: 5px;
    font-size: 1.2rem;
  }
  
  .modal button {
    padding: 15px 30px;
    background-color: #5e3c1b;
    color: #e8d1a7;
    font-size: 1.2rem;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }
  
  .modal button:hover {
    background-color: #3d270f;
  }
  
  .close-button {
    position: absolute;
    top: 15px;
    right: 15px;
    background: none;
    border: none;
    font-size: 1.5rem;
    color: #5e3c1b;
    cursor: pointer;
  }
  
  .overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 999;
  }
  .notification {
  position: fixed;
  bottom: 20px;
  right: 20px;
  background-color: #84592b;
  color: #e8d1a7;
  padding: 15px 25px;
  border-radius: 5px;
  font-size: 1rem;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
}

.sub-task {
  margin-bottom: 15px;
}

.add-sub-task {
  padding: 12px;
  background-color: #5e3c1b;
  color: #e8d1a7;
  font-size: 0.9rem;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.add-sub-task:hover {
  background-color: #3d270f;
}
</style>