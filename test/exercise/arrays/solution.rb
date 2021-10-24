module Exercise
  module Arrays
    class << self
      def replace(array)
        max = 0
        array.each { |item| max = item if item > max }
        array.map { |item| item > 0 ? max : item }
      end

      def search(_array, _query)
        0
      end
    end
  end
end
