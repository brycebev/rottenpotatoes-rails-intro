class Movie < ActiveRecord::Base
  def self.with_ratings(ratings_list)
    Movie.where(ratings_list.inclue? rating)
  end

  def all_ratings
    ['G','PG','PG-13','R']
  end
end