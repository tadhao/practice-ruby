LRU cache
* A key-value store of fixed capacity that evicts oldest items where oldest refers to least recently used.
* Supports 3 operations
   * Put item
   * Get item
   * Delete item
Examples
lru = Lru.new(3)
lru.put(‘a’, 123)
lru.put(‘b’, 124)
lru.put(‘c’, 125)
# lru is full
lru.put(‘d’, 126)
# lru only contains ‘b’, ’c’, ‘d’ since ‘a’ had to be evicted
lru.get(‘b’) # returns 124
lru.put(‘e’, 127)
# lru only contains ‘b’, ‘d’, ‘e’ since ‘c’ had to be evicted - ‘b’ was not the oldest as it was recently used with the get operation.

class Lru

    attr_reader :size

    def initialize(size)
      @size = size
      @cache_elements = {}
      @number = 0
    end
    
    def put(element, number)
			delete_lie if @cache_elements.size >= size
			@cache_elements[element] = { value: number }
      update_preference(element)
    end
    
    def get(element)
        # update the preference
        if @cache_elements[element]
	        update_preference(element)
	        return @cache_elements[element]&.value
				end
    end
    
    def delete_lie
      @cache_elements.
    end
    
    def update_preference(element)
      @number += 1 
			@cache_elements[element]&.preference = @number 
    end
end