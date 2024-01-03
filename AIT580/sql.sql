create database AIT580;
use AIT580;

	
select * from ev;

SELECT county, COUNT(*) AS countcounty
FROM ev
GROUP BY county;

SELECT make, model, COUNT(*) AS count_by_make_model
FROM ev
GROUP BY make, model;
