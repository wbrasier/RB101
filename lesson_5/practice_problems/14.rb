hsh = {
      'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
      'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
      'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
      'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
      'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
      }
# [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

arr = []
hsh.select do |_, characeristics|
  if characeristics[:type] == 'fruit'
    arr << characeristics[:colors].map(&:capitalize)
  else
    arr << characeristics[:size].upcase
  end
end
