module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def apply_block(items, block)
        return if items.empty?
        first, *rest = items
        block.call(first)
        apply_block(rest, block)
      end

      def reduce_with_block(result, items, block)
        return result if items.empty?
        first, *rest = items
        new_result = result.nil? ? first : block.call(result, first)
        reduce_with_block(new_result, rest, block)
      end

      def my_each(&block)
        apply_block(self, block)
        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        create_new_collection = ->(result, item) { result << block.call(item) }
        my_reduce(self.class.new, &create_new_collection)
      end

      # Написать свою функцию my_compact
      def my_compact
        create_new_collection = ->(result, item) { !item.nil? ? result << item : result }
        my_reduce(self.class.new, &create_new_collection)
      end

      # Написать свою функцию my_reduce
      def my_reduce(start = nil, &block)
        reduce_with_block(start, self, block)
      end
    end
  end
end
