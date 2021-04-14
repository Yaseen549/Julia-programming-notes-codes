# Julia functions

function computValue(x,y)
	if typeof(x) == Float64 && typeof(y) == Float64
		return 2x+y
	elseif typeof(x) == Int64 && typeof(y) == Int64
		return x-y
	elseif typeof(x) == String && typeof(y) == String
		return x*y
	end
end

computValue(7.2, 8.1)