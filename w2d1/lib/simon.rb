class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []

  end

  def play
    until game_over == true
      take_turn

    end
    game_over_message
    reset_game

  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over == true
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
    puts "Repease the sequence by entering the first letter of the color"
    @seq.each do |color|
      user_color = gets.chomp
      if color[0] != user_color
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "You finished this round"
  end

  def game_over_message
    puts "You made #{sequence_length} turns"

  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
