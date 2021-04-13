import axios from 'axios';


const http = axios.create({
    baseURL: "http://localhost:8080"
  });

  export default{
    listTrainers() {
        return http.get(`/workout`);
      },

    generateWorkout(totalTime, trainerID, bodyPartID) {
      let query = "?totalTime=" + totalTime + "&trainerID=" + trainerID +
      "&bodyPartID=" + bodyPartID;
        return http.get(`/workout/generate` + query);
    },

    saveCompletedWorkoutToDatabase(exercises) {
        return http.post('workout/save/',exercises);

    },
    getSavedUserWorkouts(){
      return http.get('/workout/history');
    }
    
    
  }