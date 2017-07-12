require('pry')
require_relative('../models/album')
require_relative('../models/artist')

Artist.delete_all
Album.delete_all

artist1 = Artist.new({'name' =>'Greg'})
artist1.save

album1 = Album.new({'title' => 'LALA', 'genre' => 'metal', 'artist_id' => artist1.id})
album2 = Album.new({'title' => 'PAPA', 'genre' => 'rock', 'artist_id' => artist1.id})
album1.save
album2.save

Artist.list_all
Album.list_all

artist1.albums_from_artist

# album1.edit_album


binding.pry
nil