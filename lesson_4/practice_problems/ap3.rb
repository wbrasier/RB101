ages = { 
  "Herman" => 32, 
  "Lily" => 30, 
  "Grandpa" => 5843, 
  "Eddie" => 10, 
  "Marilyn" => 22, 
  "Spot" => 237 
  }

ages.delete_if { |name, age| age > 100 }
p ages