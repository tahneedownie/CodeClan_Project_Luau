
require_relative('../db/sql_runner')

class Guest

  attr_reader :id, :title, :first_name, :surname, :address, :city, :country, :postcode, :email, :room_id

  attr_writer :title, :first_name, :surname, :address, :city, :country, :postcode, :email


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @first_name = options['first_name']
    @surname = options['surname']
    @address = options['address']
    @city = options['city']
    @country = options['country']
    @postcode = options['postcode']
    @email = options['email']
    @room_id = options['room_id'].to_i
  end


  def save
    sql = "INSERT INTO guests
    (
      title,
      first_name,
      surname,
      address,
      city,
      country,
      postcode,
      email,
      room_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7, $8, $9
    )
    RETURNING id"
    values = [@title, @first_name, @surname, @address, @city, @country, @postcode, @email, @room_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end


  def room()
    room = Room.find(@room_id)
    return room
  end


  def update()
    sql = "UPDATE guests
    SET
    (
      title,
      first_name,
      surname,
      address,
      city,
      country,
      postcode,
      email,
      room_id
    ) =
    (
      $1, $2, $3, $4, $5, $6, $7, $8, $9
    )
    WHERE id = $10"
    values = [@title, @first_name, @surname, @address, @city, @country, @postcode, @email, @room_id, @id]
    SqlRunner.run(sql, values)
  end


  def delete()
    sql = "DELETE FROM guests
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def self.all()
    sql = "SELECT * FROM guests"
    guest_data = SqlRunner.run(sql)
    guests = map_items(guest_data)
    return guests
  end


  def self.map_items(guest_data)
    return guest_data.map { |guest| Guest.new(guest) }
  end


  def self.find(id)
    sql = "SELECT * FROM guests
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    guest = Guest.new(result)
    return guest
  end


  def format_name
    return "#{@first_name.capitalize} #{@surname.capitalize}"
  end


end
