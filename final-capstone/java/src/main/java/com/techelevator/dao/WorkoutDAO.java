
package com.techelevator.dao;

import com.techelevator.model.Exercise;
import com.techelevator.model.ExerciseTrainer;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

public interface WorkoutDAO {

//
//    List<Exercise> filterByTotalTime();
//    List<Exercise> filterByTrainer();
//    List<Exercise> filterByBodyTarget();
//    createWorkout();

    List<ExerciseTrainer> generateWorkout(int[] trainerIds, int[] bodyTargetIds, int totalTime);
}

