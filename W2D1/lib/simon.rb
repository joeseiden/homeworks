class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    sleep(5)
    require_sequence
    unless game_over
      round_success_message
      @sequence_length += 1
      if @sequence_length == 9
        @game_over = true
        puts "You win!"
      end
    end
  end

  def show_sequence
    add_random_color
    puts seq
  end

  def require_sequence
    system("clear")
    puts "Enter the colors, one at a time!"
    player_guess = []
    until player_guess.length == sequence_length
      print ">"
      input = STDIN.gets.chomp
      player_guess << input
    end

    unless player_guess == seq
      puts "Sorry, that wasn't it..."
      @game_over = true
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "\n"
    puts "You got it!"
    puts "\n"
  end

  def game_over_message
    puts "Game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
