arr = [1,3,4,5,1,5,3,4,8,9,10,7]
loop do
	swapped = false
  (arr.size - 1).times.each do |elem|
    if arr[elem] > arr[elem+1]
      arr[elem], arr[elem+1] = arr[elem+1], arr[elem]
			swapped = true
		end
  end
  break if !swapped
end

p arr & arr