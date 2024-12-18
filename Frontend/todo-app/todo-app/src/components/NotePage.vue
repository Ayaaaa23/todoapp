<template>
  <div class="notes-container">
    <!-- Back Button -->
    <button class="back-button" @click="goHome">◀</button>

    <!-- Page Title -->
    <h1 class="page-title">Notes</h1>

    <!-- Note Form -->
    <div class="note-form">
      <input v-model="newNoteTitle" type="text" placeholder="Enter note title" class="note-input" />
      <textarea v-model="newNoteContent" placeholder="Enter note content" class="note-textarea"></textarea>
      <button @click="addNote" class="add-note-button">Add Note</button>
    </div>

    <!-- Notes Grid -->
    <div class="notes-grid">
      <div class="note-card" v-for="(note, index) in notes" :key="index">
        <h2 class="note-title" @click="editNote(index)">{{ note.title }}</h2>
        <p class="note-content">{{ note.content }}</p>
        <p class="note-date">{{ note.date }}</p>
        <button @click="deleteNote(index)" class="delete-note-button">Delete</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      notes: [
        { title: "Title 1", content: "Placeholder", date: "12/12/2024" },
        { title: "Title 2", content: "Finish the backend", date: "11/12/2024" },
        { title: "Title 3", content: "Test everything", date: "10/12/2024" },
        { title: "Title 4", content: "empty", date: "09/12/2024" },
        
      ],
      newNoteTitle: "",
      newNoteContent: "",
      editingIndex: null,
    };
  },
  methods: {
    addNote() {
      const date = new Date().toLocaleDateString();

      if (this.editingIndex !== null) {
        this.notes[this.editingIndex] = {
          title: this.newNoteTitle,
          content: this.newNoteContent,
          date,
        };
        this.editingIndex = null;
      } else {
        this.notes.push({
          title: this.newNoteTitle,
          content: this.newNoteContent,
          date,
        });
      }

      this.newNoteTitle = "";
      this.newNoteContent = "";
    },
    editNote(index) {
      this.editingIndex = index;
      this.newNoteTitle = this.notes[index].title;
      this.newNoteContent = this.notes[index].content;
    },
    deleteNote(index) {
      this.notes.splice(index, 1);
    },
    goHome() {
      this.$router.push({ name: 'HomePage' });
    }
  }
};
</script>

<style scoped>
/* Global Container */
.notes-container {
  background-color: #f5deb3;
  color: #8b4513;
  font-family: 'Georgia', serif;
  padding: 20px;
  min-height: 100vh;
  position: relative;
}

/* Back Button */
.back-button {
  background: none;
  border: none;
  color: #8b4513;
  font-size: 24px;
  cursor: pointer;
  position: absolute;
  top: 20px;
  left: 20px;
}

/* Page Title */
.page-title {
  text-align: center;
  font-size: 36px;
  margin-bottom: 30px;
}

/* Note Form */
.note-form {
  display: flex;
  flex-direction: column;
  gap: 10px;
  margin-bottom: 20px;
}

.note-input, .note-textarea {
  padding: 10px;
  border: 1px solid #8b4513;
  border-radius: 5px;
}

.add-note-button {
  background-color: #8b4513;
  color: #f5deb3;
  padding: 10px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

/* Notes Grid */
.notes-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 20px;
}

/* Note Card */
.note-card {
  background-color: #8b4513;
  color: #f5deb3;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
}

.note-title {
  font-size: 20px;
  margin-bottom: 10px;
  cursor: pointer;
}

.note-content {
  font-size: 14px;
  margin-bottom: 15px;
  line-height: 1.5;
}

.note-date {
  font-size: 12px;
  text-align: right;
}

/* Delete Button */
.delete-note-button {
  background-color: #c0392b;
  color: #f5deb3;
  padding: 5px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin-top: 10px;
}

.delete-note-button:hover {
  background-color: #e74c3c;
}
</style>
