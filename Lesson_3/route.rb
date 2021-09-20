=begin
  Класс Route (Маршрут):
  Имеет начальную и конечную станцию, а также список промежуточных станций. 
  Начальная и конечная станции указываются при создании маршрута, а промежуточные могут добавляться между ними.
  Может добавлять промежуточную станцию в список
  Может удалять промежуточную станцию из списка
  Может выводить список всех станций по-порядку от начальной до конечной
=end

class Route

  attr_reader :all_station
  
  def initialize(starting_station, terminal_station)
    @all_station = []
    @all_station.push(starting_station, terminal_station)
  end

  def add_station(station)
    if @all_station.include?(station)
      "Станция \"#{station.name}\" уже есть в маршруте \"#{@all_station.first.name} - #{@all_station.last.name}\" "
    else
      @all_station.insert(-2, station)
      "Промежуточная cтанция \"#{station.name}\" добавлена в маршрут \"#{@all_station.first.name} - #{@all_station.last.name}\" "
    end
  end

  def delete_station(station)
    return "Этой станции нет в маршруте" unless @all_station.include?(station)
    if station == @all_station.first || station == @all_station.last
      "Эту станцию нельзя удалить из маршрута!"
    else
      @all_station.delete(station)
      "Промежуточная станция #{station.name} удалена из маршрута."
    end
  end

  def show_stations
    @all_station.map { |station| "станция \"#{station.name}\"" }
  end

end
