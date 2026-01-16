-- Query 1:
SELECT 
    pps.player_name,
    pps.team,
    pps.total_points,
    ROUND((pps.passing_touchdowns * 1.0 / pps.interceptions), 2) AS td_int_ratio
FROM 
    ppr_player_stats_2023 pps
JOIN 
    player_physical_attributes ppa
ON 
    pps.player_id = ppa.player_id
WHERE 
    pps.position = 'QB' 
    AND pps.interceptions > 0
    AND (pps.passing_touchdowns * 1.0 / pps.interceptions) > 2
ORDER BY 
    pps.total_points DESC
LIMIT 10;

-- Query 2:
SELECT 
    cd.player_name,
    cd.team_drafted,
    cd.college,
    cd.year_drafted,
    cd.draft_round
FROM 
    combine_data cd
JOIN 
    ppr_player_stats_2023 pps
ON 
    cd.player_id = pps.player_id
WHERE 
    cd.draft_round = 1 
    AND pps.receiving_touchdowns > 5;

-- Query 3:
SELECT 
    cd.team AS team_name,
    ROUND(AVG(cd.apy), 2) AS average_apy
FROM 
    contract_data cd
WHERE 
    cd.year_signed >= 2020
GROUP BY 
    cd.team
ORDER BY 
    average_apy DESC;
	
-- Query 4:
SELECT 
    cd.player_name,
    ppa.position,
    ppa.team,
    cd.bench AS bench_reps,
    cd.forty,
    cd.vertical,
    cd.broad_jump,
    cd.cone,
    cd.shuttle
FROM 
    combine_data cd
JOIN 
    player_physical_attributes ppa
ON 
    cd.player_id = ppa.player_id
WHERE 
    cd.bench > (SELECT AVG(bench) FROM combine_data)
ORDER BY 
    cd.bench DESC;

-- Query 5:
SELECT 
    pps.team,
    COUNT(pps.player_id) AS player_count
FROM 
    ppr_player_stats_2023 pps
JOIN 
    player_physical_attributes ppa
ON 
    pps.player_id = ppa.player_id
WHERE 
    pps.total_points > 250 
    AND ppa.position != 'QB'
GROUP BY 
    pps.team
ORDER BY 
    player_count DESC;