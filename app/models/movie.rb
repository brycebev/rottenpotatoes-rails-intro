class Movie < ActiveRecord::Base
  def self.with_ratings(ratings_list)
    puts @rating
    Movie.where(ratings_list.include?(@rating))
  end

  def self.all_ratings
    nums = Array.[]('G','PG','PG-13','R')
    nums
  end
end