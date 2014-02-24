require_relative 'spec_helper'

describe IMDBScraper do
  let(:url) {'http://www.imdb.com/search/title?at=0&groups=top_1000&sort=year,desc&view=simple'}

  it 'has titles' do
    scraper = IMDBScraper.new
    expect(scraper.titles).to eq([])
  end

  it 'sets counter to 0 on initialization' do
    scraper = IMDBScraper.new
    expect(scraper.counter).to eq(0)
  end

  it 'can query nokogiri' do
    scraper = IMDBScraper.new
    scraper.nokogiri_query(url)
    expect(scraper.titles.length).to_not eq(0)
  end

  it 'can generate valid urls' do
    scraper = IMDBScraper.new
    new_url = scraper.generate_url(5)
    scraper.nokogiri_query(new_url)
    expect(scraper.titles.length).to_not eq(0)
  end

  it 'gets titles while scraping' do
    scraper = IMDBScraper.new
    scraper.scrape
    expect(scraper.titles.length).to_not eq(0)
  end

end