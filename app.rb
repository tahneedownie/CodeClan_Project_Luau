require( 'sinatra' )
# require( 'sinatra/contrib/all' )
require('sinatra/contrib/all') if development?
require_relative('controllers/guests_controller')
require_relative('controllers/rooms_controller')

get '/' do
  erb( :index )
end
