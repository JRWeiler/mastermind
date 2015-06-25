class MastermindGame
  def initialize
    @colors = ['yellow','orange','purple','blue','green','white']
    @code = Array.new
    @guess = Array.new
    @human = HumanPlayer.new
    @computer = ComputerPlayer.new
    @current_player = HumanPlayer.new
    @guess_limit = 12
  end
  
  def play_game
    puts "Welcome to MASTERMIND!"
    gen_code
    puts "The code is " + @code.join(",")
    until @guess_limit <= 0 do
      @guess = choose_code
      check_guess
      @guess_limit -= 1
    end
  end
  
  def gen_code
    4.times do
      @code << @colors.sample
    end
  end
  
  def choose_code
    choice = Array.new
    4.times do |i|
      puts "Choose color for position " + i.to_s
      choice << gets.chomp
    end
    return choice
  end
  
  def check_guess
    @guess = @guess.map(&:downcase)
    if is_winner?
      congratulations
    else
      give_feedback
    end
  end
  
  def give_feedback
    good_colors = 0
    good_positions = 0
    unique_guesses = @guess.uniq
    
   
      
    
    
    puts "You guessed " + good_colors.to_s + " colors correctly but they are in the wrong spot."
    puts "You guessed " + good_positions.to_s + " colors in the correct position."
  end

  def check_occurences(colors, color)
    count = 0
    colors.each_with_index do |color, i|
      colors[i] == color ? count += 1 : count = count
    end
    return count
  end
  
  def is_winner?
    @guess == @code ? true : false
  end
  
  def congratulations
    puts "You win " + @current_player.name
    @guess_limit = 0
  end
end

class HumanPlayer
  attr_accessor :name
  def initialize
    @name = "Human"
  end
end

class ComputerPlayer
  attr_accessor :name
  def initialize
    @name = "Skynet"
  end
end

game_1 = MastermindGame.new
game_1.play_game