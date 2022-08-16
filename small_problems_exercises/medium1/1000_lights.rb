def initialize_hash(int)
   lights = {}
  (1..int).each { |num| lights[num] = 'off' }
  lights
end

def switch_every_nth_light(lights, num)
  lights.each do |position, status|
    if position % num == 0
      lights[position] = (status == "off") ? "on" : "off"
    end
  end
end

def switch_lights(int)
  lights = initialize_hash(int)
  1.upto(lights.size) do |num|
    switch_every_nth_light(lights, num)
  end
  on = lights.select { |position, status|  status == 'on' }
  on.keys
end

p switch_lights(5)