class Movie < ActiveRecord::Base
  def self.with_ratings(ratings_list)
    Movie.where(ratings_list.inclue?(@rating))
  end

  def self.all_ratings
    nums = Array.[]('G','PG','PG-13','R')
    puts nums
    nums
  end
end