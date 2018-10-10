require('sinatra')
# require('sinatra/contrib/all')
require('sinatra/contrib/all') if development?
require_relative('../models/room')
# also_reload('../models/*')


#here put you Rest routes
