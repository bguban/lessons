load 'rw.rb'

t1 = Train.new(1, :pass, 5)
t2 = Train.new(2, :cargo, 10)
puts t1, t2

m = RailwayStation.new('Москва')
h = RailwayStation.new('Харьков')
k = RailwayStation.new('Киев')
puts m, h, k


r = Route.new(m,k)
r.add_station(h)
puts 'route stations:'
puts r.stations

t1.route = r

t1.show_stations
puts 'след станция'
t1.next_station
t1.show_stations
