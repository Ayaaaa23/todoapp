<template>
  <div id="special-quest" class="container">
    <!-- Header Section -->
    <header>
      <button class="back-button" @click="goHome">◀</button>
      <h1>Special Quest</h1>
    </header>

    <!-- Main Content -->
    <div class="content">
      <h2 class="title">Your Quest Details</h2>

      <div class="quest-card">
        <h3>Title: "Web Design Challenge"</h3>
        <p><strong>Date:</strong> December 03, 2024</p>
        <p><strong>Status:</strong> In Progress</p>
        <div class="progress">
          <div class="progress-bar" :style="{ width: progress + '%' }"></div>
        </div>
        <p><strong>Progress:</strong> {{ progress }}%</p>
        <input v-if="editMode" v-model="progress" type="number" min="0" max="100" />
        <button class="edit-button" @click="toggleEditMode">{{ editMode ? 'Save' : 'Edit Quest' }}</button>
      </div>

      <!-- Steps Section -->
      <div class="steps">
        <h3>Steps</h3>
        <ul>
          <li v-for="(step, index) in steps" :key="index" class="step">
            <p v-if="!step.editMode">{{ step.text }}</p>
            <input v-else v-model="step.text" />
            <div class="progress">
              <div class="progress-bar" :style="{ width: step.progress + '%' }"></div>
            </div>
            <p>{{ step.progress }}% Completed</p>
            <input v-if="step.editMode" v-model="step.progress" type="number" min="0" max="100" />
            <button @click="toggleStepEditMode(index)">{{ step.editMode ? 'Save' : 'Edit' }}</button>
          </li>
        </ul>
      </div>

      <!-- Action Buttons -->
      <div class="actions">
        <button class="action-button" @click="markComplete">Mark Complete</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      editMode: false,
      progress: 75,
      steps: [
        { text: "Research modern web design trends", progress: 50, editMode: false },
        { text: "Create wireframes for the project", progress: 80, editMode: false },
        { text: "Get feedback from the team", progress: 30, editMode: false },
      ],
    };
  },
  methods: {
    goHome() {
      this.$router.push({ name: "HomePage" });
    },
    toggleEditMode() {
      this.editMode = !this.editMode;
      if (!this.editMode) {
        // Logique pour sauvegarder les modifications
        alert("Quest updated successfully!");
      }
    },
    toggleStepEditMode(index) {
      this.steps[index].editMode = !this.steps[index].editMode;
    },
    markComplete() {
      alert("Quest marked as complete!");
    }
  },
};
</script>

<style scoped>
.container {
  font-family: 'Arial', sans-serif;
  background-color: #E8D1A7;
  color: #743014;
  height: 100vh;
  display: flex;
  flex-direction: column;
}

header {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 10px 20px;
  background-color: #84592B;
  color: #E8D1A7;
}

.back-button {
  background-color: transparent;
  border: none;
  color: #e8d1a7;
  font-size: 20px;
  cursor: pointer;
}

.content {
  flex: 1;
  padding: 20px;
}

.title {
  font-size: 24px;
  margin-bottom: 20px;
  text-align: center;
}

.quest-card {
  background-color: #743014;
  color: #E8D1A7;
  border-radius: 10px;
  padding: 20px;
  margin-bottom: 20px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.progress {
  background-color: #E8D1A7;
  border-radius: 5px;
  height: 10px;
  overflow: hidden;
  margin: 10px 0;
}

.progress-bar {
  background-color: #84592B;
  height: 100%;
}

.steps {
  margin-top: 20px;
}

.step {
  margin-bottom: 15px;
  padding: 10px;
  background-color: #E8D1A7;
  border: 2px solid #743014;
  border-radius: 10px;
}

.actions {
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
}

.action-button {
  padding: 10px 20px;
  background-color: #84592B;
  color: #E8D1A7;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.action-button:hover {
  background-color: #743014;
}
</style>
