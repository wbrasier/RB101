GAME_NUMBER = 21
DEALER_HITS_UNTIL = GAME_NUMBER - 4

def prompt(msg)
  puts "=> #{msg}"
end

# initializes the full deck as an array of hashes
# the hash key is the card and the value is point value of the card
def initialize_deck
  deck = []
  counter = 1
  (['Ace', '2', '3', '4', '5', '6', '7', '8',
    '9', '10', 'Jack', 'Queen', 'King']).each do |suit|
    4.times do
      if ['Jack', 'Queen', 'King'].include?(suit)
        deck << { suit => 10 }
      else
        deck << { suit => 'Ace' } if suit == 'Ace'
        deck << { suit => counter }
      end
    end
    counter += 1
  end
  deck
end

# deals cards randomly and removes them from the deck
def deal_cards!(dck, crds, card_amount = 2)
  card_amount.times do
    card = dck.sample
    dck.delete(card)
    crds << card
  end
  crds
end

# displays the appropriate amount of cards for each round
def display_cards(crds, card_owner, amount_displayed)
  card_keys = crds.map(&:keys).flatten
  string = "#{card_owner}: "
  if amount_displayed == 1
    string << "#{card_keys[0]} and mystery card"
  elsif amount_displayed == 2
    string << "#{card_keys[0]} and #{card_keys[1]}"
  else
    string << card_keys[0...-1].join(', ')
    string << ", and #{card_keys[-1]}"
  end
  prompt string
end

# calculates the value of all the cards
def calculate_total(crds)
  values = crds.map(&:values).flatten
  values.map! do |value|
    value == 'Ace' ? 11 : value
  end
  sum = values.sum

  # correcting for the aces
  values.select { |value| value == 11 }.count.times do
    sum -= 10 if sum > GAME_NUMBER
  end
  sum
end

def player_hit_or_stay
  loop do
    prompt "Would you like to hit or stay? H for hit or S for stay."
    answer = gets.chomp.downcase
    if answer == 'h' || answer == 'hit'
      system 'clear'
      return 'hit'
    elsif answer == 's' || answer == 'stay'
      system 'clear'
      return 'stay'
    else
      prompt "Sorry, that is not a valid option. H for hit or S for stay."
    end
  end
end

def dealer_hit_or_stay(dealer)
  if dealer < DEALER_HITS_UNTIL
    prompt "Dealer hits!"
    sleep 2
    'hit'
  elsif dealer > GAME_NUMBER
    prompt "Dealer BUSTS!"
    sleep 2
    'bust'
  else
    prompt "Dealer stays!"
    sleep 2
    'stay'
  end
end

def calculate_winner(player, dealer)
  winner =
    if player == dealer
      'tie'
    elsif player < dealer
      dealer > GAME_NUMBER ? 'player' : 'dealer'
    else
      player > GAME_NUMBER ? 'dealer' : 'player'
    end
  winner
end

def play_again?
  puts "---------------------------------"
  prompt "Good game! Would you like to play again?"
  answer = ''
  loop do
    prompt "Y for yes, N for no."
    answer = gets.chomp.upcase
    return true if answer.start_with?('Y')
    answer.start_with?('N') ? (return false) : (prompt "Sorry invalid input")
  end
end

player_points = 0
computer_points = 0
games_played = 0

# loop for the individual rounds
loop do
  system 'clear'

  # initializes the deck and deals cards to player and dealer
  deck = initialize_deck
  player_cards = []
  dealer_cards = []
  deal_cards!(deck, player_cards)
  deal_cards!(deck, dealer_cards)

  # shows the player game rules and instructions
  if games_played == 0
    output = <<-MSG
=> Welcome to Twenty One!
=> The goal of the game is to get as close as possible to #{GAME_NUMBER}
without exceeding it.
    MSG
    puts output
    sleep 4
    output = <<-MSG
=> The dealer will hit (draw a card) until #{DEALER_HITS_UNTIL} points.
    MSG
    puts output
    sleep 4
    output = <<-MSG
=> You can hit (draw a card) or stay (end your turn & not draw) as many
times as you like, but if you exceed #{GAME_NUMBER} you bust and you
lose!
    MSG
    puts output
    sleep 5
    output = <<-MSG
=> Aces will be worth 1 or 11 points based on how many points are already
in the hand. Aces will be worth 11 points until the hand exceeds 21 points,
then the Ace will be worth 1 point.
    MSG
    puts output
    sleep 6
    prompt "The first to 5 total wins is the ultimate winner!"
    sleep 6
    puts "---------------------------------"
  end

  # displays dealer cards and calculates total
  display_cards(dealer_cards, 'Dealer has', 1)
  dealer_total = calculate_total(dealer_cards)

  # displays player cards and calculates total
  display_cards(player_cards, 'You have', player_cards.count)
  player_total = calculate_total(player_cards)
  prompt "Your total is #{player_total}"

  # player hits or stays
  loop do
    player_move = player_hit_or_stay

    if player_move == 'hit'
      prompt "You hit! Time to get another card!"
      sleep 2
      deal_cards!(deck, player_cards, 1)
      display_cards(player_cards, 'You have', player_cards.count)
      player_total = calculate_total(player_cards)
      prompt "Your total is #{player_total}"

      if player_total > GAME_NUMBER
        prompt "You BUST!"
        break
      end
    elsif player_move == 'stay'
      prompt "Time for the dealer to hit or stay!"
      break
    else
      prompt 'Sorry not a valid input. H for hit or S for stay.'
    end
  end

  loop do
    # if the player busts the dealer won't do any moves
    break if player_total > GAME_NUMBER

    dealer_move = dealer_hit_or_stay(dealer_total)
    if dealer_move == 'hit'
      deal_cards!(deck, dealer_cards, 1)
      dealer_total = calculate_total(dealer_cards)
    else
      break
    end
  end

  puts "---------------------------------"
  prompt "Your total is #{player_total}"
  display_cards(dealer_cards, 'Dealer has', dealer_cards.count)
  prompt "Dealer's total is #{dealer_total}"
  winner = calculate_winner(player_total, dealer_total)

  if winner == 'player'
    prompt "You win! Congrats!"
    player_points += 1
  elsif winner == 'dealer'
    prompt "You lose :("
    computer_points += 1
  else
    prompt "Tie!"
  end

  sleep 4
  puts "---------------------------------"
  prompt "Your total amount of wins is #{player_points}."
  prompt "The computer's total amount of wins is #{computer_points}."
  prompt "The first to 5 total wins is the ultimate winner!"
  break if player_points >= 5 || computer_points >= 5

  games_played += 1
  break if !play_again?
end

if player_points >= 5
  ultimate_winner = 'you'
elsif computer_points >= 5
  ultimate_winner = 'computer'
end

prompt "The ultimate winner is #{ultimate_winner}!" if ultimate_winner

prompt "Thanks for playing!"
