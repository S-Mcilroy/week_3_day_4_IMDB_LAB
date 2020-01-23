require_relative("../db/sql_runner.rb")

class Movie

  attr_reader :id
  attr_accessor :title, :genre, :budget

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @genre = options["genre"]
    @budget = options["budget"].to_i
  end

  def save()
    sql = "INSERT INTO movies (title, genre, budget)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@title, @genre, @budget]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.delete_all
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * from movies"
    result = SqlRunner.run(sql)
    return result.map{|movie| Movie.new(movie)}
  end

  def update()
    sql = "UPDATE castings SET (title, genre, budget) = ($1, $2, $3)
    WHERE id = $4"
    values = [@title, @genre, @budget, @id]
    SqlRunner.run(sql, values)
  end

  def stars()
    sql = "SELECT stars.* FROM stars INNER JOIN castings
          ON stars.id = castings.star_id WHERE castings.movie_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map{|star| Star.new(star)} if result.any?
    return nil
  end

  def remaining_budget()
    cost = 0
    sql = "SELECT castings.fee FROM castings WHERE castings.movie_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    for charge in results
      cost += charge["fee"].to_i
    end
    return remaining = @budget - cost
  end

end
