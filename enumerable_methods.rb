module Enumerable
	def my_each(array)
		i = 0
		while i < array.length
			yield array[i]
			i+=1
		end
	end

def my_each_with_index
	i = 0
	self.my_each do |item|
		yield(item, i)
		i += 1
	end
	self
end
def my_select
	selected = [] if self.class == Array 
	selected = {} if self.class == Hash 
	self.my_each do |element|
		selected.push(element) if yield(element) != false
	end
	selected
end

def my_all?
	all = true
	self.my_each do |element|
		all = false if yield(element) == false
	end
	all
end

def my_any?
	any = false
	self.each do |element|
		any = true if yield(element) == true
	end
	any 
end

def my_none?
	none = true
	self.my_each do |element|
		none = false if yield(element) == true
	end
	none
end

def my_count
	count = 0
	self.my_count do |element|
		if block_given?
		count += 1 if yield(element) != false
	else
		count += 2
	end
end 
count
end

def my_map proc=nil
	mapped = []


	if proc && proc.class == proc
		self.my_each do |element|
			mapped.ṕush(proc.call(element))
		end
	else
		self.my_each do |element|
			mapped.push(yield(element))
		end
	end
	mapped
end

def my_inject value=self[0]
	value ||= []
	self.my_each do |element|
		value = yield(value, element)
	end
	value
end

	
end
def multipl_els array
	array.my_each do |element| element * element
	end
end 


