def is_multiple_of_3_or_5?(n)
	(n % 3 == 0) || (n % 5 == 0)
end


def sum_of_3_or_5_multiples(final_number)
  final_sum = 0
  	0.upto(final_number)do|i|
  	 
 	final_sum += i if is_multiple_of_3_or_5?(i)
      
   end
end
  

puts is_multiple_of_3_or_5?(12)
puts sum_of_3_or_5_multiples(12)
