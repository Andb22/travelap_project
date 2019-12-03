require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/city' )
require_relative( '../models/country' )
also_reload( '../models/*' )

# get '/cities' do
#   @cities = City.all()
#   erb ( :"cities/cities_index" )
# end

get '/cities/visited' do
  @visited_cities = City.show_visited()
  erb ( :"cities/visited_index" )
end

get '/cities/not_visited' do
   @not_visited_cities = City.show_notvisited()
  erb ( :"cities/notvisited_index" )
end

get '/cities/new_city/:id' do
  @country = Country.find(params['id'].to_i)
  erb(:"cities/new_city")
end

get '/cities/:id/edit' do
    @city = City.find(params['id'].to_i)
  erb(:"cities/city_edit")
end

post '/cities' do
  @city = City.new(params)
  @city.save
  erb(:"/cities/city_added")
end

post '/cities/:id/edit' do
  city = City.new(params)
  city.update
  @city = city
  erb (:"cities/city_edited")
end

post '/cities/:id/delete' do
  city = City.find(params['id'])
  city.delete()
  erb (:"cities/city_deleted")
end

get '/cities/:id/edit_site' do
  @city = City.find(params['id'].to_i)
  erb(:"/cities/sites_show")
end
