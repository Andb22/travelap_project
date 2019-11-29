require('Minitest/autorun')
require('Minitest/reporters')
require_relative('../models/site')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class SiteTest < Minitest::Test

# testing that can create a site class and that it can take a name
def test_name_of_site
  site1 = Site.new({
    'name' => 'Harbour Bridge',
    'visited' => true
  })
  assert_equal('Harbour Bridge', site1.name)
end


end
