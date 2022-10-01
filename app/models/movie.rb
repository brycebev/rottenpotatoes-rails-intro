class Movie < ActiveRecord::Base
  def self.with_ratings(ratings_list)
    puts '@rating'
    puts self.rating
    Movie.where(ratings_list.include?(self.rating))
  end

  def self.all_ratings
    nums = Array.[]('G','PG','PG-13','R')
    nums
  end
end