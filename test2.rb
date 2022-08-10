class CacheManagement
  def initialize(size)
    @cache_array = {}
    @size = size
    @index = 0
	end
    
  def push(key, value)
    delete if @size.to_i <= @cache_array.size && !@cache_array.has_key?(key)
    @cache_array[key] = {value: value }
		change_sequence(key)

    @cache_array[key]
  end
    
  def get(key)
    change_sequence(key)
    @cache_array[key]
  end
    
  def delete
    @cache_array.delete(sort_arr.keys[0])
  end
  
  def sort_arr
		@cache_array.sort_by { |key, value| value[:sequence]}.to_h
	end
  
  def change_sequence(key)
		@index += 1
    @cache_array[key].merge!({ sequence: @index })
	end
end

cache = CacheManagement.new(3)
cache.push('a', 123)
cache.push('b', 123)
cache.push('c', 123)
cache.get('a')

cache.push('d', 123)
p cache