select 
    game_id,
    competition_id,
    date,
    season,
    round,
    home_club_id,
    away_club_id,
    home_club_name,
    away_club_name,
    home_club_goals,
    away_club_goals,
    home_club_manager_name,
    away_club_manager_name,
    stadium, 
    attendance,
    referee,
    competition_type
from 
    {{ source('staging', 'games') }}
where competition_id in (
    select competition_id from {{ ref('stg_competitions') }}
)
and
    home_club_id in (
        select club_id from {{ ref('stg_clubs') }}
    )
and
    away_club_id in (
        select club_id from {{ ref('stg_clubs') }}
    )