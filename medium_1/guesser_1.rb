require 'pry'

class GuessingGame
  def initialize(min, max)
    @max = max
    @min = min
    @size_of_range = max - min + 1
    @guesses_left = number_of_guesses
    @player_guess = nil
  end

  def play
    reset
    loop do
      remaining_guesses_message
      self.player_guess = retrieve_guess

      compare_and_display_results
      if winner
        you_won_message
        break
      end

      reduce_remaining_guesses
      if no_more_guesses?
        no_more_guesses_message
        you_lost_message
        break
      end
    end
  end

  private

  attr_accessor :guesses_left, :player_guess, :winner
  attr_reader :number, :max, :min, :size_of_range

  def reset
    @number = set_number
    @winner = false
  end

  def set_number
    rand(min..max)
  end

  def number_of_guesses
    Math.log2(size_of_range).to_i + 1
  end

  def retrieve_guess
    loop do
      enter_a_number_message
      answer = gets.chomp.to_i

      return answer if answer <= max && answer >= min
      invalid_guess_message
    end
  end

  def compare_and_display_results
    case compare_guess_to_number
    when -1 then too_low_message
    when 0  then update_and_display_winner
    when 1  then too_high_message
    end
  end

  def compare_guess_to_number
    player_guess <=> number
  end
  
  def remaining_guesses_message
    if guesses_left == 1
      puts "You have #{guesses_left} guess remaining."
    else
      puts "You have #{guesses_left} guesses remaining."
    end
  end

  def update_and_display_winner
    self.winner = true
    got_it_message
  end

  def reduce_remaining_guesses
    self.guesses_left -= 1
  end

  def no_more_guesses?
    guesses_left == 0
  end

  def enter_a_number_message
    puts "Enter a number between #{min} and #{max}:"
  end

  def invalid_guess_message
    puts "Invalid guess."
  end

  def no_more_guesses_message
    puts "You have no more guesses."
  end

  def too_high_message
    puts "Your guess is too high."
  end

  def too_low_message
    puts "Your guess is too low."
  end

  def got_it_message
    puts "That's the number!"
  end

  def you_won_message
    puts "You won!"
  end

  def you_lost_message
    puts "You lost!"
  end
end

game = GuessingGame.new(501, 1500)
game.play
game = GuessingGame.new(1, 100)
game.play