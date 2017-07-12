require('pry-byebug')
require_relative('../db/sql_runner')

class Album

  def initialize(origin)
    @id = origin['id'] if origin['id']
    @name = origin['name']
  end

  def save
    sql = "INSERT INTO"
  end


end