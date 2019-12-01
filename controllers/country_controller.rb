require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/country.rb' )
also_reload( '../models/*' )

get '/countries' do
  @countries = Country.all()
  erb ( :"countries/countries_index" )
end


get '/countries/visited' do
  @visited_countries = Country.show_visited()
  erb ( :"countries/visited_index" )
end

get '/countries/not_visited' do
   @notvisited_countries = Country.show_notvisited()
  erb ( :"countries/notvisited_index" )
end

get '/countries/new_country' do
  erb(:"countries/new_country")
end

post '/countries' do
  Country.new(params).save
  erb(:"countries/country_added")
end


get '/countries/visited/:id' do
  @country = Country.find(params['id'].to_i)
  erb(:"/countries/city_show")
end
