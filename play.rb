class Hangman
  def initialize
    @word = words.sample
    @lives = 7
    @word_teaser = ""
    @word.first.size.times do
      @word_teaser += "_ "
    end
  end

  def words
    [
      ["cricket", "A game played by gentlemen"],
      ["jogging", "We are not walking..."],
      ["celebrate", "Remembering special moments"],
      ["continent", "There are 7 of these"],
      ["exotic", "Not from around here..."]

    ]
  end

  def print_teaser last_guess
    update_teaser(last_guess) unless last_guess.nil?
    puts @word_teaser
  end

  def update_teaser last_guess
    new_teaser = @word_teaser.split
    new_teaser.each_with_index do |letter, index|
      # replace blank values with letter if matches letter in word
      if letter == "_" && @word.first[index] == last_guess
        new_teaser[index] = last_guess
      end
    end
    @word_teaser = new_teaser.join(" ")
  end

  def make_guess
    if @lives > 0

      puts "Enter a letter"
      guess = gets.chomp

      # if a letter is not part of the word then remove the letter from the array
      good_guess = @word.first.include? guess
      if guess == "exit"
        puts "thanks for playing!"
      elsif good_guess
        puts "You are correct!"
        print_teaser(guess)

        if @word.first == @word_teaser.split.join
          puts "Congratulations.. you guesses the secret word"
        else
          make_guess
        end
      else
        @lives -= 1
        puts "Sorry... you have #{@lives} remaining"
        make_guess
        puts @word_teaser
      end
    else
      puts "Game over"
    end
  end

  def begin
    # ask user for a letter
    puts "New game started... your word is #{@word.first.size} characters long"
    puts "To exit type 'exit'"
    puts "#{@word.last}"
    puts @word_teaser
    make_guess
  end
end

game = Hangman.new
game.begin
