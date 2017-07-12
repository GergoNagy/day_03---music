require('pry')
require_relative('../db/sql_runner')

class Album
  
  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize(origin)
    @id = origin['id'] if origin['id']
    @title = origin['title']
    @genre = origin['genre']
    @artist_id = origin['artist_id']
  end

  def save
    sql = "INSERT INTO albums
      (title, genre, artist_id)
       VALUES ('#{@title}', '#{@genre}', #{@artist_id}) RETURNING id;"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def self.list_all
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    albums.map {|album| Album.new(album)}
  end

  def edit_album
    sql = "UPDATE albums SET (title, genre, artist_id)
       VALUES ('#{@title}', '#{@genre}', #{@artist_id})"
  end

  def self.delete_all
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end


end