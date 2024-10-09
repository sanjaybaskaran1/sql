/* insurance data analysis*/
use bondings;
drop table ipl_data;

select * from insurance_data;
desc insurance_data;


/*1) find count of male and female*/
select sex, count(sex) as gender_count
from insurance_data
group by sex;


/*2) find avg bmi in male and female*/
select sex, round(avg(bmi),2) as average_bmi
from insurance_data
group by sex;


/* 3) find max bmi in male and female*/
select sex, round(max(bmi),2) as average_bmi
from insurance_data
group by sex;


/* 4) find max bmi in male and female*/
select sex, round(min(bmi),2) as average_bmi
from insurance_data
group by sex;

/* 5) find total number of smokers*/
select count(smoker) as smokers
from insurance_data
where smoker='yes';

/* 6) find average insurance claimed by (smokers vs non-smokers)*/
select smoker, round(avg(charges), 2) as avg_charges
from insurance_data
group by smoker;

/* 7) find average insurance claimed by (smokers vs non-smokers)
in both male and female*/
select sex, smoker, round(avg(charges),2) as avg_charges
from insurance_data
group by sex, smoker
order by sex asc, smoker desc;

/* 8) find unique regions*/
select distinct region from insurance_data;

/* 9) find the rank based on charges
the higest charge get rank-1 and the rank increments;
*/
select *,
rank() over (order by charges desc) as `rank`
from insurance_data;


/* 10) find the top 5 rank based on charges
the higest charge get rank-1 and the rank increments;
*/
with charges_rank as
(
select *,
rank() over (order by charges desc) as `rank`
from insurance_data
)
select * from charges_rank
where `rank` in(1,2,3,4,5);


/* 11) select unique childrens */
select distinct children from insurance_data;


/* 12) find the total insurance claimed based on no of childrens*/
select children, round(sum(charges),2) as Total_charges
from insurance_data
group by children
order by Total_charges  desc;

