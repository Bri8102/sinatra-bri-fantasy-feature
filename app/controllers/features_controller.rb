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
            # binding.pry
             if @feature.save
                # binding.pry
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
        @feature = Feature.find(params[:id])
        @features = Feature.where("user_id=#{session[:user_id]}").map {|f| f}
        erb :"features/show"
        else
            redirect to '/login'
        end
    end

    get '/features/user/:id' do
        @features = Feature.where("user_id=#{params[:id]}").map {|f| f}
        erb :'features/show'
    end



    get '/features/:id/edit' do
        if logged_in?
            @features = Feature.where("user_id=#{session[:user_id]}").map {|f| f}
            
            # @feature = Feature.find_by_id(params[:id])
            # if @feature != "" && @feature.user == current_user

             erb :"features/edit"
            # else
            #     redirect to "/features"
            
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
        @feature.update(song: params[:song], artist1: params[:artist1], artist2: params[:artist2])
        redirect to "/features/#{params[:id]}"
            end
            else
                redirect to "/login"
            end
        end


    delete '/features/:id/delete' do
        if logged_in?
            # binding.pry
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