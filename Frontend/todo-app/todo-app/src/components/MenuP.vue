<template>
  <div>
    <label>
      <input type="checkbox">
      <!-- Toggle Button -->
      <div class="toggle">
        <span class="top_line common"></span>
        <span class="middle_line common"></span>
        <span class="bottom_line common"></span>
      </div>

      <!-- Sidebar Menu -->
      <div class="menu">
        <h2>Menu: Guardian's Gateway</h2>
        <ul>
          <li><router-link class="too" to="/">Home Page</router-link></li>
          <li><router-link class="too" to="/tasks">Task List</router-link></li>
          <li><router-link class="too" to="/pomodoro-timer">Pomodoro Timer</router-link></li>
          <li><router-link class="too" to="/calendar">Calendar</router-link></li>
          <li><router-link class="too" to="/insights">Insights</router-link></li>
          <li><router-link class="too" to="/about">About</router-link></li>
          <li><router-link class="too" to="/settings">Settings</router-link></li>
        </ul>
      </div>
    </label>
  </div>
</template>

<script>
export default {
  name: "MenuP",
};
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}

/* Sidebar Menu */
.menu {
  position: fixed;
  top: 0;
  left: -300px; /* Menu initially hidden offscreen */
  height: 100%;
  width: 300px;
  padding: 20px;
  background-color: #e9d4b6;
  box-shadow: -2px 0px 5px rgba(0, 0, 0, 0.1);
  transition: 0.3s ease; /* Smooth transition for sliding */
  z-index: 1000;
}

.menu h2 {
  font-size: 18px;
  margin-bottom: 20px;
}

.menu ul {
  list-style: none;
  padding: 0;
}

.menu ul li {
  background-color: #8b4513;
  color: #fff;
  margin-bottom: 10px;
  padding: 10px;
  border-radius: 5px;
  font-size: 16px;
  text-align: center;
  cursor: pointer;
  box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
}

.menu ul li:hover {
  background-color: #743014;
}

.too {
  text-decoration: none;
  color: inherit;
  font-weight: bold;
}

/* Hide default checkbox */
input {
  display: none;
}

/* Toggle Button */
.toggle {
  position: fixed;
  top: 20px;
  left: 15px;
  height: 30px;
  width: 30px;
  z-index: 2000;
  cursor: pointer;
  border-radius: 2px;
  background-color: #743014;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

.toggle .common {
  position: absolute;
  height: 2px;
  width: 20px;
  background-color: #e8d1a7;
  border-radius: 50px;
  transition: 0.3s ease;
}

.toggle .top_line {
  top: 30%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.toggle .middle_line {
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.toggle .bottom_line {
  top: 70%;
  left: 50%;
  transform: translate(-50%, -50%);
}

/* Menu and toggle animation */
input:checked ~ .toggle .top_line {
  left: 2px;
  top: 14px;
  width: 25px;
  transform: rotate(45deg);
}

input:checked ~ .toggle .bottom_line {
  left: 2px;
  top: 14px;
  width: 25px;
  transform: rotate(-45deg);
}

input:checked ~ .toggle .middle_line {
  opacity: 0;
  transform: translateX(20px);
}

input:checked ~ .menu {
  left: 0; /* Slide menu into view */
}
</style>
