/*layoff analysis project*/  -- also  {duplicates handling is covered}
use bondings;
select * from layoffs;

CREATE TABLE `layoffs_dupe` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` double DEFAULT NULL,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


insert into layoffs_dupe
select * from layoffs;
select * from layoffs_dupe;


#lets check for duplicates
select *,
row_number() over (partition by company,location,total_laid_off,
					percentage_laid_off,`date`,stage,country,funds_raised_millions) as `row_num`
from layoffs;		

with duplicates_cte as
(
select *,
row_number() over (partition by company,location,total_laid_off,
					percentage_laid_off,`date`,stage,country,funds_raised_millions) as `row_num`
from layoffs
)
select * from duplicates_cte
where `row_num` >1;

select * from layoffs
where company in("Casper","Cazoo","Hibob","Wildlife Studios","Yahoo")
order by company asc;


/*
This query will throw error.
we cannot able to use (delete or update) along with cte.
so use the query in line (60and further) to delete the duplicates
*/
with duplicates_cte as
(
select *,
row_number() over (partition by company,location,total_laid_off,
					percentage_laid_off,`date`,stage,country,funds_raised_millions) as `row_num`
from layoffs
)
delete from duplicates_cte
where `row_num` >1;



CREATE TABLE `layoffs_dupe2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` double DEFAULT NULL,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` double DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


insert into layoffs_dupe2
select *,
row_number() over (partition by company,location,total_laid_off,
			     percentage_laid_off,`date`,stage,country,funds_raised_millions) as `row_num`
from layoffs;

select * from layoffs_dupe2 where `row_num` >1;

delete from layoffs_dupe2
where `row_num`> 1;

select * from layoffs_dupe2 where `row_num` >1; -- now we successfully removed duplicates 


select distinct company from layoffs_dupe2; -- there are some black spaces use-trim()

select distinct trim(company) from layoffs_dupe2;

update layoffs_dupe2
set company = trim(company);

select distinct company from layoffs_dupe2;

select * from layoffs_dupe2;

select distinct industry from layoffs_dupe2 order by industry asc;

select * from layoffs_dupe2 where industry in('Crypto','CryptoCurrency','Crypto Currency');

update layoffs_dupe2
set
	industry=case
    when industry='Crypto Currency' then 'CryptoCurrency'
    when industry='Crypto' then 'CryptoCurrency'
    else industry
end;

select  distinct industry from layoffs_dupe2 order by industry asc;

select * from layoffs_dupe2;

select total_laid_off
from layoffs_dupe2
where total_laid_off is null;

select percentage_laid_off
from layoffs_dupe2
where percentage_laid_off is null;

set @avg_laid_off = (select avg(total_laid_off) from layoffs_dupe2);
select @avg_laid_off;
set @avg_percentage_laid_off = (select avg(percentage_laid_off) from layoffs_dupe2);
select @avg_percentage_laid_off;

update layoffs_dupe2
set total_laid_off = (select @avg_laid_off)
where total_laid_off is null;

select total_laid_off
from layoffs_dupe2
where total_laid_off is null; -- check all null are replaced

update layoffs_dupe2
set percentage_laid_off = (select @avg_percentage_laid_off)
where percentage_laid_off is null;

select percentage_laid_off
from layoffs_dupe2
where percentage_laid_off is null; -- check all null are replaced

/*---------> lets change data types of date columns from text to date*/

select `date` from layoffs_dupe2; -- '12/16/2022' --> this is not proper date format

select `date`, str_to_date(`date`, '%m/%d/%Y') from layoffs_dupe2;

update layoffs_dupe2
set `date` = str_to_date(`date`,"%m/%d/%Y");

select `date` from layoffs_dupe2;

# change the datatype of date column to {datetime}
alter table layoffs_dupe2
modify column `date` datetime;









