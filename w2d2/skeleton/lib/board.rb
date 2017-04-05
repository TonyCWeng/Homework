class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      #could also use unless idx == 6 || idx == 13
      next if idx == 6 || idx == 13
      4.times do
        cup << :stone
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(0,12)
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    #take out the stones from the cup, set cup to empty
    @cups[start_pos] = []

    cur_idx = start_pos
    until stones.empty?
      cur_idx += 1
      cur_idx = 0 if cur_idx > 13
      if cur_idx == 6 #&& current_player_name == @name1
        @cups[6] << stones.pop if current_player_name == @name1
      elsif cur_idx == 13 #&& current_player_name == @name2
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[cur_idx] << stones.pop
      end
    end

    render
    next_turn(cur_idx)
  end


  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? { |cup| cup.empty? } || @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    player1_score = @cups[6].count
    player2_score = @cups[13].count
    if player1_score == player2_score
      :draw
    elsif player1_score > player2_score
      @name1
    else
      @name2
    end
  end
end
