# All prime numbers till max limit
def prime_number(max)
  p 1
  for i in (2..max) do
    for j in (2..i) do
        break if i%j == 0
    end
    p i if i==j
  end
end
# prime_number(100)

# First n prime numbers
require 'prime'
def first_prime_number(limit)
  prime_instance = Prime.instance
  p prime_instance.first limit
end
# first_prime_number(10)

# Cache example
class CacheManagment
  attr_accessor :elements
  attr_reader :range_limit

  def initialize(range_limit, elements = {})
    @range_limit = range_limit
    @elements = elements
    @preference = 0
  end

  def get(key)
    add_preference(key)
    elements.dig(:key, :value)
  end

  def put(key, value)
    p "#{range_limit} = #{elements.length}"
    delete if elements.length >= range_limit
    elements[key] = {value: value}
    add_preference(key)
  end

  def delete
    lowest_preference = elements.values.map{|elem| elem[:preference]}.compact.min
    delete_element = elements.select{|key, value| value[:preference]== lowest_preference}
    elements.delete(delete_element.keys[0])
  end

  def add_preference(key)
    @preference = @preference.to_i + 1 if @preference
    elements[key].merge!({ preference: @preference})
  end

end

cm = CacheManagment.new(3)
  cm.put('a', 10)
  cm.put('b', 100)
  cm.put('c', 20)
  p cm
  cm.put('d', 20)
  p cm


