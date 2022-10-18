-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 

select * from campaign 

select backers_count,
	cf_id	
from campaign
where outcome = 'live'
order by backers_count desc;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

select count(backer_id) as backers_count ,cf_id
from backers
group by cf_id
order by backers_count desc;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 



select goal - pledged as Remaining_amount
from campaign
where outcome = 'live'


select b.first_name, b.last_name, b.email, c1.goal - c1.pledged as Remaining_amount
into email_contacts_remaining_goal_amount
from 
campaign as c1
left JOIN
contacts as b
on c1.contact_id = b.contact_id
where c1.outcome = 'live'
order by Remaining_amount desc




drop table email_contacts_remaining_goal_amount
-- Check the table

select * from email_contacts_remaining_goal_amount
-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

drop table email_backers_remaining_goal_amount

select b.email, b.first_name, b.last_name, c1.cf_id, c1.company_name, c1.description, c1.end_date, c1.goal - c1.pledged as left_of_goal
into email_backers_remaining_goal_amount
from 
backers as b
left join 
campaign as c1

on c1.cf_id = b.cf_id
where outcome = 'live'
order by b.last_name asc

select * from email_backers_remaining_goal_amount
