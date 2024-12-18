<template>
  <div class="task-editor">
    <div class="header">
      <button class="close-btn" @click="cancel">✕ Cancel</button>
    </div>

    <div class="content">
      <h1>WORK</h1>

      <div class="form-group">
        <label>Edit list name :</label>
        <input type="text" v-model="formData.name" placeholder="Rename here" />
      </div>

      <div class="form-group">
        <label>Edit color :</label>
        <select v-model="formData.color">
          <option disabled value="">[Select a color]</option>
          <option value="red">Red</option>
          <option value="blue">Blue</option>
          <option value="green">Green</option>
          <option value="yellow">Yellow</option>
          <option value="orange">Orange</option>
          <option value="purple">Purple</option>
          <option value="pink">Pink</option>
          <option value="brown">Brown</option>
          <option value="black">Black</option>
          <option value="white">White</option>
          <option value="gray">Gray</option>
          <option value="cyan">Cyan</option>
          <option value="magenta">Magenta</option>
        </select>
      </div>

      <div class="form-group">
        <label>Change priority :</label>
        <select v-model="formData.priority">
          <option disabled value="">[Priority used before]</option>
          <option value="high">High</option>
          <option value="medium">Medium</option>
          <option value="low">Low</option>
        </select>
      </div>

      <div class="actions">
        <button class="delete-btn" @click="deleteList">Delete quest list</button>
        <button class="save-btn" @click="saveChanges">SAVE</button>
      </div>
    </div>
  </div>
</template>

<script>
import taskService from '@/services/taskService';

export default {
  name: "TaskEditor",
  props: {
    initialData: {
      type: Object,
      required: true,
      default: () => ({}),
    },
  },
  data() {
    return {
      formData: {
        name: this.initialData.name || "",
        color: this.initialData.color || "",
        priority: this.initialData.priority || "",
        id: this.initialData.id || null,
      },
    };
  },
  methods: {
    saveChanges() {
      if (!this.formData.name.trim() || !this.formData.color || !this.formData.priority) {
        alert("Please fill out all fields before saving!");
        return;
      }

      const updatedTask = {
        title: this.formData.name,
        color: this.formData.color,
        priority: this.formData.priority,
      };

      taskService.updateTask(this.formData.id, updatedTask).then(() => {
        alert(`Changes saved successfully!\nName: ${this.formData.name}\nColor: ${this.formData.color}\nPriority: ${this.formData.priority}`);
        this.$emit("close");
      }).catch((error) => {
        console.error("Error updating task:", error);
        alert("Failed to save changes. Please try again.");
      });
    },
    deleteList() {
      const confirmDelete = confirm("Are you sure you want to delete this quest list?");
      if (confirmDelete) {
        taskService.deleteTask(this.formData.id).then(() => {
          console.log("Quest list deleted.");
          this.$emit("close");
          alert("Quest list deleted successfully!");
        }).catch((error) => {
          console.error("Error deleting task:", error);
          alert("Failed to delete quest list. Please try again.");
        });
      }
    },
    cancel() {
      this.$emit("close");
    },
  },
};
</script>

<style scoped>
html, body {
  margin: 0; 
  padding: 0; 
  height: 100%; 
  width: 100%; 
  overflow: hidden;
  box-sizing: border-box;
}

.task-editor {
  background-color: #E8D1A7;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  font-family: "fantasy", serif;
  color: #743014;
}

.header {
  position: sticky;
  color: #E8D1A7;
  top: 0;
  padding: 32px;
  display: flex;
  align-items: flex-start;
  margin-bottom: 20px;
  background-color: #84592b;
}

.close-btn {
  padding: 10px;
  background: #bb7e3db9;
  color: #fff;
  border: none;
  border-radius: 10px;
  text-align: center;
  margin-right: 10px;
}

h1 {
  font-family: "Fantasy", serif;
  font-size: 40px;
  margin: 30px;
  margin-bottom: 20px;
  text-align: center;
  color: #743014;
  text-decoration: underline;
}

.form-group {
  margin-bottom: 15px;
  margin-top: 10px;
}

label {
  padding: 24px;
  font-family: "Fantasy", serif;
  margin-top: 10px;
  color: #741102;
  font-size: 20px;
  display: block;
  margin-bottom: 0px;
  margin-left: 300px;
  font-weight: bold;
}

input, select {
  width: 550px;
  padding: 10px;
  margin-left: 350px;
  border-radius: 5px;
  color: #E8D1A7;
  border: 1px solid #741102;
  background-color: #84592b;
  font-size: 14px;
}

select:hover, input:hover {
  opacity: 50%;
}

.actions {
  display: flex;
  justify-content: space-between;
  margin-top: 30px;
}

.delete-btn {
  background: #880404cc;
  color: #fff;
  border: none;
  font-family: fantasy, serif;
  padding: 20px;
  border-radius: 5px;
  margin-left: 150vh;
  font-size: large;
  cursor: pointer;
}

.save-btn {
  background: #84592b;
  color: #fff;
  border: none;
  height: min-content;
  font-size: large;
  margin-right: 50px;
  padding: 20px;
  border-radius: 5px;
  cursor: pointer;
}

.delete-btn:hover, .save-btn:hover {
  background: #741102;
}
</style>
