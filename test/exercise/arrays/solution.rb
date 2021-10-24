module Exercise
  module Arrays
    class << self
      def replace(array)
        max = 0
        array.each { |item| max = item if item > max }
        array.map { |item| item > 0 ? max : item }
      end

      def search(_array, _query)
        def binary_search(items, counter, query)
          if items.empty?
            return -1
          end
          half_count = items.length / 2
          left = items[0, half_count]
          right = items[half_count..]
          if left.last == query
            return counter + half_count - 1
          elsif right.first == query
            return counter + half_count
          end
          if left.last && left.last < query
            binary_search(right, counter + half_count, query)
          else
            binary_search(left, counter, query)
          end
        end
        binary_search(_array, 0, _query)
      end
    end
  end
end
