use bondings;

select * from ipl_data2; 
select distinct team from ipl_data2;

select team, (sum(runs_batter)+sum(runs_extras)+sum(runs_total)) as Total_runs
from ipl_data2
group by team;

select batter, (sum(runs_batter)+sum(runs_extras)+sum(runs_total)) as Total_runs
from ipl_data2
group by batter;

select team,batter, (sum(runs_batter)+sum(runs_extras)+sum(runs_total)) as Total_runs
from ipl_data2
group by team, batter;

select distinct bowler, (sum(runs_batter)+sum(runs_extras)+sum(runs_total)) as total_runs
from ipl_data2
group by bowler;


select batter, (sum(runs_batter)+sum(runs_extras)+sum(runs_total)) as Total_runs
from ipl_data2
where batter='V Kohli';


select batter, max(runs_batter) as max_runs
from ipl_data2
group by batter;


select batter, runs_batter
from ipl_data2
where batter='V Kohli' and runs_batter in(6,4);

select batter, runs_batter
from ipl_data2
where batter='AR Patel' and runs_batter in(6,4);



select batter,runs_batter, count(runs_batter)as runs_count
from ipl_data2
group by batter, runs_batter;

select batter,runs_batter, count(runs_batter)as runs_count
from ipl_data2
group by batter, runs_batter
having runs_batter=6;

select batter,runs_batter, count(runs_batter)as runs_count
from ipl_data2
group by batter, runs_batter
having runs_batter=4;

select team,batter, (sum(runs_batter)+sum(runs_extras)+sum(runs_total)) as Total_runs
from ipl_data2
group by team, batter;


with rank_runs as
(
select team, batter, (sum(runs_batter)+sum(runs_extras)+sum(runs_total)) as Total_runs,
rank() over (partition by team 
				order by sum(runs_batter)+sum(runs_extras)+sum(runs_total) desc) as runs_rank
from ipl_data2
group by team,batter
)
select * from rank_runs;





with rank_runs as
(
select team, batter, (sum(runs_batter)+sum(runs_extras)+sum(runs_total)) as Total_runs,
rank() over (partition by team 
				order by sum(runs_batter)+sum(runs_extras)+sum(runs_total) desc) as runs_rank
from ipl_data2
group by team,batter
)
select * from rank_runs
where runs_rank=1;


with runs_rank as
(
select team, batter, (sum(runs_batter)+sum(runs_extras)+sum(runs_total)) as Total_runs,
rank() over (order by sum(runs_batter)+sum(runs_extras)+sum(runs_total) desc) as runs_rank
from ipl_data2
group by team,batter
)
select * from runs_rank;



with runs_rank as
(
select team, batter, (sum(runs_batter)+sum(runs_extras)+sum(runs_total)) as Total_runs,
rank() over (order by sum(runs_batter)+sum(runs_extras)+sum(runs_total) desc) as runs_rank
from ipl_data2
group by team,batter
)
select * from runs_rank
where runs_rank in(1,2,3,4,5);




select team,overs ,
(sum(runs_batter)+sum(runs_extras)+sum(runs_total)) as Total_runs 
from ipl_data2
group by team,overs
having team='Royal Challengers Bengaluru';

select team,overs ,
(sum(runs_batter)+sum(runs_extras)+sum(runs_total)) as Total_runs 
from ipl_data2
group by team,overs
having team='Delhi Capitals';

select team,overs ,
(sum(runs_batter)+sum(runs_extras)+sum(runs_total)) as Total_runs ,
rank() over (order by sum(runs_batter)+sum(runs_extras)+sum(runs_total) desc) as `rank`
from ipl_data2
group by team,overs;

select team,overs ,
(sum(runs_batter)+sum(runs_extras)+sum(runs_total)) as Total_runs ,
rank() over (order by sum(runs_batter)+sum(runs_extras)+sum(runs_total) desc) as `rank`
from ipl_data2
group by team,overs
having team='Delhi Capitals';

