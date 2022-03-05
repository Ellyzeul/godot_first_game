static func filter_array_for_uniques(arr):
	var new_arr = []
	var new_arr_size = 0
	var arr_size = arr.size()
	var dup
	
	for i in range(arr_size):
		dup = false
		for j in range(new_arr_size):
			if new_arr[j] == arr[i]:
				dup = true
				break
		print(arr[i])
		if !dup:
			new_arr.append(arr[i])
			new_arr_size+=1
	
	return new_arr
