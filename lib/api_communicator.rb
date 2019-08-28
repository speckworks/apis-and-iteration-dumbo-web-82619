require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  # binding.pry
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string).to_h
  films_data = response_hash["results"].find do |result|
     result["name"].downcase == character_name
    #  binding.pry
      end
      movie = []
    films_data["films"].each do |film|  
      movie << JSON.parse(RestClient.get(film))
       end
    movie
end
# get_character_movies_from_api("Luke Skywalker")

# iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film


  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film


  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.


def print_movies(movie)
  movie.each do |movie| 
     puts movie["title"]
    #  binding.pry
  end
  # some iteration magic and puts out the movies in a nice list
end



## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
