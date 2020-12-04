require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  get '/icecreams' do
    @icecreams = IceCream.all
    erb :"icecreams/index"
  end

  get '/icecreams/new' do
    @icecream = IceCream.new
    erb :"icecreams/new"
  end

  post '/icecreams' do
    @icecream = IceCream.new(params[:icecream])
    if !@icecream.save
      # puts @icecream.errors.full_messages.join(". ")
      # binding.pry
      erb :'icecreams/new'
    else 
      redirect "/icecreams/#{@icecream.id}"
    end
    
  end

  get '/icecreams/:id' do
    set_icecream
    erb :"icecreams/show"
  end

  private

  def set_icecream
      @icecream = IceCream.find_by(id: params[:id])
      if !@icecream
        redirect '/icecreams'
      end
  end

end
