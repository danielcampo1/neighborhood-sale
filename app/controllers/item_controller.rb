class ItemController < ApplicationController


    #create
    get '/items/new' do 
        erb :"/items/new"
    end



    post '/items' do

        if @item = Item.new(name: params[:name],
            price: params[:price],
            description: params[:description])
        
            @item.user = User.find(session[:user_id])
                @item.save

                redirect "/items/#{@item.id}"
            else 
            redirect :"/items"
        end
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
        if @item.user == current_user
            erb :'/items/show'
        else 
            redirect :'/items/notyours'
        end
    end



    #update

    get '/items/:id/edit' do
        @item = Item.find(params[:id])
            if @item.user == current_user
                erb :'/items/edit'
            else 
                redirect :'/items'
            end
        end


    patch '/items/:id' do
        @item = Item.find(params[:id])
        @user = @item.user
        if current_user && logged_in? 
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
        if current_user
            @item.delete

            redirect to '/items'
        else
            redirect "/items/not-yours"
        end 
    end




end
