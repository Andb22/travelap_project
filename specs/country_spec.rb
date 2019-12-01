require('Minitest/autorun')
require('Minitest/reporters')
require_relative('../models/country')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class CountryTest < Minitest::Test

# testing that can create a country class and that it can tke a name
def test_name_of_country
  country1 = Country.new({
    'name' => 'Australia',
    'visited' => true
  })
  assert_equal('Australia', country1.name)
end

def test_list_of_not_visited_countries
  country1 = Country.new({
    'name' => 'Australia',
    'visited' => true
  })
  country2 = Country.new({
    'name' => 'Australia',
    'visited' => true
  })
  country3 = Country.new({
    'name' => 'Japan',
    'visited' => true
  })
  country_list = Country.show_notvisited
  assert_equal(2, country_list.length)
end


end
