require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('models/country')
require_relative('models/city')
require_relative('models/site')

require_relative('./controllers/cities_controller')
require_relative('./controllers/countries_controller')
require_relative('./controllers/sites_controller')
config.serve_static_files = true


#homepage
get '/' do
  erb(:index)
end
