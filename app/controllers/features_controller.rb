class FeaturesController < ApplicationController
    
    get '/features' do
        if logged_in?
            @features = Feature.all 
        erb :"features/index"
        else  
            redirect to "/login"
        end
    end

    get '/features/new' do
        if logged_in?
        erb :"features/new"
        else  
            redirect to '/login'
        end
    end

    post '/features' do
        if logged_in?
            if params[:song] == ""
                redirect to "features/new"
            else
                if @feature = Feature.find_by(user_id: session[:user_id], song: params[:song])
                    redirect to "/features/#{@feature.id}"
                else
                 @feature = Feature.create(song: params[:song],artist1: params[:artist1], artist2: params[:artist2], user_id: session[:user_id])
             if @feature.save
                redirect to "/features/#{@feature.id}"
             else
                redirect to "/features"
             end
            end
        end
       else
        redirect to '/login'
    end
end

    get '/features/:id' do
        if logged_in?
        # @feature = Feature.find(params[:id])
        @features = current_user.features
        erb :"users/show"
        else
            redirect to '/login'
        end
    end

    get '/features/:id/edit' do
        if logged_in?
            @feature = Feature.find_by_id(params[:id]) 
             erb :"features/edit"    
        else
            redirect to "/login"
        end
    end

    patch '/features/:id' do
        if logged_in?
            if params[:song] == ""
                redirect to "/features/#{params[:id]}/edit"
            else
        @feature = Feature.find_by_id(params[:id]) 
            if  @feature && @feature.user == current_user
        @feature.update(song: params[:song], artist1: params[:artist1], artist2: params[:artist2])
        redirect to "/features/#{params[:id]}"
            else
                redirect to "/features"
            end
        end
            else
                redirect to "/login"
            end
        end


    delete '/features/:id/delete' do
        if logged_in?
            @feature = Feature.find_by_id(params[:id])
            if @feature && @feature.user == current_user
            @feature.delete
            end
                redirect to "/features"
        else
            redirect to "/login"
        end
    end
end