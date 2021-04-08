package com.techelevator.dao;

import com.techelevator.model.Exercise;

import java.util.List;

public interface WorkoutDAO {

    
    List<Exercise> filterByTotalTime();
    List<Exercise> filterByTrainer()
}
