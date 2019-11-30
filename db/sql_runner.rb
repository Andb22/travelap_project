require( 'pg' )

class SqlRunner

# connects to database, prepares the sql query and then executes.
# returns result as long as the database exists.

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'travelap', host: 'localhost' })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end