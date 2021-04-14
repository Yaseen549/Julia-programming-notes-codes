# if else condition

x = -1

if x < 0
	print("negative")
elseifi x > 0
	print("positive")
else
	print("zero")
end

## ternary operator
print(x<0?"negative":(x>0?"positive":"zero"))

# loops in Julia

for i in [1,4,7]
	println(i)
end

for s in ["samosa", "Biriyani", "naan"]
	println(s, " Yummy!")
end

for i=0:5
	println(i)
end


i=1
while i<=5
	println(i)
	i+=1
end

# continue 
for i in 1:5
	if i%2==0
		continue # or break
	end
	println(i*i)
end


# key finding game

key_location = "chair"
for i in ["garage", "living room", "chair", "closet"]
	if i == key_location
		println("key found at ",i)
		break
	end
	println("key not found at ", i)
end



#  compounds in Julia

area = begin
     base = 10
     height = 5
     1/2*(base*height)
end
# or
area = base = 10; height=5; 1/2*(base*height)


function triarea()
	 base = 10
     height = 5
     1/2*(base*height)
end

x = triarea()


# tasks / coroutines / Generators

# fibonacci in Julia

function fibonacci()
	a = 0
	produce(a)
	b = 1
	produce(b)
	white true
		a,b=b,a+b
		produce(b)
	end
end

generator = Task(fib)
consume(generator) # o/p: 0 produces output one by one

for i in Task(fibonacci)
	println(i)
	if i > 13
		break
	end
end


generator = @task fibonacci("hello world")

consume(generator)
# ```
# Scope of Variables

# Julia provides three levels of variable scopes,

#     Global Scope - module, baremodule

#     Soft Local scope - Variables defined within for, while, try-catch-finally.

#     Hard Local scope - Variabes defined with struct, functions and macros
# ```


# ```
# Integer and Floating Types

# Julia is the most suited numerical computing language of the planet.

#     It offers integer data type as Int8,Int16,Int32,Int64,Int128.

#     It offers unsigned integer as UInt8,UInt16,UInt32,UInt64,UInt128.

#     It offers boolean as bool and float types as Float16, Float32, Float 64.

#     It also supports binary and Octal literals.


# ```


#  ---------------------------------

# Numerical Utility Functions

# Following functions in Julia is of good utility for performing numerical operations,

#     typeof - Returns the data type of the provided value. E.g: typeof(16.0) returns Float64

#     Sys.WORD_SIZE - Returns the type of machine. Returns 64 if the machine is a 64-bit machine.

#     typemin - Returns the minimum value for the data type. E.g: typemin(Int32) returns -2147483648.

#     typemax - Returns the maximum value for the data type. E.g: typemin(bools) returns 1.

#     sizeof - Returns the size of the value provided in the argument. E.g: sizeof(1)returns 8.

#     eps - Returns the machine epsilon for the given value. E.g: eps(1.0) returns 2.220446049250313e-16.

#     zero(x) - Literal Zero provides the exact zero value based on the type. E.g: zero(Float32) returns 0.0f0.

#     one(x) - Literal one provides the exact value of one based on the data type. E.g: one(Int32) returns 1.





#  ---------------------------------

# Julia functions

function f(x,y)
	return x+y
end

f(2,3)

# =====================================


f(x,y) = x+y
f(2,3)

#  --------------

function f(x,y)
	x+y
end

f(5,3)

#  ------------------

function f(x,y)
	return x+y
	x*y
end

#  ------------------

function f(x,y)
	x+y
	x*y # only this line will execute
end

f(2,3)


#  --------- solution

function f(x,y)
	x+y, x*y
end

f(2,3)

#  -----------------

x,y = f(3,5)

x
y

#  -------------

# operators are functions

1+2+3 # answers is 6

+(1,2,3) # answer is 6

# Functions are first class of julia

foo=+
foo(2,3)

#  ---------

function f(x,y)
	return x+y
end

g = f

g(2,3) # o/p: 5

#  ----------------

# map functions

map(function(x)
	x*2
	end,[1,2,3])

# o/p: 3-element Array{Int64,1}:
# 2
# 4
# 6

# ----------
		# ^
		# |
map(x -> x*2, [1,2,3])
#  -----------------------

function f(x,y=5)
	x+y
end

f(3,4)
f(3)
# ------------------------

function div(;x=10,y=5)
	x/5
end

div(x=20,y=10)


#  -----------------------------

# Dispatch is a method of implementing dynamic polymorphism.

#     Single Dispatch refers to basic dynamic dispatch in which the selection of the implementation for a given method is decided at runtime.

#     Multiple Dispatch refers to a type of dispatch in which the selection of the implementation for a given method is decided based on the arguments at runtime.


#  ==============================

# there is no function that takes two float64 as a parameter. This is called ambiguous methods.

# ==================================



# include modules

module name

print("My Name")

end


module Avogadro

include("filename.jl")
include("filename2.jl")

end