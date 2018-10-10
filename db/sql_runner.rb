require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'd2lkj2ekg41sfa', host: 'ec2-184-73-197-211.compute-1.amazonaws.com',
      port: 5432, user: 'eoriwgkurmssal', password: '8b850c6dd0b76c78a77e4889b9985f8d019493d13c9df07e68311834323637fd'})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end


end







# *** DONT DELETE AS MAY NEED FOR RUNNING LOCALLY!!!!!! ***

# require('pg')
#
# class SqlRunner
#
#   def self.run(sql, values = [])
#     begin
#       db = PG.connect({dbname: 'luau_backpackers', host: 'localhost'})
#       db.prepare("query", sql)
#       result = db.exec_prepared("query", values)
#     ensure
#       db.close() if db != nil
#     end
#     return result
#   end
#
#
# end
