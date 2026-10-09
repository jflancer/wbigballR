# Offline: scrape_game(use_file = TRUE) reads the committed stats.ncaa.org pages
# under fixtures/ (see fixtures/README.md). The women's game moved from two
# 20:00 halves to four 10:00 quarters in 2015-16; stats.ncaa.org serves one
# table per period either way, so the period model must be read from the page
# (rules/wbb.yaml#wbb-2016-four-quarters, #wbb-2016-ncaa-stats-period-tables).

stage_fixture <- function(game_id, file) {
  base <- paste0(tempfile("wbigballR_"), "/")
  dir.create(paste0(base, "play_by_play"), recursive = TRUE, showWarnings = FALSE)
  file.copy(test_path("fixtures", file), paste0(base, "play_by_play/", game_id, ".html"))
  base
}

scrape_fixture <- function(game_id, file) {
  base <- stage_fixture(game_id, file)
  suppressWarnings(suppressMessages(scrape_game(game_id, use_file = TRUE, base_path = base)))
}

test_that("a 2014-15 regulation game parses as two 20:00 halves", {
  g <- scrape_fixture("396707", "pbp_396707_2015_halves.html")
  expect_equal(nrow(g), 413)
  expect_equal(sort(unique(g$Half_Status)), c(1, 2))
  expect_true(all(g$Game_Seconds[g$Half_Status == 1] <= 1200))
  expect_true(all(g$Game_Seconds[g$Half_Status == 2] >= 1200))
  expect_lte(max(g$Game_Seconds), 2400)
  # first logged event: 19:48 of the first half -> 12 s elapsed
  expect_equal(g$Game_Seconds[1], 12)
})

test_that("a 2014-15 overtime game keeps the halves model and adds one 5:00 period", {
  g <- scrape_fixture("391747", "pbp_391747_2015_halves_1ot.html")
  expect_equal(nrow(g), 484)
  expect_equal(sort(unique(g$Half_Status)), c(1, 2, 3))
  expect_true(all(g$Game_Seconds[g$Half_Status == 3] >= 2400))
  expect_lte(max(g$Game_Seconds), 2700)
})

test_that("a 2015-16+ regulation game parses as four 10:00 quarters, not halves + 2 OT", {
  g <- scrape_fixture("315567", "pbp_315567_2016_quarters.html")
  expect_equal(nrow(g), 426)
  expect_equal(sort(unique(g$Half_Status)), c(1, 2, 3, 4))
  for (p in 1:4) {
    expect_true(all(g$Game_Seconds[g$Half_Status == p] >= 600 * (p - 1)))
    expect_true(all(g$Game_Seconds[g$Half_Status == p] <= 600 * p))
  }
  # the halves model put quarters 3 and 4 after 2400 s as overtimes (max 2970)
  expect_lte(max(g$Game_Seconds), 2400)
})
