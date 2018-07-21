require_relative('../models/guest')
require_relative('../models/room')

room1 = Room.new({'room_name' => 'frangipani'})
room2 = Room.new({'room_name' => 'paradise'})
room3 = Room.new({'room_name' => 'hibiscus'})

room1.save
room2.save
room3.save
