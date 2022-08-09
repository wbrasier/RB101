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

# calculates tha value of all the cards
def calculate_total(crds)
  values = crds.map(&:values).flatten
  values.map! do |value|
    value == 'Ace' ? 11 : value
  end
  sum = values.sum

  values.select { |value| value == 11 }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end

def player_hit_or_stay
  loop do
    prompt "Would you like to hit or stay? H for hit or S for stay."
    answer = gets.chomp
    if answer.downcase.include?('h')
      system 'clear'
      return 'hit'
    elsif answer.downcase.include?('s')
      system 'clear'
      return 'stay'
    else
      prompt "Sorry, that is not a valid option. H for hit or S for stay."
    end
  end
end

def dealer_hit_or_stay(dealer)
  if dealer < 17
    prompt "Dealer hits!"
    'hit'
  elsif dealer > 21
    prompt "Dealer BUSTS!"
    'bust'
  else
    prompt "Dealer stays!"
    'stay'
  end
end

def calculate_winner(player, dealer)
  winner =
    if player == dealer
      'tie'
    elsif player < dealer
      dealer > 21 ? 'player' : 'dealer'
    else
      player > 21 ? 'dealer' : 'player'
    end
  winner
end

# loop for the individual rounds
loop do
  system 'clear'

  # initializes the deck and deals cards to player and dealer
  deck = initialize_deck
  player_cards = []
  dealer_cards = []
  deal_cards!(deck, player_cards)
  deal_cards!(deck, dealer_cards)

  # displays dealer cards
  display_cards(dealer_cards, 'Dealer has', 1)
  dealer_total = calculate_total(dealer_cards)

  # displays player cards
  display_cards(player_cards, 'You have', player_cards.count)
  player_total = calculate_total(player_cards)

  # player hits or stays
  loop do
    player_move = player_hit_or_stay

    if player_move == 'hit'
      prompt "You hit! Time to get another card!"
      deal_cards!(deck, player_cards, 1)
      display_cards(player_cards, 'You have', player_cards.count)
      player_total = calculate_total(player_cards)

      if player_total > 21
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
    break if player_total > 21
    dealer_move = dealer_hit_or_stay(dealer_total)
    if dealer_move == 'hit'
      deal_cards!(deck, dealer_cards, 1)
      dealer_total = calculate_total(dealer_cards)
    else
      break
    end
  end

  prompt "Your total is #{player_total}"
  display_cards(dealer_cards, 'Dealer has', dealer_cards.count)
  prompt "Dealer's total is #{dealer_total}"
  winner = calculate_winner(player_total, dealer_total)

  if winner == 'player'
    prompt "You win! Congrats!"
  elsif winner == 'dealer'
    prompt "You lose :("
  else
    prompt "Tie!"
  end

  prompt "Good game! Would you like to play again?"
  # validating play again input
  answer = ''
  loop do
    prompt "Y for yes, N for no."
    answer = gets.chomp.upcase
    break if answer.start_with?('N') || answer.start_with?('Y')
    prompt "Sorry invalid input."
  end

  break if answer.start_with?('N')
end
prompt "Thanks for playing!"
