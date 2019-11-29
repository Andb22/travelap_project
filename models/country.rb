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


end
