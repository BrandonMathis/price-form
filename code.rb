require 'json'
require 'rspec'
require 'pry-byebug'
require 'awesome_print'

json_file     = 'posting_data.json'
file          = File.read(json_file)
posting_data  = JSON.parse(file)

class PricedFrom
  attr_accessor :posting_data, :spaces

  def initialize(posting_data)
    @posting_data = posting_data
    @spaces = @posting_data['posting']['spaces'].map do |space_json|
      if space_json['type'] == 'private_office'
        PrivateSpace.new(space_json)
      else
        Space.new(space_json)
      end
    end
    @spaces.sort_by! do |s|
      s.price_per_seat
    end
  end


  def cost(team_size)
    ideal_bookings(team_size).map(&:cost).inject(0) { |sum, x| sum + x }
  end

  def ideal_bookings(team_size)
    @spaces.map do |space|
      if team_size == 0 || space.min_allowed_team > team_size
        NullBooking.new
      else
        booking = Booking.new(space, team_size)
        team_size -= space.available_space
        booking
      end
    end
  end
end

class NullBooking
  def cost; 0 end
end

class Booking
  attr_reader :space, :team_size

  def initialize(space, team_size)
    @space = space
    @team_size = team_size
  end

  def cost
    space.price_to_seat(team_size)
  end
end

class Space
  attr_reader :name, :type, :price, :available_space

  def initialize(json)
    @name = json['name']
    @type = json['type']
    @price = json['price']
    @available_space = json['available_space']
  end

  def price_per_seat
    price
  end

  def min_allowed_team
    1
  end

  def total_to_book_entire_space
    available_space * price_per_seat
  end

  def price_to_seat(team_size)
    if team_size > available_space
      total_to_book_entire_space
    else
      team_size * price_per_seat
    end
  end
end

class PrivateSpace < Space
  def min_allowed_team
    available_space
  end

  def price_per_seat
    price / available_space
  end

  def min_allowed_team
    available_space
  end

  def price_to_seat(team_size)
    price
  end
end

# (1..30).each { |n|
#   puts "#{n} #{n == 1 ? 'seat is' : 'seats are'} Priced from #{PricedFrom.new(posting_data).cost(n)}"
# }
