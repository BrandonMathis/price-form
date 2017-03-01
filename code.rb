require 'json'

json_file     = 'posting_data.json'
file          = File.read(json_file)

posting_data  = JSON.parse(file)

class PricedFrom

  attr_accessor :posting_data
   
  def initialize(posting_data)
    @posting_data = posting_data
  end

  def cost(team_size)
    nil
  end

end

(1..30).each { |n|
  puts "#{n} #{n == 1 ? 'seat is' : 'seats are'} Priced from #{PricedFrom.new(posting_data).cost(n)}"
}
