package com.techelevator.dao;


import com.techelevator.model.Exercise;
import com.techelevator.model.ExerciseTrainer;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.time.LocalDate;
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
    public boolean saveCompletedWorkout(List<ExerciseTrainer> exerciseTrainers, Principal principal) {

        int workoutUpdated= 0;
        int newWorkoutId = getNewWorkoutId();
        for (ExerciseTrainer exerciseTrainer : exerciseTrainers) {
            String sql = "INSERT INTO workout(workout_id, exercise_id, trainer_id, sets_completed, reps_completed, time_completed, total_time, username, date_saved) "
                        +"VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
             workoutUpdated = jdbcTemplate.update(sql, newWorkoutId, exerciseTrainer.getId(), exerciseTrainer.getTrainerId(), exerciseTrainer.getSets(), exerciseTrainer.getReps(),
                    exerciseTrainer.getTime(), getTotalTime(exerciseTrainers), principal.getName(), LocalDate.now());
        }
        return (workoutUpdated== 1);
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
            if (totalTime - timeCounter < 10 || totalTime - timeCounter < -10){
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
        return updatedExerciseTrainers;

    }
    private List<ExerciseTrainer> filterByBodyTarget(List<ExerciseTrainer> allExerciseTrainers, int[] bodyTargetIds){
        List<ExerciseTrainer> updatedExerciseTrainers = new ArrayList<>();
        for(int i = 0; i < allExerciseTrainers.size(); i++){
            for(int j=0; j< bodyTargetIds.length; j++){
                if(bodyTargetIds[j] == allExerciseTrainers.get(i).getBodyTargetId()){
                    updatedExerciseTrainers.add(allExerciseTrainers.get(i));
                }
            }
        }
        return updatedExerciseTrainers;
    }
    private int getNewWorkoutId(){
        String sql = "SELECT workout_id FROM workout ORDER BY workout_id DESC LIMIT 1 "; //max workout id
        SqlRowSet sqlRowSet = jdbcTemplate.queryForRowSet(sql);
        int newWorkoutId = 1;
        if(sqlRowSet.next()){
            newWorkoutId+= sqlRowSet.getInt("workout_id");
        }
        return newWorkoutId;
    }
    private int getTotalTime(List<ExerciseTrainer> exerciseTrainers){
        int sum = 0;
        for(ExerciseTrainer exerciseTrainer: exerciseTrainers){
            sum += exerciseTrainer.getTime();
        }
        return sum;

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



