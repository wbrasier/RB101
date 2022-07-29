def swap_name(first_last)
  first, last = first_last.split
  "#{last}, #{first}"
end

# alternative solution
def swap_name_alt(name)
  name.split(' ').reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