select team,overs ,
(sum(runs_batter)+sum(runs_extras)+sum(runs_total)) as Total_runs ,
dense_rank() over (order by sum(runs_batter)+sum(runs_extras)+sum(runs_total) desc) as `rank`
from ipl_data2
group by team,overs
having team='Delhi Capitals';

select team,batter,overs ,
(sum(runs_batter)+sum(runs_extras)+sum(runs_total)) as Total_runs ,
dense_rank() over (order by sum(runs_batter)+sum(runs_extras)+sum(runs_total) desc) as `rank`
from ipl_data2
group by team,batter,overs
having team='Royal Challengers Bengaluru';

use bondings;
select * from ipl_data2;

UPDATE ipl_data2
SET fielders = TRIM(fielders);

select distinct fielders from ipl_data2;

select replace(fielders,"[","") from ipl_data2;

select replace(replace(fielders,"[",""),"]","") from ipl_data2;


UPDATE ipl_data2
SET fielders = REPLACE(REPLACE(REPLACE(fielders, "[", ""), "]", ""), "'", "");

select distinct fielders from ipl_data2;
select * from ipl_data2;

select fielders,wicket_kind,count(player_out) as `player_count`
from ipl_data2
group by fielders, wicket_kind
order by wicket_kind;


select fielders,wicket_kind,count(player_out) as `player_count`,
rank() over (order by count(player_out) desc) as `rank`,
dense_rank() over (order by count(player_out) desc) as `dense_rank`
from ipl_data2
group by fielders, wicket_kind;


select fielders,wicket_kind,count(player_out) as `player_count`,
rank() over (partition by wicket_kind order by count(player_out) desc) as `rank`,
dense_rank() over (partition by wicket_kind order by count(player_out) desc) as `dense_rank`
from ipl_data2
group by fielders, wicket_kind;


select distinct wicket_kind from ipl_data2;
select team,batter, wicket_kind,bowler ,fielders
from ipl_data2 where wicket_kind in('caught','lbw','bowled') 
order by wicket_kind;


select distinct wicket_kind from ipl_data2;
select team,batter, wicket_kind,bowler ,fielders
from ipl_data2 where wicket_kind in('caught','lbw','bowled') and team = 'Royal Challengers Bengaluru'
order by wicket_kind;





select distinct wicket_kind from ipl_data2;
select team,batter, wicket_kind,bowler ,fielders
from ipl_data2 where wicket_kind in('caught','lbw','bowled') and team = 'Delhi Capitals'
order by wicket_kind;

select distinct wicket_kind from ipl_data2;
select team,batter, wicket_kind,bowler ,fielders,'no fielders'
from ipl_data2 where wicket_kind in('caught','lbw','bowled') and team = 'Royal Challengers Bengaluru'
order by wicket_kind;

select distinct wicket_kind from ipl_data2;
select team,batter,non_striker, wicket_kind,bowler ,ifnull(fielders,'no fielders') as `fielders`
from ipl_data2 where wicket_kind in('caught','lbw','bowled') and team = 'Royal Challengers Bengaluru'
order by wicket_kind;


/*ifnull() will not work 
because there may be some space instead of null*/
select distinct wicket_kind from ipl_data2;
select team,batter,non_striker, wicket_kind,bowler ,ifnull(fielders,'no') as `fielders`
from ipl_data2 where wicket_kind in('caught','lbw','bowled') and team = 'Delhi Capitals'
order by wicket_kind;


/*use ({if} to replace space with 'no fielder')
{else} put the name already in the fielders column*/
SELECT team, batter,non_striker,wicket_kind,bowler,
IF(fielders = '', 'no fielders', fielders) AS fielders
FROM ipl_data2
WHERE wicket_kind IN ('caught', 'lbw', 'bowled')AND team = 'Delhi Capitals'
ORDER BY wicket_kind;

SELECT team, batter,non_striker,wicket_kind,bowler,
IF(fielders = '', 'no fielders', fielders) AS fielders
FROM ipl_data2
WHERE wicket_kind IN ('caught', 'lbw', 'bowled')AND team = 'Royal challengers Bengaluru'
ORDER BY wicket_kind;



