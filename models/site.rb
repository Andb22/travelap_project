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

def delete()
  sql = "DELETE from sites WHERE id = $1;"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.delete_by_id(id)
  sql = "DELETE FROM sites
  WHERE id = $1"
  values = [id]
  SqlRunner.run(sql, values)
end

#update
def update()
  sql = "UPDATE sites SET(
  name, visited
  ) = (
    $1, $2
  )
  WHERE id = $3"
  values = [@name, @visited, @id]
  SqlRunner.run(sql, values)
end

# show visited and not visited
def self.show_visited()
  sql = "SELECT * FROM sites WHERE (visited) = true"
  results = SqlRunner.run(sql)
  return results.map{|result| Site.new(result)}
end

def self.show_notvisited()
  sql = "SELECT * FROM sites WHERE (visited) = false"
  results = SqlRunner.run(sql)
  return results.map{|result| Site.new(result)}
end

def self.find(id)
  sql = "SELECT * FROM sites WHERE id = $1;"
  values = [id]
  results = SqlRunner.run( sql, values )
  return Site.new( results.first )
end

end
