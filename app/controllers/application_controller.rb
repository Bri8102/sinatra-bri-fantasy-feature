require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "featureworld"
  end

  get '/' do
    erb :welcome
  end


  helpers do
    def logged_in?
      #checks if session is set to user-ID
      !!session[:user_id]
    end

    def current_user
      #If current user is null, set it their session to user_id otherwise keep the current value
      @user ||= User.find_by(id: session[:user_id])
    end
  end

end
