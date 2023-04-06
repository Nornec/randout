# Workout tool

minimum_difficulty = 0 #specify the minimum workout difficulty index for generation. Maximum recommended WDI is 69 (nice), but 70 has been achieved after a long wait. The example of a workout with intense difficulty can be found in the README.

WEIGHTS = {
  easy: 1,
	medium: 2,
	hard: 3,
	very_hard: 4
	}
	
WORKOUTS = {
cardio: 
[
	{name: "jumping jacks"          , weight: WEIGHTS[:medium]},
	{name: "high knees"             , weight: WEIGHTS[:hard]},
	{name: "kick backs"             , weight: WEIGHTS[:easy]},
	{name: "burpees"                , weight: WEIGHTS[:hard]},
	{name: "thrusters"              , weight: WEIGHTS[:very_hard]},
	{name: "quick feet"             , weight: WEIGHTS[:medium]},
	{name: "riser toe-taps"         , weight: WEIGHTS[:medium]},
	{name: "mountain climbers"      , weight: WEIGHTS[:hard]},
	{name: "skiiers"                , weight: WEIGHTS[:medium]},
	{name: "plank jacks"            , weight: WEIGHTS[:hard]},
	{name: "plank walks"            , weight: WEIGHTS[:medium]},
	{name: "jump squats"            , weight: WEIGHTS[:hard]},
	{name: "squat jacks"            , weight: WEIGHTS[:hard]},
	{name: "single-leg reach jumps" , weight: WEIGHTS[:hard]}, #split interval
	{name: "power lunges"           , weight: WEIGHTS[:hard]},
	{name: "plank hops"             , weight: WEIGHTS[:very_hard]},
	{name: "jumping lunges"         , weight: WEIGHTS[:hard]}
],                                             
strength: 
[
	{name: "push ups"                    , weight: WEIGHTS[:medium]},
	{name: "bar cleans"                  , weight: WEIGHTS[:medium]},
	{name: "deadlifts"                   , weight: WEIGHTS[:easy]},
	{name: "rows"                        , weight: WEIGHTS[:medium]},
	{name: "plank rows"                  , weight: WEIGHTS[:hard]},
	{name: "bicep curls"                 , weight: WEIGHTS[:easy]},
	{name: "tricep curls"                , weight: WEIGHTS[:medium]},
	{name: "shoulder press"              , weight: WEIGHTS[:easy]},
	{name: "dips"                        , weight: WEIGHTS[:easy]},
	{name: "weighted squats"             , weight: WEIGHTS[:medium]},
	{name: "medicine ball shake"         , weight: WEIGHTS[:medium]},
	{name: "plank ups"                   , weight: WEIGHTS[:medium]},
	{name: "calf raises"                 , weight: WEIGHTS[:easy]},
	{name: "shoulder shrugs"             , weight: WEIGHTS[:easy]},
	{name: "wrist curls"                 , weight: WEIGHTS[:medium]},
	{name: "bar shimmy"                  , weight: WEIGHTS[:medium]},
	{name: "shoulder taps"               , weight: WEIGHTS[:medium]},
	{name: "walk-out pushups"            , weight: WEIGHTS[:easy]},
	{name: "diamond push-ups"            , weight: WEIGHTS[:very_hard]},
	{name: "single-leg walk-out pushups" , weight: WEIGHTS[:medium]},
	{name: "side plank dips"             , weight: WEIGHTS[:easy]},
	{name: "kettle bell swings"          , weight: WEIGHTS[:medium]}
],
balance: 
[
  {name: "low plank"               ,weight: WEIGHTS[:medium]},
  {name: "crunches"                ,weight: WEIGHTS[:easy]},
  {name: "front lunges"            ,weight: WEIGHTS[:easy]},
  {name: "back lunges"             ,weight: WEIGHTS[:easy]},
  {name: "side lunges"             ,weight: WEIGHTS[:easy]},
  {name: "squats"                  ,weight: WEIGHTS[:easy]},
  {name: "high plank"              ,weight: WEIGHTS[:medium]},
  {name: "one-legged half squats"  ,weight: WEIGHTS[:easy]},
  {name: "russian twists"          ,weight: WEIGHTS[:very_hard]},
  {name: "supermans"               ,weight: WEIGHTS[:easy]},
  {name: "side planks"             ,weight: WEIGHTS[:easy]}, #dual interval
  {name: "Leg raises"              ,weight: WEIGHTS[:easy]}, #dual interval
  {name: "slow donkey kicks"       ,weight: WEIGHTS[:easy]}, #dual interval
  {name: "one leg balance"         ,weight: WEIGHTS[:easy]}, #dual interval
  {name: "hip bridges"             ,weight: WEIGHTS[:easy]},
  {name: "single leg glute bridge" ,weight: WEIGHTS[:easy]},
  {name: "opposite leg spidermen"  ,weight: WEIGHTS[:easy]},
  {name: "bicycle crunches"        ,weight: WEIGHTS[:easy]},
  {name: "plank T rotations"       ,weight: WEIGHTS[:easy]},
  {name: "down dogs"               ,weight: WEIGHTS[:easy]},
  {name: "v-ups"                   ,weight: WEIGHTS[:medium]},
  {name: "dead bugs"               ,weight: WEIGHTS[:easy]}
]
}

RESTS = ["Rest 30","Rest 60","Rest 90"]

def build_section(wnum,types)
  section = []
	until section.length == 10 do
	  type = types[rand(2)]
    section << type[rand(0..(type.length-1))]
		case wnum
		when 5
			section << RESTS[0]
		when 6
		  case section.length
		  when 2,9
			  section << RESTS[0]
			when 5
			  section << RESTS[1]
      end
		when 7
		  case section.length
			when 3,5,9
				section << RESTS[0]
			end
		end
	end
	return section
end

loop do
  @plan = [[],[],[],[]]
  @weights = []
	
	@plan[0] = build_section(5,[WORKOUTS[:strength],WORKOUTS[:balance]])
	@plan[1] = build_section(6,[WORKOUTS[:cardio]  ,WORKOUTS[:balance]])
	@plan[2] = build_section(5,[WORKOUTS[:strength],WORKOUTS[:balance]])
	@plan[3] = build_section(7,[WORKOUTS[:cardio]  ,WORKOUTS[:strength]])

	@plan.each do |p|
		weight = 0
		p.each {|w| weight += w[:weight] unless RESTS.find {|f| f == w}}
		@weights << weight
	end

	break if @weights.sum >= minimum_difficulty
end

puts "Workout plan"
puts "------------------"
puts "10 minute Warmup"
puts "------------------"
puts "BEGIN"
@plan.each_with_index do |p,i|
	p.each do |w|
		unless RESTS.find {|f| f == w}
			puts "  #{w[:name]}" 
		else
			puts "#{w}"
		end
	end
	puts "Workout Difficulty Index: #{@weights[i]}"
	puts "-------"
	puts "Rest 90"
end
puts "------------------"
puts "10 minute Stretch"
puts "------------------"
puts "Workout Summary"
puts "------------------"
puts "Section 1 WDI : #{@weights[0]}"
puts "Section 2 WDI : #{@weights[1]}"
puts "Section 3 WDI : #{@weights[2]}"
puts "Section 4 WDI : #{@weights[3]}"
puts "Total WDI     : #{@weights.sum}"
