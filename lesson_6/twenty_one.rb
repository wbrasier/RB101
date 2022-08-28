require 'yaml'
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
      prompt "Time for the dealer to hit or stay!"
      return 'stay'
    else
      prompt "Sorry, that is not a valid option. H for hit or S for stay."
    end
  end
end

def player_hit_new_total(dck, player_crds)
  prompt "You hit! Time to get another card!"
  sleep 2
  deal_cards!(dck, player_crds, 1)
  display_cards(player_crds, 'You have', player_crds.count)
  player_total = calculate_total(player_crds)
  prompt "Your total is #{player_total}"
  player_total
end

def bust?(points)
  points > GAME_NUMBER
end

def dealer_hit_or_stay(dealer)
  if dealer < DEALER_HITS_UNTIL
    prompt "Dealer hits!"
    sleep 2
    'hit'
  elsif bust?(dealer)
    prompt "Dealer BUSTS!"
    sleep 2
    'bust'
  else
    prompt "Dealer stays!"
    sleep 2
    'stay'
  end
end

def display_totals(player_pts, dealer_crds, dealer_pts)
  puts "---------------------------------"
  prompt "Your total is #{player_pts}"
  display_cards(dealer_crds, 'Dealer has', dealer_crds.count)
  prompt "Dealer's total is #{dealer_pts}"
  winner = calculate_winner(player_pts, dealer_pts)
  display_winner(winner)
end

def calculate_winner(player, dealer)
  if player == dealer
    'tie'
  elsif player < dealer
    dealer > GAME_NUMBER ? 'player' : 'dealer'
  else
    player > GAME_NUMBER ? 'dealer' : 'player'
  end
end

def display_winner(winner)
  if winner == 'player'
    prompt "You win! Congrats!"
  elsif winner == 'dealer'
    prompt "You lose :("
  else
    prompt "Tie!"
  end
end

def update_winner_totals!(player_pts, dealer_pts, scores)
  winner = calculate_winner(player_pts, dealer_pts)
  if winner == 'player'
    scores['player_points'] += 1
  elsif winner == 'dealer'
    scores['computer_points'] += 1
  end
end

def display_ultimate_winner(scores)
  if scores['player_points'] >= 5
    ultimate_winner = 'you'
  elsif scores['computer_points'] >= 5
    ultimate_winner = 'computer'
  end
  prompt "The ultimate winner is #{ultimate_winner}!" if ultimate_winner
end

def play_again?
  puts "---------------------------------"
  prompt "Good game! Would you like to play again?"
  yes_or_no_validate
end

def yes_or_no_validate
  answer = ''
  loop do
    prompt "Type y for yes or n for no."
    answer = gets.chomp.downcase
    if answer == 'y' || answer == 'yes'
      return true
    elsif answer == 'n' || answer == 'no'
      return false
    else
      prompt "Invalid answer, put y for yes or n for no."
    end
  end
end

def game_instructions
  message = YAML.safe_load(File.read("twenty_one_game_instructions.yml"))
  message.each do |line|
    prompt line
    gets.chomp
  end
  puts "---------------------------------"
  prompt "Press Enter when you are ready to play!"
  answer = gets.chomp
  system 'clear' if answer
end

def display_ultimate_winner_scores(scores)
  sleep 4
  puts "---------------------------------"
  prompt "Your total amount of wins is #{scores['player_points']}."
  prompt "The computer's total amount of wins is #{scores['computer_points']}."
  prompt "The first to 5 total wins is the ultimate winner!"
end

game_play_info = { 'player_points' => 0,
                   'computer_points' => 0,
                   'games_played' => 0 }

# loop for the individual rounds
loop do
  system 'clear'

  # initializes the deck and deals cards to player and dealer
  deck = initialize_deck
  player_cards = []
  dealer_cards = []
  deal_cards!(deck, player_cards)
  deal_cards!(deck, dealer_cards)

  # shows the player game rules and instructions if they want
  if game_play_info['games_played'] == 0
    puts "---------------------------------"
    prompt "Would you like to see the game rules and instructions?"
    game_instructions if yes_or_no_validate
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
    if player_hit_or_stay == 'hit'
      player_total = player_hit_new_total(deck, player_cards)
      if bust?(player_total)
        prompt 'You BUST!'
        break
      end
    else
      break
    end
  end

  loop do
    # if the player busts the dealer won't do any moves
    break if bust?(player_total)

    if dealer_hit_or_stay(dealer_total) == 'hit'
      deal_cards!(deck, dealer_cards, 1)
      dealer_total = calculate_total(dealer_cards)
    else
      break
    end
  end

  display_totals(player_total, dealer_cards, dealer_total)
  update_winner_totals!(player_total, dealer_total, game_play_info)

  display_ultimate_winner_scores(game_play_info)

  break if game_play_info['player_points'] >= 5 ||
           game_play_info['computer_points'] >= 5

  game_play_info['games_played'] += 1
  break if !play_again?
end

display_ultimate_winner(game_play_info)

prompt "Thanks for playing!"
