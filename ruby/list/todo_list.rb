class TodoList
	def initialize(array)
		@item1 = array[0]
		@item2 = array[1]
		@list = [@item1, @item2]
	end

	def get_items
		return @list
	end

	def add_item(new_item)
		@list.push(new_item)
	end

	def delete_item(item)
		@list.delete(item)
	end

	def get_item(index)
		@list[index]
	end
end
