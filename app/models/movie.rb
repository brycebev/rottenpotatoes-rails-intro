class Movie < ActiveRecord::Base
  def self.with_ratings(ratings_list)
    # puts '@rating'
    # puts :rating
    Movie.where(rating: ratings_list)
  end

  def self.all_ratings
    nums = Array.[]('G','PG','PG-13','R')
    nums
  end
end