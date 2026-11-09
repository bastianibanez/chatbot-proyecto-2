:- encoding(utf8).
% =============================================================
% ARCHIVO GENERADO por scripts/csv_a_prolog.py. NO EDITAR A MANO.
% Fuente: Fjelstul World Cup Database v1.2.0, (c) 2023 Joshua C.
% Fjelstul, Ph.D., CC-BY-SA 4.0. Ver data/raw/FUENTE.md.
% =============================================================
:- ensure_loaded(tournaments).
:- ensure_loaded(confederations).
:- ensure_loaded(teams).
:- ensure_loaded(players).
:- ensure_loaded(managers).
:- ensure_loaded(referees).
:- ensure_loaded(stadiums).
:- ensure_loaded(matches).
:- ensure_loaded(awards).
:- ensure_loaded(qualified_teams).
:- ensure_loaded(squads).
:- ensure_loaded(manager_appointments).
:- ensure_loaded(referee_appointments).
:- ensure_loaded(team_appearances).
:- ensure_loaded(player_appearances).
:- ensure_loaded(manager_appearances).
:- ensure_loaded(referee_appearances).
:- ensure_loaded(goals).
:- ensure_loaded(penalty_kicks).
:- ensure_loaded(bookings).
:- ensure_loaded(substitutions).
:- ensure_loaded(host_countries).
:- ensure_loaded(tournament_stages).
:- ensure_loaded(groups).
:- ensure_loaded(group_standings).
:- ensure_loaded(tournament_standings).
:- ensure_loaded(award_winners).

