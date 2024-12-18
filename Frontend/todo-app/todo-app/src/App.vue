<template>
  <div id="app">
    <MenuP />
    <div class="content">
      <router-view />
    </div>
  </div>
</template>

<script>
import MenuP from './components/MenuP.vue';


export default {
  name: 'App',
  components:{
    MenuP
  }
  
};
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  margin: 0;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}


</style>
