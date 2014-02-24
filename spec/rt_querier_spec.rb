require_relative 'spec_helper'

describe RTQuerier do
  let(:titles) {['Moon', 'Precious', 'A Prophet']}
  
  it 'takes data on initialization' do
    querier = RTQuerier.new(titles)
    expect(querier.data).to eq(titles)
  end

  xit 'can create movie instances from RT queries' do
    querier = RTQuerier.new(titles)
    querier.query

    expect(Movie.all.count).to eq(3)
  end

  xit 'can fill movie instances with valid data' do
  end

end