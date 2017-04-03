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
    game_over
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      round_success_message
      sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep .5
      system("clear")
      sleep .5
    end
  end

  def require_sequence
    puts "Repeat the sequence! (enter the first letter of each color one by one)"
    @seq.each do |color|
      user_color = gets.chomp
      if color[0] != user_color
        @game_over = true
        break
      end
    end
    sleep 0.25
  end

  def add_random_color
    @seq << COLORS.sample(1)
  end

  def round_success_message
    "Nice, you cleared the round! Ready for round #{@sequence_length-1}?"
  end

  def game_over_message
    "Game over! You reached the #{@sequence_length - 1} round!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
