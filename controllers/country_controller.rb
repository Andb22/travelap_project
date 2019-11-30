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
  @not_visited_countries = Country.show_not_visited()
  erb ( :"countries/not_visited_index" )
end

get '/countries/new_country' do
  erb(:"countries/new_country")
end

post '/countries' do
  Country.new(params).save
  erb(:"/countries/country_added")
end
