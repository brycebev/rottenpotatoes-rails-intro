class Movie < ActiveRecord::Base
  def self.with_ratings(ratings_list)
    Movie.where(ratings_list.inclue? rating)
  end

  def self.all_ratings
    return ['G','PG','PG-13','R']
  end
end