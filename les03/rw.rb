class RailwayStation
  #Имеет название, которое указывается при ее создании
  def initialize(name)
    @name = name
    @trains = []
  end

  #Может принимать поезда (по одному за раз)
  def add_train(train)
    @trains << train
  end

  #Может показывать список всех поездов на станции, находящиеся в текущий момент
  def trains
    @trains
  end

  
  #Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
  def trains_by_type(type)
    @trains.select{|train| train.type == type}
  end


  #Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
  def delete_train(train)
    @trains.delete(train)
  end

  def to_s
    @name
  end
end

class Route
  #Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  #Может добавлять станцию в список

  def add_station(station)
    @stations.insert(-2, station)
  end

  #Может удалять станцию из списка
  def delete_station(station)
    @stations.delete(station)
  end

  #Может выводить список всех станций по-порядку от начальной до конечной
  attr_reader :stations
end

class Train
  attr_reader :type

  # Имеет номер (произвольная строка), тип, который указывается при создании: грузовой, пассажирский и количество вагонов.
  def initialize(number, type, cars_number)
    @number = number
    @type = type
    @cars_number = cars_number
    @speed = 0
  end

  # Поезд может делать следующие вещи:
  # набирать скорость
  def go
    @speed = 60
  end

  # показывать текущую скорость
  attr_reader :speed

  # тормозить
  def stop
    @speed = 0
  end

  # показывать количество вагонов
  attr_reader :cars_number

  # прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
  def add_car
    @cars_number += 1
  end

  def delete_car
    @cars_number -= 1
  end

  # Принимать маршрут следования
  def route=(route)
    @route.stations[@station_index].delete_train(self) if @route and @station_index
    @route = route
    @station_index = 0
    @route.stations[@station_index].add_train(self)
  end

  # Перемещаться между станциями, указанными в маршруте.
  def next_station
    @route.stations[@station_index].delete_train(self)
    @station_index += 1
    @route.stations[@station_index].add_train(self)
  end

  # Показывать предыдущую станцию, текущую, следующую, на основе маршрута
  def show_stations
    puts "Пред станция: #{@route.stations[@station_index-1]}" if @station_index -1 >= 0
    puts "Тек станция: #{@route.stations[@station_index]}"
    puts "След станция: #{@route.stations[@station_index+1]}" if @route.stations[@station_index+1]
  end

  def to_s
    "Поезд №#{@number} тип: #{@type}(#{@cars_number} вагонов)"
  end
end
