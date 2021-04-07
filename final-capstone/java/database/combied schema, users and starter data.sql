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
                description varchar(2000) NOT NULL,
                suggested_weight int,
                exercise_reps int,
                exercise_sets int,
                expected_time int NOT NULL,
                body_target_id int NOT NULL,
                constraint fk_body_target FOREIGN KEY (body_target_id) references body_target(body_target_id) );
                

                
INSERT INTO body_target(body_target)
VALUES('legs'), ('back'), ('chest'), ('arms'), ('cardio'), ('full body'), ('abs');
                        
INSERT INTO Exercise(exercise_name, description, suggested_weight, exercise_reps, exercise_sets, expected_time, body_target_id)
VALUES('chest press', 'Lie face up on a flat bench, and grip a barbell with the hands slightly wider than shoulder-width. Press the feet into the ground and the hips into the bench while lifting the bar off the rack. Slowly lower the bar to the chest by allowing the elbows to bend out to the side. Stop when the elbows are just below the bench, and press feet into the floor to press the weight straight up to return to the starting position.',
45, 10, 3, 10, 3);  

INSERT INTO exercise(exercise_name, suggested_weight, exercise_reps, exercise_sets, expected_time, body_target_id, description)
VALUES ('Chest Press', 45, 10, 3, 10, 3 ,'Lie face up on a flat bench, and grip a barbell with the hands slightly wider than shoulder-width. Press the feet into the ground and the hips into the bench while lifting the bar off the rack. Slowly lower the bar to the chest by allowing the elbows to bend out to the side. Stop when the elbows are just below the bench, and press feet into the floor to press the weight straight up to return to the starting position.'),
        ( 'Bottom-up Press', 25, 10, 3, 10, 3, 'Stand with the feet hip-width apart so that the right foot is slightly in front of the left and hold a kettlebell in the right hand in a �bottom-up� position by holding the top of the handle so that the bottom of the kettlebell is facing up. Keep a strong grip to maintain balance of the kettlebell. Push the right foot into the ground to shift the weight of the body forward while pressing the right arm straight overhead. Pull the right elbow back down to the rib cage to lower the weight.'),
        ('Close-grip Bench Press', 25, 10, 3, 10, 3, 'Lie face up on a barbell bench, then reach up and grip the bar with the hands directly in line with the shoulders and the elbows pointed towards the feet. Unrack the bar and bring it towards the chest by bending the elbows and keeping them close to the ribs. Push the feet into the floor, and press the hips into the bench as the bar is pushed away from the chest to return to the starting position.'),
        ('Plank-ups', 0, 10, 3, 10, 3, 'Start in a push-up position with the hands under the shoulders and the legs stretched out directly behind. Squeeze the thigh and glute muscles to keep body and legs in a straight line, and lower down to the elbows one elbow at a time. From this position on the elbows, press the hands into the floor one at a time to return to the push-up position.'),
        ('Push-up with Staggered Hands', 0, 10, 3, 10, 3, 'Start in a push-up position with the hands wider than shoulder-width apart and the legs straight out directly behind the body about hip-width apart. Squeeze the thighs and glutes while moving the right hand forward a couple of inches and the left hand out a couple of inches to the left side. This will create an uneven hand position. Slowly lower the body toward the ground then back up to return to the starting position.'),
         ('Squat Jump', 0, 3, 8, 8, 1, 'With your feet hip-width apart, squat until your thighs are parallel to the floor, and then jump as high as you can. Allow your knees to bend 45 degrees when you land, pause in deep squat position for one full second, and then jump again.'),
 
 ('Walking Single-leg Straight-leg Deadlift Reach', 0, 3, 8, 10, 1, 'Stand with your feet hip-width apart and your arms hanging to the side of your thighs. Lift your right leg behind you. Keeping your lower back naturally arched, bend forward at your hips and lower your torso until it�s nearly parallel to the floor while you reach your opposite hand to the floor. Return to the starting position, take two steps forward, then repeat the movement with the opposite leg.'),
 ('Side Lunge', 0, 3, 12, 8, 1, 'Stand with your feet hip-width apart and your arms hanging to the side of your thighs. Lift your right leg behind you. Keeping your lower back naturally arched, bend forward at your hips and lower your torso until it�s nearly parallel to the floor while you reach your opposite hand to the floor. Return to the starting position, take two steps forward, then repeat the movement with the opposite leg.'),
 ('Single-Leg Hip Raise', 5, 3, 12, 5, 1, 'Stand with your feet hip-width apart and your arms hanging to the side of your thighs. Lift your right leg behind you. Keeping your lower back naturally arched, bend forward at your hips and lower your torso until it�s nearly parallel to the floor while you reach your opposite hand to the floor. Return to the starting position, take two steps forward, then repeat the movement with the opposite leg.'),
 ('Alternating Drop Lunge', 0, 3, 10, 5, 1, 'Stand with your feet hip-width apart, hands on hips. Keep your chest and eyes up, shoulders squared. Cross your right leg behind your left, and bend both knees, lowering your body until your left thigh is nearly parallel to the floor. Return to start and repeat, switching sides.'),
 ('Box Squat Jumps', 0, 1, 10, 10, 1, 'Perform 10 box squat jumps every minute on the minute for 10 minutes. That means that you should set a time for 10 minutes, then do 1o reps every time a new minute starts. Rest during the remainder time for each period.'),
 ('Deadlift', 60, 5, 8, 10, 1, 'Stand tall with the barbell in front of you, then squat down and grasp it with an overhand grip. Keeping your chest up and core braced, press down through your heels to stand up. Push your hips forwards at the top, then lower.'),
 ('Leg Press', 45, 5, 8, 10, 1, 'Sit in the machine positioned correctly according to the instructions. Place your feet lower and closer together to work your quads more, or higher and wider to hit your hamstrings and glutes more directly. Bend your knees to bring them towards your chest, then press back to the start.'),
 ('Dumbell Lunge', 30, 3, 8, 5, 1, ' Stand tall, holding a dumbbell in each hand. With your chest up and core braced, take a big step forwards with your left leg and lunge down until both knees are bent at 90�. Push off your front foot to return to the start, then repeat with your right leg. Alternate your leading leg with each rep.'),
 ('Front Squat', 60, 3, 10, 8, 1, 'Set a barbell on a power rack at about shoulder height. Grab the power with an overhand grip at shoulder width and raise your elbows until your upper arms are parallel to the floor. Take the bar out of the rack and let it rest on your fingertips. Your elbows should be all the way up throughout the movement. Step back and set your feet at shoulder width with toes turned out slightly. Squat as low as you can without losing the arch in your lower back.'),
 ('Walking Lunge', 20, 3, 12, 10, 1, 'Stand with your feet hip width, holding a dumbbell in each hand. Step forward with one leg and lower your body until your rear knee nearly touches the floor and your front thigh is parallel to the floor. Step forward with your rear leg to perform the next rep.'),
 ('Reverse Lunge', 30, 3, 10, 5, 1, 'Stand with the dumbbells still in your hands and step back with your right foot. Lower your body until your front thigh is parallel to the floor and your rear knee nearly touches the floor. Keep your torso upright. Step forward to return to the starting position. Complete all reps on one leg, then switch legs. That�s one set.'),
 ('Kettle Bell Swing', 30, 3, 8, 5, 1, 'Stand with feet hip-width apart and the kettlebell on the floor. Grasp the weight with both hands (palms facing you) and, keeping your lower back flat, extend your hips to raise it off the floor. From there, take a deep breath and bend your hips back, allowing the weight to swing back between your legs. Explosively extend your hips and exhale�allowing the momentum to swing the weight up to shoulder level. Control the descent, but use the momentum to begin the next rep.'),
 ('Jump Squat', 0, 4, 8, 8, 1, 'Stand with feet shoulder-width apart and squat down until your thighs are about parallel to the floor but no deeper. Jump as high as you can. Land with soft knees and begin the next rep.'),
 ('Kneeling Hip Flexor Stretch', 0, 3, 15, 5, 1, 'Kneel down in a lunge position with your right leg in front, and rest your back knee on a towel or mat, if available. Extend your left hand above your head and let your right hand hang at your side. Contract your left glute and push your hips forward until you feel a stretch in the front of your hip. Hold for 30 seconds.');
 
  
