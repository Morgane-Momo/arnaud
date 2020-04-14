
def is_multiple_of_3_or_5?(n)
n.to_i	
result = 0
  if n % 3 == 0 or n % 5 == 0
  result = true
  else result = false
  end
print result
end 





def sum_of_3_or_5_multiples(final_number)
  
  final_sum = 0
  final_number.times do |i|
    if is_multiple_of_3_or_5?(i) == true
      final_sum += i 
    end
  end
  return final_sum
end




puts is_multiple_of_3_or_5?(12)
puts sum_of_3_or_5_multiples(12)