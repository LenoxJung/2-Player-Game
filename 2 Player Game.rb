require 'colorize'
@life_1 = 3
@life_2 = 3
puts "Enter name for player 1"
student_1_name = gets.chomp
puts "Enter name for player 2"
student_2_name = gets.chomp
@player_count = 0
@num_1 = 0
@num_2 = 0
@operation = 0
@answer = "yes" 

def generate_question
  @operation = rand(3)
  @num_1 = rand(20) + 1
  @num_2 = rand(20) + 1
  if @operation == 0
    "What does #{@num_1} plus #{@num_2} equal?"
  elsif @operation == 1
    "What does #{@num_1} times #{@num_2} equal?"
  else
    "What does #{@num_1} minus #{@num_2} equal?"
  end
end

def prompt_player_for_answer
  gets.chomp.to_i
end

def verify_answer
  if @operation == 0
    @num_1 + @num_2 == prompt_player_for_answer
  elsif @operation == 1
    @num_1 * @num_2 == prompt_player_for_answer
  else
    @num_1 - @num_2 == prompt_player_for_answer
  end
end

while @answer != "no"
  while (@life_1>0&&@life_2>0)
    puts generate_question
    if !verify_answer
  		if @player_count%2 == 0
  			@life_1 -=1
  			puts "#{student_1_name} has #{@life_1} lives left, and #{student_2_name} has #{@life_2} lives left.".red
  		else
  			@life_2 -=1
  			puts "#{student_1_name} has #{@life_1} lives left, and #{student_2_name} has #{@life_2} lives left.".red
  		end
  	end
  	@player_count += 1
  end
  if @life_2 == 0
    puts "#{student_1_name} wins, #{student_2_name} losses due to score hitting 0".green
  else 
    puts "#{student_2_name} wins, #{student_1_name} losses due to score hitting 0".green  
  end
  @life_1 = 3
  @life_2 = 3
  puts "Would you like to play again?"
  @answer = gets.chomp
  @player_count = 0
end