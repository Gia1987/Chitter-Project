require 'sinatra/base'

# Chitter class
class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @message = session[:message]
    erb :index
  end
  get '/post' do
    erb :post
  end
  post '/posting' do
    session[:message] = params[:message]
    redirect '/'
  end

  run! if app_file == $0
end
