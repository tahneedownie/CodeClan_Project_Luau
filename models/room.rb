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









end
