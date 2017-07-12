require('pry')
require_relative('../db/sql_runner')

class Artist
  attr_accessor :name
  attr_reader :id

def initialize(origin)
  @id = origin['id'] if origin['id']
  @name = origin['name']
end

def save
  sql = "INSERT INTO artists(name) VALUES ('#{@name}') RETURNING id;"
  @id = SqlRunner.run(sql)[0]['id'].to_i
end

def self.list_all
  sql = "SELECT * FROM artists;"
  artists = SqlRunner.run(sql)
  artists.map {|artist| Artist.new(artist)}
end

  def albums_from_artist
    sql = "SELECT * FROM albums WHERE artist_id = #{id}"
    albums = SqlRunner.run(sql)
    albums.map {|album| Album.new(album)}
  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end




end