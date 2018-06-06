require 'sinatra/base'
require_relative './lib/peep'
require_relative './database_connection_setup'

# Chitter class
class Chitter < Sinatra::Base
  # enable :sessions

  get '/' do
    @peeps = Peep.all.reverse
    erb :index
  end
  get '/post' do
    erb :post
  end
  post '/posting' do
    Peep.add(params[:message])
    redirect '/'
  end

  run! if app_file == $0
end
