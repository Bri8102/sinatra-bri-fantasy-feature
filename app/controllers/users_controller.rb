class UsersController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :'users/new'
        else
            redirect to "/features"
        end
    end
    
    get '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        erb :'users/show'
    end

    post '/signup' do
        @user = User.new(params)
        if @user && @user.save
        session[:user_id] = @user.id
        redirect to "/features/new"
        else  
            redirect to '/signup'
        end
    end
end