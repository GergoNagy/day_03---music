require('pry')
require_relative('../models/album')
require_relative('../models/artist')

Artist.delete_all
Album.delete_all

artist1 = Artist.new({'name' =>'Greg'})
artist2 = Artist.new({'name' =>'Fred'})
artist1.save
artist2.save


album1 = Album.new({'title' => 'LALA', 'genre' => 'metal', 'artist_id' => artist1.id})
album2 = Album.new({'title' => 'PAPA', 'genre' => 'rock', 'artist_id' => artist1.id})
album1.save
album2.save

Artist.list_all
Album.list_all

artist1.albums_from_artist
p album1.show_artist_if_has_album

album2.delete_album
artist1.delete_artist




binding.pry
nil