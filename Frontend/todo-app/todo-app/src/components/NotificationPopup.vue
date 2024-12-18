<template>
    <div v-if="show" class="popup">
      <div class="popup-content">
        <p>{{ message }}</p>
        <button @click="goToDashboard">Click here for more details</button>
        <button @click="close">Close</button>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    props: {
      show: {
        type: Boolean,
        default: false
      },
      message: {
        type: String,
        default: 'You have notifications!'
      }
    },
    methods: {
      goToDashboard() {
        this.$emit('close');
        this.$router.push({ name: 'UserDashboard' });
      },
      close() {
        this.$emit('close');
      }
    }
  }
  </script>
  
  <style scoped>
  .popup {
    position: fixed;
    top: 10px;
    right: 10px;
    width: auto;
    height: auto;
    background: white;
    padding: 15px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    z-index: 1000;
  }
  
  .popup-content {
    text-align: center;
  }
  
  .popup-content button {
    margin-top: 10px;
    padding: 5px 10px;
    background-color: #5A3825;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }
  
  .popup-content button:hover {
    background-color: #8B4513;
  }
  </style>
  