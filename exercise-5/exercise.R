### Exercise 5 ###
library(jsonlite)
library(dplyr)

# Write a function that allows you to specify a movie, then does the following:
  GetReview <- function(movie) {
    movie.no.spaces <-  gsub(" ", "+", movie)
    base.url <- 'https://api.nytimes.com/svc/movies/v2/reviews/search.json?'
    api.key <- '&api-key=0089fb447baf4fcfaa42c3b931aa4e09'
    request <- paste0(base.url, 'query=', movie.no.spaces, api.key)
    results <- fromJSON(request)
    first.review <- flattened[1,]
    headline <- first.review$headline
    summary <- first.review$summary_short
    link <- first.review$link.url
    info <- list(headline=headline, summary=summary, link=link)
    return(info)
  }
  # Replace all of the spaces in your movie title with plus signs (+)
  movie <- 'If I Stay'
  movie.no.spaces <-  gsub(" ", "+", movie)
  
  # Construct a search query using YOUR api key
  # The base URL is https://api.nytimes.com/svc/movies/v2/reviews/search.json?
  # See the interactive console for more detail:https://developer.nytimes.com/movie_reviews_v2.json#/Console/GET/reviews/search.json
  base.url <- 'https://api.nytimes.com/svc/movies/v2/reviews/search.json?'
  api.key <- '&api-key=0089fb447baf4fcfaa42c3b931aa4e09'
  request <- paste0(base.url, 'query=', movie.no.spaces, api.key)
  # Request data using your search query
  results <- fromJSON(request)
  
  # What type of variable does this return?
  
  # Flatten the data stored in the `$results` key of the data returned to you
  flattened <- flatten(results$results)
  
  # From the most recent review, store the headline, short summary, and link to full article each in their own variables
  first.review <- flattened[1,]
  headline <- first.review$headline
  summary <- first.review$summary_short
  link <- first.review$link.url
  
  # Return an list of the three pieces of information from above
  info <- list(headline=headline, summary=summary, link=link)
  

# Test that your function works with a movie of your choice
# > GetReview('If I Stay')
#  $headline
#  [1] "In Limbo, and in Love"
  
#  $summary
#  [1] "“If I Stay” hits the audience with a series of tragedies that ripple out from a car accident on a snowy Oregon road."
#  $link
#  [1] "http://www.nytimes.com/2014/08/22/movies/if-i-stay-weighs-teenagers-prospects-after-horrific-crash.html"
