require('Minitest/autorun')
require('Minitest/reporters')
require_relative('../models/city')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class CityTest < Minitest::Test

# testing that can create a city class and that it can tke a name
def test_name_of_city
  city1 = City.new({
    'name' => 'Sydney',
    'visited' => true
  })
  assert_equal('Sydney', city1.name)
end


end
