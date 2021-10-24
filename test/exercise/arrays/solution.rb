module Exercise
  module Arrays
    class << self
      def replace(array)
        max = 0
        array.each { |item| max = item if item > max }
        array.map { |item| item.positive? ? max : item }
      end

      def search(array, query)
        binary_search = lambda do |items, counter, item|
          return -1 if items.empty?

          half_count = items.length / 2
          left = items[0, half_count]
          right = items[half_count..items.length]
          return counter + half_count - 1 if left.last == item
          return counter + half_count if right.first == item

          if left.last && left.last < item
            binary_search.call(right, counter + half_count, item)
          else
            binary_search.call(left, counter, item)
          end
        end
        binary_search.call(array, 0, query)
      end
    end
  end
end
