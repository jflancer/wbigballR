# load("data/teamids.RData")
# 
# ## Change conferences ################
# 
# 
# 
# ## Get IDs ################
# library(rvest)
# 
# url_vec <- c(
#   "https://stats.ncaa.org/season_divisions/17763/scoreboards?utf8=%E2%9C%93&season_division_id=&game_date=11%2F09%2F2021&conference_id=0&tournament_id=&commit=Submit",
#   "https://stats.ncaa.org/season_divisions/17763/scoreboards?utf8=%E2%9C%93&season_division_id=&game_date=11%2F10%2F2021&conference_id=0&tournament_id=&commit=Submit",
#   "https://stats.ncaa.org/season_divisions/17763/scoreboards?utf8=%E2%9C%93&season_division_id=&game_date=11%2F11%2F2021&conference_id=0&tournament_id=&commit=Submit",
#   "https://stats.ncaa.org/season_divisions/17763/scoreboards?utf8=%E2%9C%93&season_division_id=&game_date=11%2F12%2F2021&conference_id=0&tournament_id=&commit=Submit",
#   "https://stats.ncaa.org/season_divisions/17763/scoreboards?utf8=%E2%9C%93&season_division_id=&game_date=11%2F13%2F2021&conference_id=0&tournament_id=&commit=Submit",
#   "https://stats.ncaa.org/season_divisions/17763/scoreboards?utf8=%E2%9C%93&season_division_id=&game_date=11%2F14%2F2021&conference_id=0&tournament_id=&commit=Submit",
#   "https://stats.ncaa.org/season_divisions/17763/scoreboards?utf8=%E2%9C%93&season_division_id=&game_date=11%2F15%2F2021&conference_id=0&tournament_id=&commit=Submit",
#   "https://stats.ncaa.org/season_divisions/17763/scoreboards?utf8=%E2%9C%93&season_division_id=&game_date=11%2F16%2F2021&conference_id=0&tournament_id=&commit=Submit",
#   "https://stats.ncaa.org/season_divisions/17763/scoreboards?utf8=%E2%9C%93&season_division_id=&game_date=11%2F17%2F2021&conference_id=0&tournament_id=&commit=Submit"
#   # "https://stats.ncaa.org/season_divisions/17783/scoreboards?utf8=%E2%9C%93&season_division_id=&game_date=11%2F18%2F2021&conference_id=0&tournament_id=&commit=Submit",
#   # "https://stats.ncaa.org/season_divisions/17783/scoreboards?utf8=%E2%9C%93&season_division_id=&game_date=11%2F19%2F2021&conference_id=0&tournament_id=&commit=Submit",
#   # "https://stats.ncaa.org/season_divisions/17783/scoreboards?utf8=%E2%9C%93&season_division_id=&game_date=11%2F20%2F2021&conference_id=0&tournament_id=&commit=Submit",
#   # "https://stats.ncaa.org/season_divisions/17783/scoreboards?utf8=%E2%9C%93&season_division_id=&game_date=11%2F21%2F2021&conference_id=0&tournament_id=&commit=Submit",
#   # "https://stats.ncaa.org/season_divisions/17783/scoreboards?utf8=%E2%9C%93&season_division_id=&game_date=11%2F22%2F2021&conference_id=0&tournament_id=&commit=Submit",
#   # "https://stats.ncaa.org/season_divisions/17783/scoreboards?utf8=%E2%9C%93&season_division_id=&game_date=11%2F23%2F2021&conference_id=0&tournament_id=&commit=Submit",
#   # "https://stats.ncaa.org/season_divisions/17783/scoreboards?utf8=%E2%9C%93&season_division_id=&game_date=11%2F24%2F2021&conference_id=0&tournament_id=&commit=Submit",
#   # "https://stats.ncaa.org/season_divisions/17783/scoreboards?utf8=%E2%9C%93&season_division_id=&game_date=11%2F25%2F2021&conference_id=0&tournament_id=&commit=Submit",
#   # "https://stats.ncaa.org/season_divisions/17783/scoreboards?utf8=%E2%9C%93&season_division_id=&game_date=11%2F26%2F2021&conference_id=0&tournament_id=&commit=Submit",
#   # "https://stats.ncaa.org/season_divisions/17783/scoreboards?utf8=%E2%9C%93&season_division_id=&game_date=11%2F27%2F2021&conference_id=0&tournament_id=&commit=Submit",
#   # "https://stats.ncaa.org/season_divisions/17783/scoreboards?utf8=%E2%9C%93&season_division_id=&game_date=11%2F28%2F2021&conference_id=0&tournament_id=&commit=Submit",
#   # "https://stats.ncaa.org/season_divisions/17783/scoreboards?utf8=%E2%9C%93&season_division_id=&game_date=11%2F29%2F2021&conference_id=0&tournament_id=&commit=Submit",
#   # "https://stats.ncaa.org/season_divisions/17783/scoreboards?utf8=%E2%9C%93&season_division_id=&game_date=11%2F30%2F2021&conference_id=0&tournament_id=&commit=Submit"
# )
# url <- "https://stats.ncaa.org/season_divisions/17763/scoreboards?utf8=%E2%9C%93&season_division_id=&game_date=11%2F09%2F2021&conference_id=0&tournament_id=&commit=Submit"
# 
# 
# get_team_ids_date <- function(url) {
#   print(url)
#   webpage <- url %>% read_html()
# 
#   p_teams <- webpage %>% html_elements("a") %>%
#     # html_attr("href")
#     html_text()
# 
#   p_href <- webpage %>% html_elements("a") %>%
#     html_attr("href") %>%
#     str_replace("/teams/", "")
#   # html_text()
# 
#   team_id_df <- tibble(
#     team = p_teams,
#     id = p_href
#   ) %>% filter(!(str_detect(id, "\\/")))
# 
#   team_id_df
# 
# }
# 
# team_id_df_all <- url_vec %>% map_dfr(get_team_ids_date)
# 
# team_id_df_all
# 
# team_id_df_all$team <- team_id_df_all$team %>%
#   str_replace("^ +", "") %>%
#   str_replace(" \\([0-9]-[0-9]\\)", "")
# 
# 
# team_id_df <- team_id_df_all %>%
#   distinct()
# 
# teamids_last_season <- teamids %>%
#   filter(Season == "2020-21")
# 
# 
# team_id_df_clean <- team_id_df %>%
#   distinct() %>%
#   filter(team %in% teamids_last_season$Team) %>%
#   arrange(team)
# 
# team_id_df_clean
# 
# current_season_team_ids <- team_id_df_clean %>%
#   rename(
#     Team = team,
#     ID = id
#   ) %>%
#   mutate(
#     ID = team_id_df_clean$id %>% as.double()
#   ) %>% left_join(teamids_last_season %>% select(Team, Conference)) %>%
#   mutate(
#     Season = "2021-22"
#   )
# 
# missing_teams_df <- teamids_last_season[!(teamids_last_season$Team %in% team_id_df_clean$team),]
# 
# # missing_team_ids <- missing_teams_df %>%
# #   mutate(
# #     ID = c(527495, 527682, 527674, 527730, 527628, 527657, 527476),
# #     Season = "2021-22"
# #   )
# 
# new_team_ids <- tibble(
#   Team = "St. Thomas (MN)",
#   ID = 529315,
#   Conference = "Summit League",
#   Season = "2021-22"
# )
# 
# 
# all_new_teamids <- bind_rows(
#   current_season_team_ids,
#   # missing_team_ids,
#   new_team_ids
# ) %>% arrange(Team)
# 
# all_new_teamids
# 
# 
# ## Change conferences ################
# 
# all_new_teamids$Team
# all_new_teamids$Conference %>% unique() %>% sort()
# 
# p <- "Central Ark."
# all_new_teamids$Conference[all_new_teamids$Team == p]
# all_new_teamids$Conference[all_new_teamids$Team == p] <- "ASUN"
# 
# p <- "Eastern Ky."
# all_new_teamids$Conference[all_new_teamids$Team == p]
# all_new_teamids$Conference[all_new_teamids$Team == p] <- "ASUN"
# 
# p <- "Jacksonville St."
# all_new_teamids$Conference[all_new_teamids$Team == p]
# all_new_teamids$Conference[all_new_teamids$Team == p] <- "ASUN"
# 
# p <- "N.C. A&T"
# all_new_teamids$Conference[all_new_teamids$Team == p]
# all_new_teamids$Conference[all_new_teamids$Team == p] <- "Big South"
# 
# p <- "Bethune-Cookman"
# all_new_teamids$Conference[all_new_teamids$Team == p]
# all_new_teamids$Conference[all_new_teamids$Team == p] <- "SWAC"
# 
# p <- "Florida A&M"
# all_new_teamids$Conference[all_new_teamids$Team == p]
# all_new_teamids$Conference[all_new_teamids$Team == p] <- "SWAC"
# 
# p <- "Abilene Christian"
# all_new_teamids$Conference[all_new_teamids$Team == p]
# all_new_teamids$Conference[all_new_teamids$Team == p] <- "WAC"
# 
# p <- "Lamar University"
# all_new_teamids$Conference[all_new_teamids$Team == p]
# all_new_teamids$Conference[all_new_teamids$Team == p] <- "WAC"
# 
# p <- "Sam Houston St."
# all_new_teamids$Conference[all_new_teamids$Team == p]
# all_new_teamids$Conference[all_new_teamids$Team == p] <- "WAC"
# 
# p <- "SFA"
# all_new_teamids$Conference[all_new_teamids$Team == p]
# all_new_teamids$Conference[all_new_teamids$Team == p] <- "WAC"
# 
# # all_new_teamids <- readRDS("all_new_teamids.RDS")
# all_new_teamids %<>% select(Team, Conference, ID, Season)
# saveRDS(all_new_teamids, file = "all_new_teamids.RDS")
# 
# 
# ## Test ################
# 
# library(wbigballR)
# library(tidyverse); options(tibble.width = Inf)
# library(magrittr)
# theme_set(hrbrthemes::theme_ipsum_pub())
# theme_update(
# plot.title = element_text(hjust = 0.5),
# axis.title.x = element_text(hjust = 0.5),
# axis.title.y = element_text(hjust = 0.5))
# 
# 
# load("data/teamids.RData")
# all_new_teamids <- readRDS("all_new_teamids.RDS")
# teamids <- bind_rows(
#   teamids,
#   all_new_teamids
# )
# teamids
# 
# teamids %<>% arrange(Season) %>% 
#   distinct()
# 
# save(teamids, file = "data/teamids.RData")
# 
# source("R/all_functions.R")
# d <- get_date_games(date = "11/03/2021")
# d <- get_date_games(date = "12/10/2020")
# # d <- get_date_games(date = "12/09/2020")
# 
# # wbigballR::get_date_games(date = "11/10/2021")
# 
# d
# 
# get_box_scores(1994550)
# get_play_by_play(5155656)
# 
# teamids
# 
# get_team_schedule(team.name = "Abilene Christian", season = "2021-22")
# 
# 
# 
# 
