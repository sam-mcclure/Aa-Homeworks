class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length, @game_over, @seq = 1, false, []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    sleep(2)
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      round_success_message
      @sequence_length += 1
      sleep(2)
    end
  end

  def show_sequence
    add_random_color
    @seq.each_with_index do |color, idx|
      system ("clear")
      puts "Sequence #{idx + 1}"
      puts "#{color}"
      sleep(2)
    end
  end

  def require_sequence
    #prompt user for input and check if equal to sequence?
    user_sequence = []
    @sequence_length.times do |idx|
      system ("clear")
      puts "Please input a color"
      user_sequence << gets.chomp

      if user_sequence[idx] != @seq[idx]
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "You got it!"
  end

  def game_over_message
    puts "Sorry, you lose. Your score was #{@sequence_length - 1}"
  end

  def reset_game
    initialize
  end
end

if __FILE__ == $PROGRAM_NAME
  Simon.new.play
end
