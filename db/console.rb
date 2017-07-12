require('pry')
require_relative('../models/album')
require_relative('../models/artist')

artist1 = Artist.new({'name' =>'Greg'})
artist1.save

album1 = Album.new({'title' => 'LALA', 'genre' => 'metal', 'artist_id' => artist1.id})
album1.save

Artist.list_all
Album.list_all


binding.pry
nil