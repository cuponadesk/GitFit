package com.techelevator.dao;


import com.techelevator.model.Exercise;
import com.techelevator.model.ExerciseTrainer;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Component
public class WorkoutSqlDAO implements WorkoutDAO {

    private JdbcTemplate jdbcTemplate;

    public WorkoutSqlDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<ExerciseTrainer> generateWorkout(int[] trainerIds, int[] bodyTargetIds, int totalTime) {
        List<ExerciseTrainer> allExerciseTrainers = new ArrayList<>();

        String SQL = "SELECT * FROM exercise " +
                "INNER JOIN trainers_exercises ON trainers_exercises.exercise_id = exercise.id " +
                "INNER JOIN trainer ON trainer.trainer_id = trainers_exercises.trainer_id ";

        SqlRowSet sqlRowSet = jdbcTemplate.queryForRowSet(SQL);

        while (sqlRowSet.next()) {
            allExerciseTrainers.add(mapRowToExercise(sqlRowSet));
        }

        //filter by trainer
        if(trainerIds.length > 0) {
            allExerciseTrainers = filterByTrainer(allExerciseTrainers, trainerIds);
        }

        //filter by body target
        if (bodyTargetIds.length > 0){
            allExerciseTrainers = filterByBodyTarget(allExerciseTrainers, bodyTargetIds);
        }
        Collections.shuffle(allExerciseTrainers);
        int timeCounter = 0;
        List<ExerciseTrainer> filteredExerciseTrainers = new ArrayList<>();

        //filter by time
        for (int i = 0; i < allExerciseTrainers.size(); i++){
            timeCounter += allExerciseTrainers.get(i).getTime();
            filteredExerciseTrainers.add(allExerciseTrainers.get(i));
            if (totalTime - timeCounter < 10 || totalTime - timeCounter > -10){
                return filteredExerciseTrainers;
            }
        }
        return filteredExerciseTrainers;
    }
    private List<ExerciseTrainer> filterByTrainer(List<ExerciseTrainer> allExerciseTrainers, int[] trainerIds){
        List<ExerciseTrainer> updatedExerciseTrainers = new ArrayList<>();
        for(int i = 0; i < allExerciseTrainers.size(); i++){
            for(int j=0; j< trainerIds.length; j++){
                if(trainerIds[j] == allExerciseTrainers.get(i).getTrainerId()){
                    updatedExerciseTrainers.add(allExerciseTrainers.get(i));
                }
            }
        }
        return allExerciseTrainers;

    }
    private List<ExerciseTrainer> filterByBodyTarget(List<ExerciseTrainer> allExerciseTrainers, int[] bodyTargetIds){
        List<ExerciseTrainer> updatedExerciseTrainers = new ArrayList<>();
        for(int i = 0; i < allExerciseTrainers.size(); i++){
            for(int j=0; j< bodyTargetIds.length; j++){
                if(bodyTargetIds[j] == allExerciseTrainers.get(i).getTrainerId()){
                    updatedExerciseTrainers.add(allExerciseTrainers.get(i));
                }
            }
        }
        return allExerciseTrainers;
    }


    public ExerciseTrainer mapRowToExercise(SqlRowSet rowSet) {
        ExerciseTrainer exercise = new ExerciseTrainer();
        exercise.setId(rowSet.getInt("id"));
        exercise.setName(rowSet.getString("exercise_name"));
        exercise.setSets(rowSet.getInt("exercise_sets"));
        exercise.setReps(rowSet.getInt("exercise_reps"));
        exercise.setTime(rowSet.getInt("expected_time"));
        exercise.setBodyTargetId(rowSet.getInt("body_target_id"));
        exercise.setSuggestedWeight(rowSet.getInt("suggested_weight"));
        exercise.setDescription(rowSet.getString("description"));
        exercise.setTrainerId(rowSet.getInt("trainer_id"));
        exercise.setTrainerName(rowSet.getString("trainer_name"));
        return exercise;


    }
}



