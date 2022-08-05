require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

# finds available squares
def empty_squares(brd) 
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

# joins and adds or at the end of list of available squares
def joinor(empty_squares, delimiter = ', ', joining_word = 'or') 
  if empty_squares.size > 2
    string = empty_squares.join(delimiter)
    string[-2] = " #{joining_word} "
  else
    string = empty_squares.join(" #{joining_word} ")
  end
  string
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

# priority of moves: winning move, block player win, fill middle, random
def computer_places_piece!(brd)
  square = nil
  if immediate_threat_or_win?(brd)
    square = find_high_reward_square(brd)
  elsif empty_squares(brd).include?(5)
    square = 5
  else
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

# find sqaure that will be a winning move for either player
def find_high_reward_square(brd)
  [COMPUTER_MARKER, PLAYER_MARKER].each do |marker| 
    WINNING_LINES.each do |line|
      if brd.values_at(*line).count(marker) == 2
        line.each do |square|
          return square if empty_squares(brd).include?(square)
        end
      end
    end
      false
  end
end

def place_piece!(brd, player)
  if player == 'Computer'
    computer_places_piece!(brd)
  else
    player_places_piece!(brd)
  end
end

def alternate_player(just_played)
  return 'Player' if just_played == 'Computer'
  return 'Computer'
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def ultimate_winner(player, computer)
  if player == 5
    return 'Player'
  elsif computer == 5
    return 'Computer'
  else
    return ''
  end
end

# checks to see if there is an immediate threat or an available winning move
def immediate_threat_or_win?(brd)
  WINNING_LINES.each do |line|
    [COMPUTER_MARKER, PLAYER_MARKER].each do |marker|
      if ((brd.values_at(*line).count(marker) == 2 && 
      brd.values_at(*line).count(' ') == 1))
        return true
      end
    end
  end
  false
end

def play_again?(ans)
  return false unless ans.downcase.start_with?('y')
  true
end


loop do # outer loop
  current_player = ''
  
  computer_wins = 0
  player_wins = 0
  overall_winner = ''
  
  loop do # inner each round loop
    board = initialize_board
    
    loop do # select first player loop
      prompt "Who would you like to go first?" 
      prompt "C for computer P for player, or R for random."
      answer = gets.chomp.upcase
      if answer.include?('C')
        current_player = 'Computer'
        break
      elsif answer.include?('P')
        current_player = 'Player'
        break
      elsif answer.include?('R')
        current_player = ['Computer', 'Player'].sample
        break
      else
        prompt "Not a valid input. C for computer or P for player."
      end
    end
    
    loop do # each individual play loop

      loop do
        display_board(board)
        prompt "Computer wins: #{computer_wins}"
      prompt "Player wins: #{player_wins}"
        place_piece!(board, current_player)
        current_player = alternate_player(current_player)
        break if someone_won?(board) || board_full?(board)
      end

      break
    end

    display_board(board)
    
    if someone_won?(board)
      winner = detect_winner(board)
      prompt "#{winner} won!"
      computer_wins += 1 if winner == 'Computer'
      player_wins += 1 if winner == 'Player'
    else
      prompt "It's a tie!"
    end
    prompt "Reach 5 wins and become the ultimate winner!"
    
    prompt "Play again? (y or n)"
    answer = gets.chomp
    if play_again?(answer) == false
      prompt "Thanks for playing Tic Tac Toe! Good bye!"
      exit
    end

    display_board(board)

    overall_winner = ultimate_winner(player_wins, computer_wins)
  end

  prompt "The ultimate winner is #{overall_winner}!" if overall_winner != ''
end
