class UserController < ApplicationController

    get '/user/welcome' do
        erb :'user/welcome'
    end

    get '/user/signup' do 
        erb :'/user/signup'
    end

    post '/user' do
         if   User.create(username: params[:username], password: params[:password], neighborhood: params[:neighborhood]).valid?
            redirect to '/user/signin'
         else
            redirect to '/user/signup-failure'
        end
    end

    get '/user/signup-failure' do
        erb :'/user/signupfailure'
    end


    get '/user/signin' do
        erb :'/user/signin'
    end

    post '/user/signin' do
          @user = User.find_by(username:params[:username])
          if @user && @user.authenticate(params[:password])
              session[:user_id] = @user.id
        redirect to "/user/#{@user.id}"
        else
            redirect to '/user/failure'
        end
    end

    get '/user/failure' do
        erb :'/user/failure'
    end

    get '/user/:id' do
        @user = User.find(params[:id])
        erb :'/user/show'
    end

    post '/user/:id/signout' do
        session.clear
        redirect '/user/welcome'
    end

    get '/user/:id/items' do
        @user = User.find(params[:id])
        
        if session[:user_id] == @user.id
            erb :"/user/allitems"
        else
            "no bueno senor!"
        end
        
    end
    






    
end