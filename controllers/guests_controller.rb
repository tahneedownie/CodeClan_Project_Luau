require('sinatra')
# require('sinatra/contrib/all')
require('sinatra/contrib/all') if development?
require_relative('../models/guest')
require_relative('../models/room')
# also_reload('../models/*')


get '/guests' do
  @guests = Guest.all
  erb(:"guests/index")
end
# TEST PASSED

get '/guests/new' do
  @rooms = Room.all
  erb(:"guests/new")
end
# TEST PASSED

post '/guests' do
  Guest.new(params).save
  redirect to '/guests'
end
# TEST PASSED

get '/guests/:id' do
  @guest = Guest.find(params['id'])
  erb(:"guests/show")
end
# TEST PASSED

get '/guests/:id/edit' do
  @rooms = Room.all
  @guest = Guest.find(params['id'])
  erb(:"guests/edit")
end
# TEST PASSED

post '/guests/:id' do
  guest = Guest.new(params)
  guest.update
  redirect to "/guests/#{params['id']}"
end
# TEST PASSED

post '/guests/:id/delete' do
  guest = Guest.find(params['id'])
  guest.delete
  redirect to '/guests'
end
# TEST PASSED





# RAN TESTS ON ALL METHODS IN GUESTS_CONTROLLER
