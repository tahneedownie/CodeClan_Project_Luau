# ROOM CLASS FILE

require_relative('../db/sql_runner')

class Room

  attr_reader :id, :room_name


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @room_name = options['room_name']
  end


end
