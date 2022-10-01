class Movie < ActiveRecord::Base
  def self.with_ratings(ratings_list)
    Movie.where(ratings_list.inclue? rating)
  end

  def self.all_ratings
    nums = Array.[](1, 2, 3, 4,5)
    puts nums
    nums
  end
end