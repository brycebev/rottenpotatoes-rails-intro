class Movie < ActiveRecord::Base
  def self.with_ratings(ratings_list)
    Movie.where(ratings_list.inclue? rating)
  end

  def self.all_ratings
    puts "hello"
    nums = Array.[](1, 2, 3, 4,5)
    nums
  end
end