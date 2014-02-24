require_relative '../../config/environment'

class RTQuerier
  attr_accessor :data, :queried_movies
  include RottenTomatoes

  def initialize(data)
    self.data = data
    Rotten.api_key = '4n59g6mbwkfb3ptjjqh9dmdc'
    self.queried_movies = {}
  end

  def find_movie(title)
    movie = RottenMovie.find(:title => title, :limit => 1)
    full_movie = RottenMovie.find(:id => movie.id)
    sleep 1
    full_movie
  end

  def query
    data.each do |title|
      m = find_movie(title)
      queried_movies[m.title] = {
        :genres => m.genres,
        :release_year => m.year,
        :critic_score => m.ratings.critics_score,
        :audience_score => m.ratings.audience_score,
        :consensus => m.critics_consensus
      }
      puts "Made query for #{m.title}..."
    end
  end


end