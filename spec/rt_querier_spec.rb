require_relative 'spec_helper'

describe RTQuerier do
  let(:ids) {['0892769', '1120985', '0840361']}
  
  it 'takes data on initialization' do
    querier = RTQuerier.new(ids)
    expect(querier.data).to eq(ids)
  end

  it 'gets valid data' do
    querier = RTQuerier.new(ids)
    querier.query
    expect(querier.queried_movies).to_not eq({})
  end

  xit 'can create movie instances from RT queries' do
    querier = RTQuerier.new(ids)
    querier.query

    expect(Movie.all.count).to eq(3)
  end

  xit 'can fill movie instances with valid data' do
  end

end