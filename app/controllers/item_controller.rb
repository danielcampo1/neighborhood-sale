class ItemController < ApplicationController

    #create
    get '/item/new' do
        erb :'/item/new'
    end

    post '/item/new' do
        @item = Item.create(name: params[:name],
             price: params[:price],
             description: params[:description])
    
            redirect to "/item/#{@item.id}"
    end
    
    #read

    get '/item/:id' do
        @item = Item.find(params[:id])
        erb :'/item/show'
    end

    get '/item' do
        @items = Item.all
        erb :'/item/display'
    end


    #update

    get '/item/:id/edit' do
        @item = Item.find(params[:id])
    erb :'/item/edit'
    end

    patch '/item/:id/edit' do
    end



    #delete
end
