require( 'pg' )

class SqlRunner

# connects to database, prepares the sql query and then executes.
# returns result as long as the database exists.

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'df5oskepaevn54', host: 'ec2-35-175-170-131.compute-1.amazonaws.com',
        port: 5432, user: 'myyypmwfmfiiep', password: 'b78a6f1bc6f822b0face57ae6134a476bda21c227108d943a525197e59d91fe3' })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end



#   def self.run( sql, values = [] )
#     begin
#       db = PG.connect({ dbname: 'travelap', host: 'localhost' })
#       db.prepare("query", sql)
#       result = db.exec_prepared( "query", values )
#     ensure
#       db.close() if db != nil
#     end
#     return result
#   end
#
# end
