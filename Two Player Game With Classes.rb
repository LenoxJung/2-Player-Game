require 'colorize'
class Player
  attr_accessor :name, :life, :points

  def initialize(name, life, points)
    @name = name
    @life = life
    @points = points
  end

  def lose_a_life
    @life -= 1
  end
  
  def gain_a_point
    @points += 1
  end
end

puts "Enter name for player 1"
player_1_name = gets.chomp
puts "Enter name for player 2"
player_2_name = gets.chomp
player_1 = Player.new(player_1_name,3,0)
player_2 = Player.new(player_2_name,3,0)
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
  while (player_1.life>0&&player_2.life>0)
    puts generate_question
    if !verify_answer
      if @player_count%2 == 0
        player_1.lose_a_life
        puts "#{player_1.name} has #{player_1.life} lives left, and #{player_2.name} has #{player_2.life} lives left.".red
      else
        player_2.lose_a_life
        puts "#{player_1.name} has #{player_1.life} lives left, and #{player_2.name} has #{player_2.life} lives left.".red
      end
    else 
      if @player_count%2 == 0
        player_1.gain_a_point
        puts "#{player_1.name}'s score is #{player_1.points}".green
      else 
        player_2.gain_a_point
        puts "#{player_2.name}'s score is #{player_2.points}".green
      end
    end
    @player_count += 1
  end
  if player_2.life == 0
    puts "#{player_1.name} wins with a score of #{player_1.points}, #{player_2.name} losses due to life hitting 0 with a score of #{player_2.points}".green
  else 
    puts "#{player_2.name} wins with a score of #{player_2.points}, #{player_1.name} losses due to life hitting 0 with a score of #{player_1.points}".green
  end
  player_1.life = 3
  player_2.life = 3
  puts "Would you like to play again?"
  @answer = gets.chomp
  @player_count = 0
end