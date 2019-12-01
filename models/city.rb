require_relative('../db/sql_runner')
require_relative('country')
require_relative('site')

class City

  attr_reader :id
  attr_accessor :name, :visited, :country_id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @visited = details['visited']
    @country_id = details['country_id'].to_i
  end

  #create
  def save()
    sql = "INSERT INTO cities(
    name, visited, country_id
    )
    VALUES (
      $1, $2, $3
      )
      RETURNING id"
    values = [@name, @visited, @country_id]
    result = SqlRunner.run(sql, values)
    @id = result.first()['id'].to_i
  end

  #show all
  def self.all()
    sql = "Select * FROM cities"
    results = SqlRunner.run(sql)
    return results.map{|result| City.new(result)}
  end

  #delete
  def self.delete_by_id(id)
    sql = "DELETE FROM cities
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  #update
  def update()
    sql = "UPDATE cities SET(
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
    sql = "SELECT DISTINCT name FROM cities WHERE (visited) = true"
    results = SqlRunner.run(sql)
    return results.map{|result| City.new(result)}
  end

  def self.show_not_visited()
    sql = "SELECT DISTINCT name FROM cities WHERE (visited) = false"
    results = SqlRunner.run(sql)
    return results.map{|result| City.new(result)}
  end

end
