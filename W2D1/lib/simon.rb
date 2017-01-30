class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
      system("clear")
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 0.75
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    puts "Enter the first letter of the colors, one at a time!"

    @seq.each do |color|
      print "> "
      input = STDIN.gets.chomp
      if color[0] != input
        puts "Sorry, that wasn't it..."
        @game_over = true
        break
      end
    end
    sleep 0.25
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "\n"
    puts "You got it! Get ready for the next one."
  end

  def game_over_message
    puts "Game over! You made it #{@sequence_length - 1} rounds."
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
