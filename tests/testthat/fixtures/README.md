# scrape_game fixtures

Raw `https://stats.ncaa.org/contests/{game_id}/play_by_play` pages, byte-for-byte
as served (legacy contest ids). Captured 2026-08-14 by the sportsdataverse
`ncaa-wbb-hoops-raw` capture run (sdv-py `NcaaFetcher`, residential Chrome
transport, which clears the Akamai bm-verify challenge); copied from that run's
fetch cache on 2026-10-09 because direct `curl` against stats.ncaa.org now
answers 403.

| File | Game | Date | Period model |
|---|---|---|---|
| `pbp_396707_2015_halves.html` | Winthrop 52, Campbell 62 | 2015-02-02 | two 20:00 halves, regulation (line score `1 2 S`) |
| `pbp_391747_2015_halves_1ot.html` | Virginia Tech 54, Clemson 63 | 2015-01-02 | two halves + one 5:00 OT (`1 2 3 S`) |
| `pbp_315567_2016_quarters.html` | Rice 55, LSU 66 | 2016-11-16 | four 10:00 quarters, regulation (`1 2 3 4 S`) |

Used by `test-scrape_game.R` through `scrape_game(use_file = TRUE)`.
