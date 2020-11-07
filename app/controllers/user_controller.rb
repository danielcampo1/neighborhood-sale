class UserController < ApplicationController

    get '/user/welcome' do
        erb :'user/welcome'
    end

    get '/user/signup' do 
        erb :'/user/signup'
    end

    post '/user/signup' do
         if   User.create(username: params[:username], password: params[:password], neighborhood: params[:neighborhood]).valid?
            redirect to '/user/signin'
         else
            redirect to '/user/failure'
        end
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




    
end