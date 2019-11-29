require_relative('../models/site')
require_relative('../models/city')
require_relative('../models/country')
require('pry')

country1 = Country.new({'name' => 'Switzerland', 'visited' => true})
country2 = Country.new({'name' => 'France', 'visited' => true})
country3 = Country.new({'name' => 'Venezuela', 'visited' => false})
country4 = Country.new({'name' => 'Australia', 'visited' => true})

city1 = City.new({'name' => 'Geneva', 'visited' => true,
  'country_id' => country1.id})
city2 = City.new({'name' => 'Paris', 'visited' => true,
  'country_id' => country2.id})
city3 = City.new({'name' => 'Sydney', 'visited' => true,
  'country_id' => country4.id})
city4 = City.new({'name' => 'Alice Springs', 'visited' => false,
   'country_id' => country4.id})

site1 = Site.new({'name' => "The United Nations", 'visited' => false,
  'city_id' => city1.id})
site2 = Site.new({'name' => 'Notre Dame Cathedral', 'visited' => true,
  'city_id' => city2.id})
site3 = Site.new({'name' => 'The Catacombs', 'visited' => false,
  'city_id' => city2.id})
site4 = Site.new({'name' => 'Harbour Bridge', 'visited' => true,
  'city_id' => city3.id})

binding.pry

nil
