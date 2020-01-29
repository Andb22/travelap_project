require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative( '../models/country.rb' )


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
  @country = Country.new(params)
  @found = Country.find_name(params['name'])
  erb(:"countries/country_added")
end

post '/countries_search' do
  @country = Country.search(params['name'])
  erb(:"countries/country_search")
end


get '/countries/visited/:id' do
  @country = Country.find(params['id'].to_i)
  erb(:"/countries/city_show")
end

get '/countries/visited/:id/edit' do
    @country = Country.find(params['id'].to_i)
  erb(:"countries/country_edit")
end

post '/countries/visited/:id' do
  country = Country.new(params)
  country.update
  @country = country
  erb (:"countries/country_edited")
end

post '/countries/visited/:id/delete' do
  country = Country.find(params['id'])
  country.delete()
  erb (:"countries/country_deleted")
end



get '/countries/not_visited/:id' do
  @country = Country.find(params['id'].to_i)
  erb(:"/countries/city_notvisited_show")
end

get '/countries/not_visited/:id/edit' do
    @country = Country.find(params['id'].to_i)
  erb(:"countries/country_edit")
end

post '/countries/not_visited/:id' do
  country = Country.new(params)
  country.update
  @country = country
  erb (:"countries/country_edited")
end

post '/countries/not_visited/:id/delete' do
  country = Country.find(params['id'])
  country.delete()
  erb (:"countries/country_deleted")
end

get '/countries/city_show/:id' do
  @country = Country.find(params['id'].to_i)
  erb(:"/cities/new_city")
end

get '/countries/city_notvisited_show/:id' do
  @country = Country.find(params['id'].to_i)
  erb(:"/cities/new_notvisited_city")
end
