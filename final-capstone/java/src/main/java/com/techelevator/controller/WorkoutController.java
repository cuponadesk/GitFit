package com.techelevator.controller;


import com.techelevator.dao.ExerciseDAO;
import com.techelevator.dao.WorkoutDAO;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin

public class WorkoutController {

    private WorkoutDAO workoutDAO;
    public WorkoutController(WorkoutDAO workoutDAO){

        this.workoutDAO= workoutDAO;
    }


    
}
