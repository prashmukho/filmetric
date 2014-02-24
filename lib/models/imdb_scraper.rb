require_relative '../../config/environment'

class IMDBScraper
  attr_accessor :titles, :counter, :base_url

  def initialize(base_url)
    self.base_url = base_url
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
      base_url
    else
      new_url = "#{base_url}&start=#{counter}01"
      new_url
    end
  end

  def scrape
    while counter < 7
      nokogiri_query(generate_url(counter))
      self.counter += 1
    end
  end
end