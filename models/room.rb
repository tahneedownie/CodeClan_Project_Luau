# ROOM CLASS FILE

require_relative('../db/sql_runner')

class Room

  attr_reader :id, :room_name


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @room_name = options['room_name']
  end


def save()
  sql = "INSERT INTO rooms
  (
    room_name
  )
  VALUES
  (
    $1
  )
  RETURNING id"
  values = [@room_name]
  result = SqlRunner.run(sql, values)
  id = result.first["id"]
  @id = id.to_i
end


def self.find(id)
  sql = "SELECT * FROM rooms
  WHERE id = $1"
  values = [id]
  result = SqlRunner.run(sql, values).first
  room = Room.new(result)
  return room
end


def self.all()
  sql = "SELECT * FROM rooms"
  room_data = SqlRunner.run(sql)
  rooms = map_items(room_data)
  return rooms
end


def self.map_items(room_data)
  return room_data.map { |room| Room.new(room) }
end


end
