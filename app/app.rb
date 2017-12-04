ENV['RACK_ENV'] ||= 'development'

require 'bcrypt'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'dm_setup'

class Stack < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb(:index)
  end

  post '/' do
    user = User.authenticate(params[:email], params[:password])
    session[:user_id] = user.id
    if user
      session[:user_id] = user.id
      redirect '/posts'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      redirect '/'
    end
  end

  delete '/user' do
    session[:user_id] = nil
    redirect to '/'
  end

  get '/posts' do
    @posts = Post.all
    erb(:posts)
  end

  post '/posts' do
    Post.create(maker: current_user.username, body: params[:new_post],
                user_id: current_user.id)
    redirect '/posts'
  end

  get '/signup' do
    erb(:signup)

  end

  post '/signup' do
    user = User.create(name: params[:name],
                    email: params[:email],
                    username: params[:username],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    if user.id.nil?
      flash.now[:notice] = user.errors
      erb(:signup)
    else
      session[:user_id] = user.id
      redirect '/posts'
    end
  end

# Check if works without it
# run! if app_file == $0
end