INSERT INTO exercise(exercise_name, suggested_weight, exercise_reps, exercise_sets, expected_time, body_target_id, description)
VALUES ('Hammer Curl', 25, 12, 3, 10, 4 ,'Stand holding a pair of dumbbells at arms length by your sides with your palms facing each other. Keeping your elbows tucked, your upper arms locked in place (only your hands and forearms should move), and your palms facing inward, curl the dumbbells as close to your shoulders as you can.Pause, and then slowly lower the weights back to the starting position.'),
        ( 'Dumbbell Skull Crushers', 25, 10, 3, 10, 4, 'Lie down on a bench or the floor holding a pair of dumbbells directly above your chest with your palms facing each other. Your feet should be flat on the floor. Without moving your upper arms, bend your elbows and slowly lower the weights toward the sides of your head. Avoid flaring your elbows. Reverse the move to return to the starting position.'),
        ('Dumbbell Bicep Curl', 30, 12, 3, 10, 4, 'Begin standing tall with your feet about hip-width apart. Keep your abdominal muscles engaged. Hold one dumbbell in each hand. Let your arms relax down at the sides of your body with palms facing forward. Keeping your upper arms stable and shoulders relaxed, bend at the elbow and lift the weights so that the dumbbells approach your shoulders. Your elbows should stay tucked in close to your ribs. Exhale while lifting. Lower the weights to the starting position.'),
        ('Tricep Pushdown', 80, 12, 4, 10, 4, 'Set the cable machine up with the bar at head height. Grab the bar and stand upright with your back straight and your elbows tucked in to your sides. Stand with your feet hip-width apart. Pull the cable down until the bar touches your thighs and pause to squeeze your triceps at the bottom of the move. Then slowly raise the bar back to the starting position. Make sure you don�t lean forwards to aid the press and don�t let your elbows leave your sides, otherwise you�ll lose some of the focus on the triceps.'),
        ('Reverse Dumbbell Bicep Curl', 15, 10, 3, 10, 4, 'Stand holding a dumbbell in each hand using an overhand grip. Your arms should be fully extended and your feet shoulder width apart. Keeping your upper arms stationary and your back straight, curl the weights up towards your shoulders. Continue curling the dumbbells up until they are at shoulder level and your biceps are fully contracted. Hold for a count of one as you squeeze your biceps. Return to the starting position in a smooth arc.');

