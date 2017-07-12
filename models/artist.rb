require('pry')
require_relative('../db/sql_runner')

class Artist

def initialize(origin)
  @id = origin['id'] if origin['id']
  @name = origin['name']
end

def save
  sql = "INSERT INTO artists(name) VALUES ('#{@name}') RETURNING id;"
  @id = SqlRunner.run(sql)[0]['id'].to_i
end


end