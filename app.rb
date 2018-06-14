require 'sinatra/base'
require_relative './lib/peep'
require_relative './database_connection_setup'

# Chitter class
class Chitter < Sinatra::Base
  # enable :sessions

  get '/' do
    @peeps = Peep.all
    erb :index
  end
  get '/post' do
    erb :post
  end
  post '/posting' do
    time = DateTime.now
    Peep.add(params[:message], time)
    redirect '/'
  end

  run! if app_file == $0
end
