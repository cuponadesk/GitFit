package com.techelevator.dao;

import com.techelevator.model.Exercise;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;


@Component
public class ExerciseSqlDAO implements ExerciseDAO{

private JdbcTemplate jdbcTemplate;

public ExerciseSqlDAO(JdbcTemplate jdbcTemplate){
    this.jdbcTemplate= jdbcTemplate;
}
    @Override
    public boolean addExercise(Exercise exercise) {
        int exerciseCreated = 0;
        String insertExercise= "INSERT INTO Exercise(exercise_name, description, suggested_weight, exercise_reps, exercise_sets, expected_time, body_target_id) "
                + "VALUES(?, ?, ?, ?, ?, ?, ?) ";
        exerciseCreated= jdbcTemplate.update(insertExercise, exercise.getName(), exercise.getDescription(), exercise.getSuggestedWeight(),
                exercise.getReps(), exercise.getSets(), exercise.getTime(), exercise.getBodyTargetId());


        return exerciseCreated != 0;
    }
}
