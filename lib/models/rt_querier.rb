require_relative '../../config/environment'

class RTQuerier
  attr_accessor :data, :queried_movies
  include RottenTomatoes

  def initialize(data)
    self.data = data
    Rotten.api_key = '4n59g6mbwkfb3ptjjqh9dmdc'
    self.queried_movies = {}
  end

  # def find_movie_by_name(movie_name)
  # end

  def find_movie_by_imdb(imdb_id)
    movie = RottenMovie.find(:imdb => imdb_id)
    if !movie.nil?
      movie
    end
  end

  def query
    data.each do |imdb_id|
      m = find_movie_by_imdb(imdb_id)
      

      if !m.nil?
        # Movie.create(:title => m.title....)
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


end