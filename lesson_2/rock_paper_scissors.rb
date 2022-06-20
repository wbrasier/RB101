VALID_CHOICES_WORDS = ['rock', 'paper', 'scissors', 'lizard', 'spock']

VALID_CHOICES_LETTERS = ['r', 'p', 'sc', 'l', 'sp']

WINNING_MOVES = { 'rock' => ['lizard', 'scissors'],
                  'paper' => ['rock', 'spock'],
                  'scissors' => ['paper', 'lizard'],
                  'lizard' => ['spock', 'paper'],
                  'spock' => ['scissors', 'rock'] }

def prompt(message)
  puts("=> #{message}")
end

def letters_to_words(letter)
  move = case letter
         when 'r'
           'rock'
         when 'p'
           'paper'
         when 'sc'
           'scissors'
         when 'l'
           'lizard'
         when 'sp'
           'spock'
         end
  move
end

def win?(first, second)
  WINNING_MOVES[first].each.include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def update_score(scores, player, computer)
  if win?(player, computer)
    scores[:player] += 1
  elsif win?(computer, player)
    scores[:computer] += 1
  end
end

def display_score(scores)
  prompt("Your current score is: #{scores[:player]}.")
  prompt("The computer's score is : #{scores[:computer]}.")
end

loop do # main loop
  score = { player: 0,
            computer: 0 }
  loop do # loop of each round
    choice_letter = ''

    loop do
      output = <<-MSG
      => Pick one and type coordinating letters:
      => rock (r)
      => paper (p)
      => scissors (sc)
      => lizard (l)
      => spock (sp)
      MSG

      puts output

      choice_letter = gets.chomp.downcase

      if VALID_CHOICES_LETTERS.include?(choice_letter)
        break
      else
        prompt("That is not a valid choice.")
      end
    end

    choice_word = letters_to_words(choice_letter)

    computer_choice = VALID_CHOICES_WORDS.sample

    puts "You chose: #{choice_word}; computer chose: #{computer_choice}."

    display_results(choice_word, computer_choice)
    update_score(score, choice_word, computer_choice)
    display_score(score)

    # exits the loop if somebody has 3 points
    if score[:player] == 3
      prompt("You are the ultimate champ!")
      break
    elsif score[:computer] == 3
      prompt("The computer is the ultimate champ!")
      break
    end
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Good bye!")
