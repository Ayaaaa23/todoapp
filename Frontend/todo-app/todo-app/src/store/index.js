
import { createStore } from 'vuex';

export default createStore({
  state: {
    user: null,
    tasks: [
      { id: 1, title: 'Complete Vue.js tutorial', priority: 'High', dueDate: '2024-11-25', status: 'Due Today' },
      { id: 2, title: 'Buy groceries', priority: 'Medium', dueDate: '2024-11-26', status: 'In Progress' },
      { id: 3, title: 'Prepare for meeting', priority: 'Low', dueDate: '2024-11-27', status: 'Special Quest' }
    ],
    notifications: [],
    taskPriorities: ['High', 'Medium', 'Low'],
    taskStatuses: ['Due Today', 'In Progress', 'Completed'],
  },
  mutations: {
    setUser(state, user) {
      state.user = user;
    },
    setTasks(state, tasks) {
      state.tasks = tasks;
    },
    addTask(state, task) {
      state.tasks.push(task);
    },
    addNotification(state, notification) {
      state.notifications.push(notification);
    },
    resetNotifications(state) {
      state.notifications = [];
    }
  },
  actions: {
    async fetchTasks({ commit }) {
      // Remplacer par un appel API pour récupérer les tâches
      commit('setTasks', this.state.tasks);
    },
    addTask({ commit }, task) {
      commit('addTask', task);
    },
    addNotification({ commit }, notification) {
      commit('addNotification', notification);
    }
  },
  getters: {
    completedTasks(state) {
      return state.tasks.filter(task => task.status === 'Completed');
    },
    dueTodayTasks(state) {
      return state.tasks.filter(task => task.status === 'Due Today');
    },
  }
});
