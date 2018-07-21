# GUEST CLASS FILE

require_relative('../db/sql_runner')

class Guest

  attr_reader :id, :title, :first_name, :surname, :address, :email

  attr_writer :title, :first_name, :surname, :address, :email


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @first_name = options['first_name']
    @surname = options['surname']
    @address = options['address']
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
      email
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@title, @first_name, @surname, @address, @email]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end


end
