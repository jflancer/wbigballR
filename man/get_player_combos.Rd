% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_player_combos.R
\name{get_player_combos}
\alias{get_player_combos}
\title{Functiont o get player combos}
\usage{
get_player_combos(
  Lineup_Data = NA,
  n = 2,
  min_mins = 0,
  Included = NA,
  Excluded = NA,
  include_transition = F
)
}
\arguments{
\item{Lineup_Data}{data frame made up of lineups collected from the get_lineups() function}

\item{n}{an integer between 1-5 specifying player combinations}

\item{min_mins}{a filter value to remove combinations below a minutes threshold. Using this beforehand greatly speeds up computation time.}

\item{Included}{character vector of players. These players will be on the court for every lineup considered.}

\item{Excluded}{character vector of players. These players will be off the court for every lineup considered.}
}
\value{
data frame with each row representing a player combination. Explanations of statistics found in get_lineups()
}
\description{
Pass in lineup data and get team stats when a specified grouping of players are on the court together.
This can work for any 1-5 player combinations. It also takes in the functions Included/Excluded, to filter
when certain players are on the court together. Recommended to filter lineups by team before calling this function rather than after.
}
