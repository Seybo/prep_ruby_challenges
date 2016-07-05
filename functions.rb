def power(base, exponent)

  if exponent < 0 
    puts "exponent should be > 0"
    return NIL
  end

  if exponent == 0
    return 1
  else
    return base * power(base, exponent - 1)
  end

end

def factorial(number)

  if number < 0 
    puts "number should be > 0"
    return NIL
  end
  
  if number == 0
    return 1
  else
    return number * factorial(number-1)
  end

end

def uniques(items_array)

  hash = {}
  result = []
  items_array.each { |item| hash[item] = :_ }
  hash.each_key {|key| result << key }
  result

end

def combinations(array1, array2)
  
  result = array1.product(array2)
  result.each do |element|
    element[0] = element[0]+element[1]
    element.delete_at(1)
  end

end

def is_prime?(number)

  if number < 0 || number.class != Fixnum
    puts "number must be > 0 and be integer"
    return FALSE
  end
  
  return false if number % 2 == 0
  return false if number % 3 == 0
  return false if number % 5 == 0
  return false if number % 7 == 0
  # according to the benchmarks this is enough :)

  (9..Math.sqrt(number).to_i).step(2) do |n|
    return false if number % n == 0
  end

  return true
    
end

def overlap(rectangle1, rectangle2)
  
  r1x1 = [rectangle1[0][0], rectangle1[1][0]].min
  r1x2 = [rectangle1[0][0], rectangle1[1][0]].max
  r1y1 = [rectangle1[0][1], rectangle1[1][1]].min
  r1y2 = [rectangle1[0][1], rectangle1[1][1]].max
  
  r2x1 = [rectangle2[0][0], rectangle2[1][0]].min
  r2x2 = [rectangle2[0][0], rectangle2[1][0]].max
  r2y1 = [rectangle2[0][1], rectangle2[1][1]].min
  r2y2 = [rectangle2[0][1], rectangle2[1][1]].max
  
  r1x1 < r2x2 && r1x2 > r2x1 && r1y1 < r2y2 && r1y2 > r2y1 ? true : false
end

def the_game(players_number, counting_upto)
  
  return "inputs must not be less than 1" if players_number<1 || counting_upto <1
  
  person = 0
  direction_forward = true
  skip_next = false

  (1..counting_upto).each do |current_number|
    direction_forward ? person += 1 : person -= 1

    if skip_next 
      direction_forward ? person += 1 : person -= 1
      skip_next = false
    end

    person = 1 if person == players_number+1
    person = players_number if person == 0

    if current_number % 7 == 0 
      direction_forward = !direction_forward
    end

    if current_number % 11 == 0 
      skip_next = true
    end
  end
  
  puts "the last number #{counting_upto} said person #{person}"

end