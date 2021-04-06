BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');


drop table Exercise;
drop table body_target;

                
create table body_target ( 
                body_target_id serial PRIMARY KEY unique,
                body_target varchar(64) NOT NULL);


CREATE table Exercise ( 
                id serial PRIMARY KEY unique,
                exercise_name varchar(64) NOT NULL,
                description varchar(1000) NOT NULL,
                suggested_weight int,
                exercise_reps int,
                exercise_sets int,
                expected_time int NOT NULL,
                body_target_id int NOT NULL,
                constraint fk_body_target FOREIGN KEY (body_target_id) references body_target(body_target_id) );
                

                
INSERT INTO body_target(body_target)
VALUES('legs'), ('back'), ('chest'), ('arms'), ('cardio'), ('full body');
                        
INSERT INTO Exercise(exercise_name, description, suggested_weight, exercise_reps, exercise_sets, expected_time, body_target_id)
VALUES('chest press', 'Lie face up on a flat bench, and grip a barbell with the hands slightly wider than shoulder-width. Press the feet into the ground and the hips into the bench while lifting the bar off the rack. Slowly lower the bar to the chest by allowing the elbows to bend out to the side. Stop when the elbows are just below the bench, and press feet into the floor to press the weight straight up to return to the starting position.',
45, 10, 3, 10, 3);  

INSERT INTO exercise(exercise_name, suggested_weight, exercise_reps, exercise_sets, expected_time, body_target_id, description)
VALUES ('Chest Press', 45, 10, 3, 10, 3 ,'Lie face up on a flat bench, and grip a barbell with the hands slightly wider than shoulder-width. Press the feet into the ground and the hips into the bench while lifting the bar off the rack. Slowly lower the bar to the chest by allowing the elbows to bend out to the side. Stop when the elbows are just below the bench, and press feet into the floor to press the weight straight up to return to the starting position.'),
        ( 'Bottom-up Press', 25, 10, 3, 10, 3, 'Stand with the feet hip-width apart so that the right foot is slightly in front of the left and hold a kettlebell in the right hand in a ‘bottom-up’ position by holding the top of the handle so that the bottom of the kettlebell is facing up. Keep a strong grip to maintain balance of the kettlebell. Push the right foot into the ground to shift the weight of the body forward while pressing the right arm straight overhead. Pull the right elbow back down to the rib cage to lower the weight.'),
        ('Close-grip Bench Press', 25, 10, 3, 10, 3, 'Lie face up on a barbell bench, then reach up and grip the bar with the hands directly in line with the shoulders and the elbows pointed towards the feet. Unrack the bar and bring it towards the chest by bending the elbows and keeping them close to the ribs. Push the feet into the floor, and press the hips into the bench as the bar is pushed away from the chest to return to the starting position.'),
        ('Plank-ups', 0, 10, 3, 10, 3, 'Start in a push-up position with the hands under the shoulders and the legs stretched out directly behind. Squeeze the thigh and glute muscles to keep body and legs in a straight line, and lower down to the elbows one elbow at a time. From this position on the elbows, press the hands into the floor one at a time to return to the push-up position.'),
        ('Push-up with Staggered Hands', 0, 10, 3, 10, 3, 'Start in a push-up position with the hands wider than shoulder-width apart and the legs straight out directly behind the body about hip-width apart. Squeeze the thighs and glutes while moving the right hand forward a couple of inches and the left hand out a couple of inches to the left side. This will create an uneven hand position. Slowly lower the body toward the ground then back up to return to the starting position.');


COMMIT;

CREATE USER final_capstone_owner
WITH PASSWORD 'finalcapstone';

GRANT ALL
ON ALL TABLES IN SCHEMA public
TO final_capstone_owner;

GRANT ALL
ON ALL SEQUENCES IN SCHEMA public
TO final_capstone_owner;

CREATE USER final_capstone_appuser
WITH PASSWORD 'finalcapstone';

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO final_capstone_appuser;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO final_capstone_appuser;