:- dynamic(tabla_dataset/3).
tabla_dataset(tournaments, [key_id,tournament_id,tournament_name,year,start_date,end_date,host_country,winner,host_won,count_teams,group_stage,second_group_stage,final_round,round_of_16,quarter_finals,semi_finals,third_place_match,final], 30).
tabla_dataset(confederations, [key_id,confederation_id,confederation_name,confederation_code,confederation_wikipedia_link], 6).
tabla_dataset(teams, [key_id,team_id,team_name,team_code,mens_team,womens_team,federation_name,region_name,confederation_id,confederation_name,confederation_code,mens_team_wikipedia_link,womens_team_wikipedia_link,federation_wikipedia_link], 88).
tabla_dataset(players, [key_id,player_id,family_name,given_name,birth_date,female,goal_keeper,defender,midfielder,forward,count_tournaments,list_tournaments,player_wikipedia_link], 10401).
tabla_dataset(managers, [key_id,manager_id,family_name,given_name,female,country_name,manager_wikipedia_link], 475).
tabla_dataset(referees, [key_id,referee_id,family_name,given_name,female,country_name,confederation_id,confederation_name,confederation_code,referee_wikipedia_link], 493).
tabla_dataset(stadiums, [key_id,stadium_id,stadium_name,city_name,country_name,stadium_capacity,stadium_wikipedia_link,city_wikipedia_link], 240).
tabla_dataset(matches, [key_id,tournament_id,tournament_name,match_id,match_name,stage_name,group_name,group_stage,knockout_stage,replayed,replay,match_date,match_time,stadium_id,stadium_name,city_name,country_name,home_team_id,home_team_name,home_team_code,away_team_id,away_team_name,away_team_code,score,home_team_score,away_team_score,home_team_score_margin,away_team_score_margin,extra_time,penalty_shootout,score_penalties,home_team_score_penalties,away_team_score_penalties,result,home_team_win,away_team_win,draw], 1248).
tabla_dataset(awards, [key_id,award_id,award_name,award_description,year_introduced], 8).
tabla_dataset(qualified_teams, [key_id,tournament_id,tournament_name,team_id,team_name,team_code,count_matches,performance], 625).
tabla_dataset(squads, [key_id,tournament_id,tournament_name,team_id,team_name,team_code,player_id,family_name,given_name,shirt_number,position_name,position_code], 13843).
tabla_dataset(manager_appointments, [key_id,tournament_id,tournament_name,team_id,team_name,team_code,manager_id,family_name,given_name,country_name], 637).
tabla_dataset(referee_appointments, [key_id,tournament_id,tournament_name,referee_id,family_name,given_name,country_name,confederation_id,confederation_name,confederation_code], 668).
tabla_dataset(team_appearances, [key_id,tournament_id,tournament_name,match_id,match_name,stage_name,group_name,group_stage,knockout_stage,replayed,replay,match_date,match_time,stadium_id,stadium_name,city_name,country_name,team_id,team_name,team_code,opponent_id,opponent_name,opponent_code,home_team,away_team,goals_for,goals_against,goal_differential,extra_time,penalty_shootout,penalties_for,penalties_against,result,win,lose,draw], 2496).
tabla_dataset(player_appearances, [key_id,tournament_id,tournament_name,match_id,match_name,match_date,stage_name,group_name,team_id,team_name,team_code,home_team,away_team,player_id,family_name,given_name,shirt_number,position_name,position_code,starter,substitute], 27432).
tabla_dataset(manager_appearances, [key_id,tournament_id,tournament_name,match_id,match_name,match_date,stage_name,group_name,team_id,team_name,team_code,home_team,away_team,manager_id,family_name,given_name,country_name], 2538).
tabla_dataset(referee_appearances, [key_id,tournament_id,tournament_name,match_id,match_name,match_date,stage_name,group_name,referee_id,family_name,given_name,country_name,confederation_id,confederation_name,confederation_code], 1248).
tabla_dataset(goals, [key_id,goal_id,tournament_id,tournament_name,match_id,match_name,match_date,stage_name,group_name,team_id,team_name,team_code,home_team,away_team,player_id,family_name,given_name,shirt_number,player_team_id,player_team_name,player_team_code,minute_label,minute_regulation,minute_stoppage,match_period,own_goal,penalty], 3637).
tabla_dataset(penalty_kicks, [key_id,penalty_kick_id,tournament_id,tournament_name,match_id,match_name,match_date,stage_name,group_name,team_id,team_name,team_code,home_team,away_team,player_id,family_name,given_name,shirt_number,converted], 396).
tabla_dataset(bookings, [key_id,booking_id,tournament_id,tournament_name,match_id,match_name,match_date,stage_name,group_name,team_id,team_name,team_code,home_team,away_team,player_id,family_name,given_name,shirt_number,minute_label,minute_regulation,minute_stoppage,match_period,yellow_card,red_card,second_yellow_card,sending_off], 3178).
tabla_dataset(substitutions, [key_id,substitution_id,tournament_id,tournament_name,match_id,match_name,match_date,stage_name,group_name,team_id,team_name,team_code,home_team,away_team,player_id,family_name,given_name,shirt_number,minute_label,minute_regulation,minute_stoppage,match_period,going_off,coming_on], 10222).
tabla_dataset(host_countries, [key_id,tournament_id,tournament_name,team_id,team_name,team_code,performance], 31).
tabla_dataset(tournament_stages, [key_id,tournament_id,tournament_name,stage_number,stage_name,group_stage,knockout_stage,unbalanced_groups,start_date,end_date,count_matches,count_teams,count_scheduled,count_replays,count_playoffs,count_walkovers], 155).
tabla_dataset(groups, [key_id,tournament_id,tournament_name,stage_number,stage_name,group_name,count_teams], 159).
tabla_dataset(group_standings, [key_id,tournament_id,tournament_name,stage_number,stage_name,group_name,position,team_id,team_name,team_code,played,wins,draws,losses,goals_for,goals_against,goal_difference,points,advanced], 626).
tabla_dataset(tournament_standings, [key_id,tournament_id,tournament_name,position,team_id,team_name,team_code], 120).
tabla_dataset(award_winners, [key_id,tournament_id,tournament_name,award_id,award_name,shared,player_id,family_name,given_name,team_id,team_name,team_code], 200).
