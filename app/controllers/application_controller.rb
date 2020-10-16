require './config/environment'

class ApplicationController < Sinatra::Base
 #contains all my application logic

  configure do
    set :public_folder, 'public' #specifies the directory where static files should be served from
    set :views, 'app/views' #specifies the directory where view templates are located
    enable :sessions
    set :session_secret, "featureworld" #session secret is a key used for signing and/or encrypting cookies set by the application to maintain session state
  end

  get '/' do
    @landing_page = "Landing Page"
    erb :welcome
  end


  helpers do
    def logged_in?
      #checks if session is set to user-ID i.e if user is logged in returns true if so 
      !!session[:user_id]
    end

    def current_user
      #If current user is null, set it their session to user_id otherwise keep the current value
      @user ||= User.find_by(id: session[:user_id])
    end
  end

end
