require_relative('../db/sql_runner')
require_relative('country')
require_relative('city')


class Site

  attr_reader :id, :city_id
  attr_accessor :name, :visited

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @visited = details['visited']
    @city_id = details['city_id'].to_i
  end

#create
def save()
  sql = "INSERT INTO sites(
  name, visited, city_id
  )
  VALUES (
    $1, $2, $3
    )
    RETURNING id"
  values = [@name, @visited, @city_id]
  result = SqlRunner.run(sql, values)
  @id = result.first()['id'].to_i
end

#show all
def self.all()
  sql = "Select * FROM sites"
  results = SqlRunner.run(sql)
  return results.map{|result| Site.new(result)}
end

#delete
def self.delete_by_id(id)
  sql = "DELETE FROM sites
  WHERE id = $1"
  values = [id]
  SqlRunner.run(sql, values)
end

end
