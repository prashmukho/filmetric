class IMDBScraper
  attr_accessor :titles, :counter, :base_url
  BASE_URL = 'http://www.imdb.com/search/title?at=0&groups=top_1000&sort=year,desc&view=simple'

  def initialize
    self.titles = []
    self.counter = 0
  end

  def nokogiri_query(url)
    Nokogiri::HTML(open(url)).css('table.results td.title a').each do |t|
     titles << t.text
    end
  end

  def generate_url(counter)
    if counter == 0
      BASE_URL
    else
      new_url = BASE_URL << "&start=#{counter}01"
      new_url
    end
  end

  def scrape
    while counter < 10
      nokogiri_query(generate_url(counter))
      self.counter += 1
    end
  end
end