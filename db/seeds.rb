require_relative('../models/guest')
require_relative('../models/room')

room1 = Room.new({'room_name' => 'frangipani'})
room2 = Room.new({'room_name' => 'paradise'})
room3 = Room.new({'room_name' => 'hibiscus'})

room1.save
room2.save
room3.save

guest1 = Guest.new({
  'title' => 'Miss',
  'first_name' => 'Rachael',
  'surname' => 'Scott',
  'address' => 'EH6',
  'email' => 'rscott@gmail.com',
  'room_id' => room1.id })

guest2 = Guest.new({
  'title' => 'Mr',
  'first_name' => 'Brian',
  'surname' => 'Adams',
  'address' => 'EH5',
  'email' => 'badams@gmail.com',
  'room_id' => room2.id })

guest3 = Guest.new({
  'title' => 'Mrs',
  'first_name' => 'Clare',
  'surname' => 'Kerr',
  'address' => 'EH4',
  'email' => 'ckerr@gmail.com',
  'room_id' => room3.id })

guest1.save
guest2.save
guest3.save
