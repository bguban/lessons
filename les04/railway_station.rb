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

  def cargo_trains
    trains_by_type(:cargo)
  end

  def pass_trains
    trains_by_type(:pass)
  end

  #Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
  def delete_train(train)
    @trains.delete(train)
  end

  def to_s
    @name
  end

  private

  #Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
  def trains_by_type(type)
    @trains.select{|train| train.type == type}
  end
end