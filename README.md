# randout
Random Workout Generator written in Ruby

Run it to get a random 4 section workout with an arbitrary Workout Difficulty Index (WDI) based on the workouts that it chooses at random. All of these workouts can be done with simple household items or just your bodyweight.

Install Ruby and run the code as-is. You can modify the minimum_difficulty parameter to generate a harder or easier workout. The default is 0.
Sample output:
<pre>
Workout plan
------------------
10 minute Warmup
------------------
BEGIN
  russian twists
Rest 30
  shoulder taps
Rest 30
  plank rows
Rest 30
  diamond push-ups
Rest 30
  side plank dips
Rest 30
Workout Difficulty Index: 14
-------
Rest 90
  plank hops
  squats
Rest 30
  jumping lunges
  thrusters
Rest 60
  thrusters
  v-ups
  single-leg reach jumps
Rest 30
Workout Difficulty Index: 21
-------
Rest 90
  hip bridges
Rest 30
  diamond push-ups
Rest 30
  wrist curls
Rest 30
  rows
Rest 30
  kettle bell swings
Rest 30
Workout Difficulty Index: 11
-------
Rest 90
  plank jacks
  single-leg reach jumps
  burpees
Rest 30
  high knees
Rest 30
  plank hops
  diamond push-ups
  plank hops
Rest 30
Workout Difficulty Index: 24
-------
Rest 90
------------------
10 minute Stretch
------------------
Workout Summary
------------------
Section 1 WDI : 14
Section 2 WDI : 21
Section 3 WDI : 11
Section 4 WDI : 24
Total WDI     : 70
</pre>
