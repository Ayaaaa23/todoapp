<template>
  <div class="about">
    <div class="header">
      <div class="header-left">
        <img :src="require('@/assets/logo.jpg')" alt="logo" class="logo" />
      </div>
      <div class="header-text">
        <h1>About Us</h1>
        <h1>Quest Guardian</h1>
        <h3>Version 1.0.0</h3>
      </div>
    </div>

    <div class="content">
      <div class="intro">
        <h2>Introduction</h2>
        <p>QuestGuardian is your ultimate companion for managing tasks and quests in a gamified and engaging way.</p>
        <p>Embark on your daily adventures and conquer your goals.</p>
      </div>
      <div class="features">
        <h2>Features and Highlights</h2>
        <ul>
          <li>Gamified task management</li>
          <li>Progress tracking with levels and rewards</li>
          <li>Fantasy-themed interface</li>
          <li>Integration with calendars and reminders</li>
        </ul>
      </div>
    </div>

    <div class="dev">
      <h2>Developed by:</h2>
      <ul>
        <li>Gasem Sarah (Project Manager and UI Designer)</li>
        <li>Chelal Melissa Aya (Backend Developer)</li>
        <li>Bouzidi Ikram (Frontend Developer)</li>
        <li>Idres Amel (QA Engineer and DevOps)</li>
      </ul>
    </div>

    <div class="contact">
      <h2>Contact us at:</h2>
      <p>Email: support@questguardian.com</p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'AboutUs',
};
</script>

<style scoped>
*{
 
 margin: 0;
padding: 0;
box-sizing:border-box;
}


.about {
  background-color: #743014;
  text-align: center;
  padding: 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.header {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 20px;
}

.header-left {
  margin-right: 20px;
}

.logo {
  border-radius: 10%;
  height: 90px;
}

.header-text h1,
.header-text h3 {
  color: rgba(232, 209, 167, 0.75);
  background-color: #743014;
  margin: 0;
}

.content {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  margin-bottom: 20px;
  width: 100%;
}

.intro,
.features {
  background-color: rgba(232, 209, 167, 0.75);
  border: 1px solid #ddd;
  border-radius: 5px;
  text-align: center;
  padding: 20px;
  margin: 10px;
  flex: 1 1 45%; /* S'adapte sur une largeur de 45% */
  box-sizing: border-box; /* Inclut padding dans la largeur */
}

.intro p,
.features ul li,
.dev ul li,
.contact p {
  color: black;
}

.dev {
  margin-bottom: 20px;
}

.contact p {
  margin: 0;
}

@media (max-width: 768px) {
  .content {
    flex-direction: column;
    align-items: center;
  }

  .intro,
  .features {
    flex: 1 1 100%; /* Prend toute la largeur sur petits écrans */
    margin: 10px 0;
  }
}
</style>
