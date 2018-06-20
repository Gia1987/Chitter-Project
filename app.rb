require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/peep'
require_relative './lib/user'
require_relative './database_connection_setup'

# Chitter class
class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :index
  end
  get '/users' do
    erb :users
  end

  post '/create-user' do
    user = User.create(params[:email], params[:password])
    session[:user_id] = user.id
    redirect '/'
  end
  get '/post' do
    erb :post
  end
  post '/posting' do
    time = DateTime.now
    Peep.add(params[:message], time)
    redirect '/'
  end
  get '/session' do
    erb :session
  end
  post '/new-sessions' do
    user = User.authenticate(params['email'], params['password'])
    if user
      session[:user_id] = user.id
      redirect'/'
    else
      flash[:notice] = 'Please check your email or password.'
      redirect'/session'
    end
  end
  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect'/'
  end

  run! if app_file == $0
end
