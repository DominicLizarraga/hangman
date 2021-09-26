class Hangman
  def initialize()
    @lives = 7
    @secret_word = word_list.sample
    @board = setup_board
  end

  def word_list
      [
      "turtle",
      "cat",
      "dog",
      "fast"
      ]
  end

  def setup_board
    ["_ "] * @secret_word.size
  end

  def start
    puts "Welcome to Hangman"
    while !lost? && !won?
      puts "\n\nYou have #{@lives} lives left."
      puts board_state
      guess = make_guess
      update_board(guess)
    end

    if won?
      puts "You won!"
      puts "The word was #{@secret_word}"
    else
      puts "You lost!"
      puts "The word was #{@secret_word}"

    end

  end

  def board_state
    @board.join(" ")
  end

  def lost?
    @lives <= 0
  end

  def make_guess
    print "Please guess a letter: "
    print "\n>"
    gets.chomp
  end

  def won?
    @board.join("") == @secret_word
  end

  def update_board(guess)
    if @secret_word.include?(guess)
      # i = 0
      # while i < @secret_word.size
      #   if guess == @secret_word[i]
      #     @board[i] = @secret_word[i]
      #   end
      #   i += 1
      @secret_word.chars.each_with_index do |char, index|
          if char == guess
            @board[index] = @secret_word[index]
          end
        end
    else
      @lives -= 1
      puts "the letter #{guess} was not there"
    end
  end
end

game = Hangman.new
game.start


