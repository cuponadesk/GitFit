
package com.techelevator.controller;


import com.techelevator.dao.ExerciseDAO;
import com.techelevator.dao.WorkoutDAO;
import com.techelevator.model.Exercise;
import com.techelevator.model.ExerciseTrainer;
import com.techelevator.model.Workout;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin

public class WorkoutController {

    private WorkoutDAO workoutDAO;
    public WorkoutController(WorkoutDAO workoutDAO){

        this.workoutDAO= workoutDAO;
    }


    @RequestMapping(path= "/workout/generate", method = RequestMethod.GET)
    public List<ExerciseTrainer> generatedWorkout(@RequestParam(required = false) int[] trainerIds, @RequestParam(required = false) int[] bodyTargetIds, @RequestParam int totalTime){
        if(trainerIds == null){
            trainerIds = new int[0];
        }
        if(bodyTargetIds == null){
            bodyTargetIds = new int[0];
        }
        return workoutDAO.generateWorkout(trainerIds, bodyTargetIds, totalTime);
    }
}

