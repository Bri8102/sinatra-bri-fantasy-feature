class SessionsController < ApplicationController
    get '/login' do
        if !logged_in?
            erb :"users/login"
        else
            redirect to '/features/new'
        end
    end

    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect to "/features/new"
        else
        redirect to "/signup"
        end
    end

    get '/logout' do
        if logged_in?
          session.destroy
          redirect to '/login'
        else
          redirect to '/'
        end
    end

end