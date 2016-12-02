ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './app/models/data_mapper_setup.rb'
require 'pry'
require 'sinatra/flash'

class Bookmark_manager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    if current_user
      flash.discard
      @default_email = current_user.email
    end
    erb(:sign_up)
  end

  post '/' do
    user = User.new(params)
    if user.valid?
      user.save
      session['id'] = user.id
      redirect '/links'
    end
    flash[:error] = 'Password and confirmation do not match'
    redirect '/'
  end

  helpers do
    def current_user
      User.get(session['id'])
    end
  end

  get '/links/new' do
    erb(:'links/new')
  end

  get '/links' do
    @links = Link.all
    user = current_user
    @email = user ? user.email : ""
    erb(:'links/index')
  end

  post '/links' do
    link = Link.new(:title => params[:title], :url => params[:url])
    params[:tags].split(" ").each {|tag|
      link.tags << Tag.first_or_create(:tag => tag )
    }
    link.save
    redirect '/links'
  end

  get '/tags/:tag' do
    tag = Tag.all(:tag =>(params[:tag]))
    @filter_links = tag.links
    erb(:'links/link_filter')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
