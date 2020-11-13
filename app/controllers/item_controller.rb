class ItemController < ApplicationController

    #create
    get '/items/new' do 
        erb :"/items/new"
    end

    post '/items' do

        @item = Item.create(name: params[:name],
             price: params[:price],
             description: params[:description])
    
             @item.user = User.find(session[:user_id])
            @item.save

            redirect "/items/#{@item.id}"
    end

    get '/items/not-yours' do
        erb :"items/notyours"
    end
    
    #read

    get '/items' do
        @items = Item.all

        erb :'/items/display'
    
    end

    get '/items/:id' do
        @item = Item.find(params[:id])
       
        erb :'/items/show'
    end


    #update

    get '/items/:id/edit' do
        @item = Item.find(params[:id])
    erb :'/items/edit'
    end

    patch '/items/:id' do
        @item = Item.find(params[:id])
        @user = @item.user
        if session[:user_id] == @user.id
        @item.update( 
            name: params[:name],
            price: params[:price],
            description: params[:description]
            )

        redirect "/items/#{@item.id}"
        else
            redirect "/items/not-yours"
        end

    end

    #delete

    delete '/items/:id' do
        @item = Item.find(params[:id])
        @user = @item.user
        if session[:user_id] == @user.id
            @item.delete

            redirect to '/items'
        else
            redirect "/items/not-yours"
        end 
    end




end
