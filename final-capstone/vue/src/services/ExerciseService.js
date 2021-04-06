import axios from 'axios';


const http = axios.create({
    baseURL: "http://localhost:8080"
  });

  export default{

    addExercise(exercise){
        return http.post('/exercise/add', exercise);
    },

    editExercise(exercise) {
      return http.put(`/exercise/${exercise.id}`, exercise)
    }
  }