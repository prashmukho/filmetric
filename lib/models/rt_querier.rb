class RTQuerier
  attr_accessor :data
  include RottenTomatoes

  def initialize(data)
    self.data = data
    Rotten.api_key = '4n59g6mbwkfb3ptjjqh9dmdc'
  end

  def find_movie(title)
    movie = RottenMovie.find(:title => title, :limit => 1)
    binding.pry
    full_movie = RottenMovie.find(:id => movie.id)
    full_movie
  end

  


end