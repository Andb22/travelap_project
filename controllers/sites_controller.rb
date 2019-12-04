require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/city' )
require_relative( '../models/site' )
also_reload( '../models/*' )


get '/sites/new_site/:id' do
  @city = City.find(params['id'].to_i)
  erb(:"sites/new_site")
end

get '/sites/new_notvisited_site/:id' do
  @city = City.find(params['id'].to_i)
  erb(:"sites/new_notvisited_site")
end

get '/sites/:id/edit' do
    @site = Site.find(params['id'].to_i)
  erb(:"sites/site_edit")
end

post '/sites' do
  @site = Site.new(params)
  @site.save
  erb(:"/sites/site_added")
end

post '/sites/:id/edit' do
  site = Site.new(params)
  site.update
  @site = site
  erb (:"sites/site_edited")
end

post '/sites/:id/delete' do
  site = Site.find(params['id'])
  site.delete()
  erb (:"sites/site_deleted")
end

post '/sites/:id/photo' do
  site = Site.find(params['id'])
  site.photo()
  erb (:"sites/photo")
end
