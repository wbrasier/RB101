BLOCKS = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'], 
         ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'], 
         ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

def block_word?(string)
  arr = string.upcase.chars
  count = BLOCKS.map do |block|
    block.map { |letter| arr.count(letter) }
  end
  count.map! do |side|
    side[0] + side[1]
  end
  !count.any? { |num| num >= 2 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true