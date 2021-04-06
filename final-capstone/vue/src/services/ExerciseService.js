import axios from 'axios';


const http = axios.create({
    baseURL: "http://localhost:8080"
  });

  export default{

    addExercise(exercise){
        return http.post('/addExercise', exercise);
    },

    editExercise(exercise) {
      return http.put(`/editExercise/${exercise.id}`, exercise)
    }
  }