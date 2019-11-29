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

end
