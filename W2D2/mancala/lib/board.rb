class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |el, i|
      next if i == 6 || i == 13
      4.times {|n| el << :stone}
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 14
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    pos = start_pos

    until stones.empty?
      pos += 1
      pos = 0 if pos >= 14

      if pos == 6
        @cups[pos] << stones.pop if current_player_name == @name1
      elsif pos == 13
        @cups[pos] << stones.pop if current_player_name == @name2
      else
        @cups[pos] << stones.pop
      end
    end
    render
    next_turn(pos)
  end

  def next_turn(ending_cup_idx)
    return :prompt if ending_cup_idx == 13 || ending_cup_idx == 6
    return :switch if @cups[ending_cup_idx].length == 1
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if cups[0..6].all?(&:empty?) || cups[7..12].all?(&:empty?)
    false
  end

  def winner
    return :draw if @cups[13].length == @cups[6].length
    if @cups[6].length > @cups[13].length
      @name1
    else
      @name2
    end
  end
end
