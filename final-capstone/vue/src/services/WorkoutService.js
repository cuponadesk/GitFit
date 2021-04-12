import axios from 'axios';


const http = axios.create({
    baseURL: "http://localhost:8080"
  });

  export default{
    listTrainers() {
        return http.get(`/workout`);
      },

    generateWorkout(trainerID, bodyPartID, totalTime) {
      let query = "?totalTime=" + totalTime + "trainerID=" + trainerID +
      "bodyPartID=" + bodyPartID;
        return http.get(`/workout/generate` + query);
    }
    
  }