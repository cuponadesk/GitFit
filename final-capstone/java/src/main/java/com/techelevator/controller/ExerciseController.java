package com.techelevator.controller;


import com.techelevator.dao.ExerciseDAO;
import com.techelevator.dao.ExerciseSqlDAO;
import com.techelevator.model.Exercise;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin
//@PreAuthorize("isAuthenticated()")
public class ExerciseController {


    private ExerciseDAO exerciseDAO;
    public ExerciseController(ExerciseDAO exerciseDAO){
        this.exerciseDAO= exerciseDAO;
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/addExercise", method = RequestMethod.POST)
    public boolean addExercise(@RequestBody Exercise exercise){
       return exerciseDAO.addExercise(exercise);
    }
}
