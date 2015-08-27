require 'sinatra'
require 'sinatra/base'
require 'sinatra/assetpack'
require 'sinatra/content_for'
require 'slim'
require 'coffee-script'
require 'sass'

module BackboneStudy
  class App < Sinatra::Base
    configure do
      register Sinatra::AssetPack
      helpers Sinatra::ContentFor
      set :public_folder, File.dirname(__FILE__) + '/public'
    end

    configure :development do
      require 'sinatra/reloader'
      register Sinatra::Reloader
    end

    get '/' do
      slim :index
    end

    # js and css
    assets do
      serve '/js', :from => 'assets/coffee'
      js :application, [
        '/js/*.js'
      ]

      serve '/css', :from => 'assets/sass'
      css :applicatin, [
        '/css/*.css'
      ]

      js_compression :jsmin
      css_compression :sass
    end
  end
end
