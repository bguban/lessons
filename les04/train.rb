class Train
  attr_reader :type

  # Имеет номер (произвольная строка), тип, который указывается при создании: грузовой, пассажирский и количество вагонов.
  def initialize(number, type)
    @number = number
    @type = type
    @cars = []
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
  def add_car(car)
    @cars << car if @speed == 0 and car.type == self.type
  end

  def delete_car(car)
    @cars.delete(car) if @speed == 0
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
