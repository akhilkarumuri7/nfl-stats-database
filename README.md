# NFL Stats Database (SQL)
A relational database project centered on the NFL 2023 season, built from real player and team datasets to support fantasy football and football performance analysis. The database organizes player statistics, physical attributes, combine metrics, contract information, and team details, enabling meaningful insights through advanced SQL querying. This project was completed as a team final project for INST123 (University of Maryland, College Park).

## Project Goals
- Collect and organize real NFL player + team data into a structured relational database
- Design tables with appropriate primary keys and foreign keys
- Support analysis through joins, filtering, aggregation, and subqueries
- Enable practical use cases such as fantasy football research, comparisons, and data-driven discussions

## Database Overview
This database includes five main tables: combine_data (draft + combine metrics), contract_data (contract values, length, APY, guaranteed money), player_physical_attributes (player roster and physical info), ppr_player_stats_2023 (2023 offensive stats + fantasy points), and team_info (team metadata such as division, conference, stadium info, head coach, and cap space). Primary keys were built around a unique player_id for player tables and team abbreviation values for team-level data.

## Files in This Repository
- team_02_nfl_backup.sql — full SQL database backup containing tables and data
- team_02_nfl_queries.sql — SQL queries written for analysis and deliverables
- team_02_nfl_report.pdf — full project report (design decisions, data sources, query explanations, lessons learned)

## Example Queries Included
- Top 10 quarterbacks by total fantasy points with TD/INT ratio > 2
- Players drafted in the 1st round with more than 5 receiving touchdowns
- Average APY of contracts by team (players signed from 2020 onward)
- Players with bench reps above the league average, including combine metrics
- Count of non-QB players per team with more than 250 total fantasy points

## How to Use (PostgreSQL)
1) Create a database: `createdb nfl_db`  
2) Restore the backup: `psql -d nfl_db -f team_02_nfl_backup.sql`  
3) Run queries inside psql: `\i team_02_nfl_queries.sql`

## Data Sources
This database was built using real NFL datasets collected and cross-referenced from multiple sources including GitHub NFL datasets, SportsDataIO, OverTheCap, Pro Football Reference, and ESPN. Full citations are included in the project report PDF.

## Team
Team 2 — INST123 Final Project: Ryan Combs, Akhil Karumuri, Connor Criss, Eric Liu
