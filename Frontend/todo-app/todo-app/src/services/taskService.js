import axios from 'axios';

const API_URL = 'http://localhost:8000/api';

const getTasks = () => {
  return axios.get(`${API_URL}/tasks`);
};

const getTask = (id) => {
  return axios.get(`${API_URL}/tasks/${id}`);
};

const createTask = (task) => {
  return axios.post(`${API_URL}/tasks`, task);
};

const updateTask = async (id, task) => {
  try {
    const response = await axios.put(`${API_URL}/tasks/${id}`, task);
    console.log('Task updated:', response.data);
    return response.data;
  } catch (error) {
    if (error.response) {
      // Le serveur a répondu avec un statut autre que 2xx
      console.error('Le serveur a répondu avec le statut :', error.response.status);
      console.error('Données de la réponse :', error.response.data);
    } else if (error.request) {
      // Aucune réponse reçue
      console.error('Aucune réponse reçue :', error.request);
    } else {
      // Une autre erreur s'est produite lors de la configuration de la requête
      console.error('Erreur lors de la configuration de la requête :', error.message);
    }
    throw error;
  }
};

const deleteTask = (id) => {
  return axios.delete(`${API_URL}/tasks/${id}`);
};

export default {
  getTasks,
  getTask,
  createTask,
  updateTask,
  deleteTask,
};
