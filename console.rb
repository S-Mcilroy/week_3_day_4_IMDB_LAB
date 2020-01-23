require('pry')
require_relative("models/casting.rb")
require_relative("models/movie.rb")
require_relative("models/star.rb")

Casting.delete_all
Movie.delete_all
Star.delete_all

star1 = Star.new({
  'first_name' => 'Chris',
  'last_name' => 'Evans'
  })

star2 = Star.new({
    'first_name' => 'Robert',
    'last_name' => 'Downey Jr.'
    })

star3 = Star.new({
      'first_name' => 'Samuel',
      'last_name' => 'Jackson'
      })

star1.save()
star2.save()
star3.save()

movie1 = Movie.new({
'title' => 'Knives Out',
'genre' => 'Crime',
'budget' => 100
})

movie2 = Movie.new({
'title' => 'Captain America',
'genre' => 'Action',
'budget' => 100
})

movie3 = Movie.new({
'title' => 'Avengers',
'genre' => 'Action',
'budget' => 100
})

movie4 = Movie.new({
'title' => 'Iron Man',
'genre' => 'Action',
'budget' => 100
})

movie5 = Movie.new({
'title' => 'Dr. Dolittle',
'genre' => 'Family',
'budget' => 100
})

movie6 = Movie.new({
'title' => 'Pulp Fiction',
'genre' => 'Action',
'budget' => 100
})

movie7 = Movie.new({
'title' => 'True Romance',
'genre' => 'Action',
'budget' => 100
})

movie1.save()
movie2.save()
movie3.save()
movie4.save()
movie5.save()
movie6.save()
movie7.save()

casting1 = Casting.new({
  "star_id" => star1.id,
  "movie_id" => movie1.id,
  "fee" => 10
  })

casting2 = Casting.new({
  "star_id" => star1.id,
  "movie_id" => movie2.id,
  "fee" => 10
  })

casting3 = Casting.new({
  "star_id" => star1.id,
  "movie_id" => movie3.id,
  "fee" => 10
  })

casting4 = Casting.new({
  "star_id" => star2.id,
  "movie_id" => movie4.id,
  "fee" => 10
  })

casting5 = Casting.new({
  "star_id" => star2.id,
  "movie_id" => movie5.id,
  "fee" => 10
  })

casting6 = Casting.new({
  "star_id" => star2.id,
  "movie_id" => movie3.id,
  "fee" => 10
  })

casting7 = Casting.new({
  "star_id" => star3.id,
  "movie_id" => movie6.id,
  "fee" => 10
  })

casting8 = Casting.new({
  "star_id" => star3.id,
  "movie_id" => movie7.id,
  "fee" => 10
  })

casting9 = Casting.new({
  "star_id" => star3.id,
  "movie_id" => movie3.id,
  "fee" => 10
  })

casting1.save()
casting2.save()
casting3.save()
casting4.save()
casting5.save()
casting6.save()
casting7.save()
casting8.save()
casting9.save()


binding.pry
nil
