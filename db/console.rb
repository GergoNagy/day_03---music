require('pry')
require_relative('../models/album')
require_relative('../models/artist')

artist1 = Artist.new({'name' =>'Greg'})

artist1.save

Artist.list_all


binding.pry
nil