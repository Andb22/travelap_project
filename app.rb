require('sinatra')
require('sinatra/contrib/all')
require_relative('models/country')
require_relative('models/city')
require_relative('models/site')
also_reload('./models/*')

require_relative('./controllers/cities_controller')
require_relative('./controllers/countries_controller')
require_relative('./controllers/sites_controller')

#homepage
get '/' do
  erb(:index)
end