INSERT INTO exercise(exercise_name, suggested_weight, exercise_reps, exercise_sets, expected_time, body_target_id, description)
        VALUES('Bent-over Row', 45, 10, 3, 12, 3, 'Grip a barbell with palms down so that the wrists, elbows, and shoulders are in a straight line. Lift the bar from the rack, bend forward at the hips, and keep the back straight with a slight bend in the knees. Lower the bar towards the floor until the elbows are completely straight, and keep the back flat as the bar is pulled towards the belly button. Then slowly lower the bar to the starting position and repeat'),
        ('Standing Shrugs', 135, 10, 3, 12, 3, 'Hold a barbell with a palms-down grip with the hands about shoulder-width apart. Keep the knees slightly bent, the hips straight, and the back tall, and raise the shoulders directly upwards to the ears as high as possible, lowering slowly to the original starting position. (Tip: grip the bar and think about pulling the hands apart from one another and focus on only raising/lowering the shoulders - DO NOT roll the shoulders.)'),
        ('Incline Reverse Flys', 40, 10, 3, 12, 3, 'Holding two dumbbells, sit on a bench facing the backrest angled at 45 to 60 degrees. Hold your torso against the backrest and keep your feet firmly placed on the floor. Allow your arms to hang towards the floor with your elbows slightly flexed and palms facing each other. Stiffen your core and abdominal muscles (�bracing�) to stabilize your spine.
           Upward Phase: Exhale and slowly raise the dumbbells up and out to the sides, raising the upper arms, elbows and dumbbells in unison until the arms are near level with the shoulders. Squeeze your scapulae (shoulder blades) together as you reach the end position. In the raised position, the dumbbells should be aligned with, or slightly in front of your ears. Avoid arching your back during the upward phase by keeping your torso firmly pressed into the backrest.
                '),
         ('Single Arm Row', 40, 10, 3, 12, 3, 'Holding a dumbbell in your right hand, bend over to place your left knee and left hand on a bench to support your body weight. Your hand should be placed directly under your shoulder and your knees should be positioned directly under your hips. Gently contract your abdominal / core muscles ("bracing") to stiffen your torso and stabilize your spine. Your back should be flat and head aligned with your spine. Depress and retract your scapulae (pull your shoulders down and back) without arching your low back and maintain this shoulder position throughout the exercise. Extend your right arm (holding the dumbbell) towards the floor without allowing your torso to rotate or shoulder to move towards the floor.
            Upward Movement: Exhale and slowly pull the dumbbell upwards, bending your elbow and pulling your upper arm backwards. Keep your arm close to the side of your body and continue pulling the dumbbell upwards until you are unable to lift any further without rotating your torso. Avoid rotating your body or changing the position of your spine throughout the lift.
                '),
         ('Deadlift (Barbell)', 135, 10, 3, 12, 3, 'Holding a barbell with both hands so that it rests on the front of the thighs, keep a slight bend in both knees and a straight back. Push the hips back while lowering the weight towards the floor until feeling some tension along the back of the legs. To return to standing, push the heels into the floor and pull the knees backwards, keeping the bar very close to the body while standing.
                ');
                
                INSERT INTO Exercise(exercise_name, suggested_weight, exercise_reps, exercise_sets, expected_time, body_target_id, description)
VALUES('Arms High Partial Sit Up', 0, 12, 3, 5, 7, 'Lie on your back, knees bent at 90 degrees, and raise your arms straight overhead, keeping them pointing up throughout the exercise. Sit up halfway, then steadily return to the floor. That�s one rep.'),
       ('Forearm Plank', 0, 1, 3, 5, 7, 'Place your forearms on the floor, elbows directly underneath your shoulders, hands facing forward so that your arms are parallel. Extend your legs behind you, feet hip-width apart. Tuck your tailbone and engage your core, butt, and quads. Hold here for a set amount of time.'),
       ('Side Plank', 0, 1, 3, 6, 7, 'Lie on your right side with your right hand directly underneath your right shoulder. Extend your legs and stack your left foot on top of your right, and squeeze your abs and glutes to lift your hips off the floor. Extend your left hand straight up towards the ceiling and hold for a set amount of time. This is one rep. Be sure to alternate between left and right sides.'),
       ('Leg Lift', 0, 12, 3, 6, 7, 'Lie faceup with your legs extended and your arms on the floor by your sides. If your lower back needs some extra support, you can place your hands right underneath your butt on each side. This is the starting position. Slowly lift your legs up and toward your face, keeping them together and stopping when they are about vertical. Then, slowly lower them back down to the ground. Be sure to keep your back flat on the floor. If you are having trouble with that or feel tension in your lower back, do not lower your legs as far down.');
 
INSERT INTO Exercise(exercise_name, suggested_weight, exercise_reps, exercise_sets, expected_time, body_target_id, description)
VALUES ('Jumping Jacks', 0, 50, 2, 3, 5, 'Begin with the feet hip-width apart and arms down. Raise the arms out to the sides, straight in the air while jumping with the feet apart. Jump back to the starting position and land softly on the balls of your feet, bringing arms back into body. Increase intensity as needed by jumping higher or performing faster.'),
        ('Squat Jumps', 0, 20, 3, 6, 5, 'Stand with feet hip-width apart and arms at sides. Bend at the knees to squat. Jump in the air and extend hips until body is straight. Land softly on balls of the feet, rolling backwards to absorb shock in the heels. Repeat using different arm movements to adjust difficulty.'),
        ('Jump Rope', 0, 100, 2, 4, 5, 'Jump through the rope, increasing speed or alternating between jumping on two feet and one foot.'),
        ('Mountain Climbers', 0, 25, 3, 4, 5, 'Start in pushup position with the right leg extended backward and the left leg near the chest with toes on the ground. Keep the hands on the ground and hips level, quickly sqitch position of legs. Continue to alternate legs, increasing speed to increase difficulty.');

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

