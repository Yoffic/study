module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        has_many_countries = ->(movie) { movie['country'] && movie['country'].split(',').length > 1 }
        rating_to_count = array.select(&has_many_countries)
                               .map { |movie| movie['rating_kinopoisk'].to_f || 0 }
                               .reduce([]) { |ratings, current_rating| current_rating.positive? ? ratings << current_rating : ratings }
        rating_sum = rating_to_count.reduce(0) { |sum, rating| sum + rating }
        rating_sum / rating_to_count.length
      end

      def chars_count(films, threshold)
        has_needed_rating = ->(movie) { movie['rating_kinopoisk'] && movie['rating_kinopoisk'].to_f >= threshold }
        films
          .select(&has_needed_rating)
          .map { |movie| movie['name'].count 'и' }
          .reduce(0) { |chars_sum, chars_count| chars_sum + chars_count }
      end
    end
  end
end
