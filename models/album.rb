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

  def delete_album
    sql = "DELETE FROM albums WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def show_artist_if_has_album
    sql = "SELECT * FROM artists WHERE id = #{artist_id}"
    album = SqlRunner.run(sql)[0]["name"]
  end

  # def self.find_album(id)
  #   sql = "SELECT * FROM albums WHERE id = #{@id}"
  #   SqlRunner.run(sql)
  #   albums = result.first
  #   album = Album.new(albums)
  #   return album 
  # end


end