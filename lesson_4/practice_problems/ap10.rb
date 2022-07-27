munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, stuff|
  stuff.merge!({'age_group' => ''})
  if stuff['age'] <= 17
    stuff['age_group'] = 'kid'
  elsif stuff['age'] >= 18 && stuff['age'] <= 64
    stuff['age_group'] = 'adult'
  else
    stuff['age_group'] = 'senior'
  end
  munsters 
end

p munsters