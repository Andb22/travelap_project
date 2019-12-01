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
    sql = "SELECT DISTINCT name FROM countries WHERE (visited) = true"
    results = SqlRunner.run(sql)
    return results.map{|result| Country.new(result)}
  end

  def self.show_not_visited()
    sql = "SELECT DISTINCT name FROM countries WHERE (visited) = false"
    results = SqlRunner.run(sql)
    return results.map{|result| Country.new(result)}
  end

end
