require 'rspec'
require './code'

json_file     = 'posting_data.json'
file          = File.read(json_file)
posting_data  = JSON.parse(file)

describe 'lowest price' do
  let(:n) { 1 }

  subject { PricedFrom.new(posting_data) }

  it 'will give the lowest price for 1' do
    expect(subject.cost(1)).to eq(150)
  end

  it 'will give the lowest price for 2' do
    expect(subject.cost(2)).to eq(350)
  end

  it 'will give the lowest price for 3' do
    expect(subject.cost(3)).to eq(550)
  end

  it 'will give the lowest price for 4' do
    expect(subject.cost(4)).to eq(850)
  end

  it 'will give the lowest price for 5' do
    expect(subject.cost(5)).to eq(1150)
  end

  it 'will give the lowest price for 6' do
    expect(subject.cost(6)).to eq(1450)
  end

  it 'will give the lowest price for 7' do
    expect(subject.cost(7)).to eq(1775)
  end

  it 'will give the lowest price for 8' do
    expect(subject.cost(8)).to eq(2100)
  end

  it 'will give the lowest price for 9' do
    expect(subject.cost(9)).to eq(2425)
  end

  it 'will give the lowest price for 10' do
    expect(subject.cost(10)).to eq(2750)
  end

  it 'will give the lowest price for 11' do
    expect(subject.cost(11)).to eq(3075)
  end

  it 'will give the lowest price for 12' do
    expect(subject.cost(12)).to eq(3475)
  end

  it 'will give the lowest price for 13' do
    expect(subject.cost(13)).to eq(3875)
  end

  it 'will give the lowest price for 14' do
    expect(subject.cost(14)).to eq(4275)
  end

  it 'will give the lowest price for 15' do
    expect(subject.cost(15)).to eq(4675)
  end

  it 'will give the lowest price for 16' do
    expect(subject.cost(16)).to eq(5075)
  end

  it 'will give the lowest price for 17' do
    expect(subject.cost(17)).to eq(5475)
  end

  it 'will give the lowest price for 18' do
    expect(subject.cost(18)).to eq(5875)
  end

  it 'will give the lowest price for 19' do
    expect(subject.cost(19)).to eq(6275)
  end

  it 'will give the lowest price for 20' do
    expect(subject.cost(20)).to eq(6675)
  end

  it 'will give the lowest price for 21' do
    expect(subject.cost(21)).to eq(7075)
  end

  it 'will give the lowest price for 22' do
    expect(subject.cost(22)).to eq(7975)
  end

  it 'will give the lowest price for 23' do
    expect(subject.cost(23)).to eq(8575)
  end

  it 'will give the lowest price for 24' do
    expect(subject.cost(24)).to eq(8825)
  end

  it 'will give the lowest price for 25' do
    expect(subject.cost(25)).to eq(9075)
  end

  it 'will give the lowest price for 26' do
    expect(subject.cost(26)).to eq(9975)
  end

  it 'will give the lowest price for 27' do
    expect(subject.cost(27)).to eq(10575)
  end

  it 'will give the lowest price for 28' do
    expect(subject.cost(28)).to eq(10825)
  end

  it 'will give the lowest price for 29' do
    expect(subject.cost(29)).to eq(11725)
  end

  it 'will give the lowest price for 30' do
    expect(subject.cost(30)).to eq(12325)
  end
end
