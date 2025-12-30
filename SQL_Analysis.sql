SQL anlysis for Quality NC & CAPA project 

create table quality_nc_capa
             (nc_id varchar (10),
			 nc_date date,
			 nc_category text,
			 severity_score int,
			 risk_score int,
			 capa_status text,
			 capa_days int,
			 overdue text
			 )
1. How many records do we have ?
   
   select count(*) from quality_nc_capa

2. Date range of inspections ?
  
   select min (nc_date) as first_nc,
          max (nc_date) as last_nc 
		  from quality_nc_capa

3. CAPA status distribution (Open/closed) ?

   select capa_status, count(*) as count
   from quality_nc_capa
   group by capa_status

4. Average Risk score

   select round(avg (risk_score),2) as avg_risk_score
   from quality_nc_capa

5. High Risk non-Conformances

   select * 
   from quality_nc_capa
   where risk_score >= 10 

6. Most frequent NC categories
   
   select nc_category,count (*) as Frequency
   from quality_nc_capa
   group by nc_category
   order by frequency Desc

7. Average CAPA days 

   select round(avg (capa_days),2) as avg_capa_days 
   from quality_nc_capa
   where capa_status = 'Closed'
   
8. Late closure by severity

   select severity_score, count(*) as at_risk_count 
   from quality_nc_capa
   where capa_days > 30 
   group by severity_score 
   order by severity_score desc

9. Pareto sytle analysis

  select nc_category,
  count(*) as total_nc,
  round (100.0 * count(*) / sum(count(*)) over(),2 
  )as percentage 
  from quality_nc_capa
  group by nc_category
  order by total_nc Desc

10. Sum of different type of categories

  select nc_category,
  count(*) as count_category, sum(count(*)) over() as total_nc
  from quality_nc_capa
  group by nc_category
  order by count(*) desc


Added SQL analysis for Quality NC & CAPA Project
