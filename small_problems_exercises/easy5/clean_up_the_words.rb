def cleanup(string)
  string.gsub(/[^[:alpha:]]/, ' ').gsub!(/\s+/, ' ') #could have also used .squeeze
end

puts cleanup("---what's my +*& line?") == ' what s my line '
