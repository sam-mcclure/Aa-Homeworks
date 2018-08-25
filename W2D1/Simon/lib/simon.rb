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
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts "Sequence"
      puts "#{color}"
      sleep(1)
    end
  end

  def require_sequence
    #prompt user for input and check if equal to sequence?
    user_sequence = []


  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "You got it!"
  end

  def game_over_message
    puts "Sorry, you lose"
  end

  def reset_game

  end
end
