require 'sinatra/base'

# Chitter class
class Chitter < Sinatra::Base
  get '/' do
    'Chitter Project'
  end

  run! if app_file == $0
end
