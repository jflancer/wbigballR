% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/all_functions.R
\name{get_team_schedule}
\alias{get_team_schedule}
\title{Team Schedule Scrape}
\usage{
get_team_schedule(
  team.id = NA,
  team.name = NA,
  season = NA,
  use_file = F,
  save_file = F,
  base_path = NA,
  overwrite = F
)
}
\arguments{
\item{team.id}{The unique id given to each college/team for each season. This can be found in the url of the team page.}

\item{team.name}{You must also include a string team name
This inputs a team name, to be used along with season. This needs the school name not the complete team name, so "Duke" not "Duke Blue Devils".}
}
\value{
data frame with each row representing an individual game
\itemize{
\item{Date} - Game date
\item{Home} - Home team
\item{Home_Score} - If the game is finished, the final score for the home team
\item{Away} - Away team
\item{Away_Score} - If the game is finished, the final score for the away team
\item{Game_ID} - If the game is finished and has play-by-play data available, the game ID used to scrape game data
\item{isNeutral} - A logical variable that is true when the game was played at a designated neutral destination
\item{Detail} - Additional detail such as if the game went into OT and # of OTs
}
}
\description{
This function returns a data frame of the schedule for the specified team. This will include game ids used
for play-by-play scraping if the game has ended, along with the team scores and attendance.
}
\examples{
get_team_schedule(team.id = 484200, team.name = "Penn")
}
