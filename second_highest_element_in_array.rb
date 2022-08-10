arr = [1, 3, 4, 6, 8, 9, 6, 2]
highest_value = nil
# arr = arr & arr
loop do
	validator = false
	(arr.size-1).times.each do |elem|
	  if arr[elem] > arr[elem+1]
		arr[elem], arr[elem+1] = arr[elem+1], arr[elem]
	    validator = true
	  end
	end
	break if !validator
end
    
p arr[-1]