require_relative('../db/sql_runner')


class Country

  attr_reader :id
  attr_accessor :name, :visited

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @visited = details['visited']
  end

  #create
  def save()
    sql = 'INSERT INTO countries(
    name, visited
  )
  VALUES (
    $1, $2
  )
  RETURNING id'
  values = [@name, @visited]
  result = SqlRunner.run(sql, values)
  @id = result.first()['id'].to_i
  end

  #show all
  def self.all()
    sql = "Select * FROM countries"
    results = SqlRunner.run(sql)
    return results.map{|result| Country.new(result)}
  end

  #delete
  def delete()
    sql = "DELETE from countries WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM countries
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  #update
  def update()
    sql = "UPDATE countries SET(
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
    sql = "SELECT DISTINCT name, id FROM countries WHERE (visited) = true;"
    results = SqlRunner.run(sql)
    return results.map{|result| Country.new(result)}
  end

  def self.show_notvisited()
    sql = "SELECT DISTINCT name, id FROM countries WHERE (visited) = false;"
    results = SqlRunner.run(sql)
    return results.map{|result| Country.new(result)}
  end

  def self.find(id)
    sql = "SELECT * FROM countries WHERE id = $1;"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Country.new( results.first )
  end

  #select all cities that have a particular country id
  def cities()
    sql = "SELECT cities.* FROM cities WHERE country_id = $1;"
    values = [@id]
    city_list = SqlRunner.run(sql, values)
    return city_list.map{|city| City.new(city)}
  end

  def self.search(name)
    sql = "SELECT * FROM countries WHERE name LIKE CONCAT( '%',$1::VARCHAR,'%');"
    values = [name]
    country_match = SqlRunner.run(sql, values)
    if(country_match.first)
    return Country.new(country_match.first)
    else
    return nil
    end
  end
end
