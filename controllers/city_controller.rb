require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/city.rb' )
also_reload( '../models/*' )

get '/cities' do
  @cities = City.all()
  erb ( :"cities/cities_index" )
end

get '/cities/visited' do
  @visited_cities = City.show_visited()
  erb ( :"cities/visited_index" )
end

get '/cities/not_visited' do
   @not_visited_cities = City.show_notvisited()
  erb ( :"cities/notvisited_index" )
end

get '/cities/new_city' do
  erb(:"cities/new_city")
end

post '/cities' do
  City.new(params).save
  erb(:"/cities/city_added")
end
