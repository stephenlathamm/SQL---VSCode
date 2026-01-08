/* What are the most optimal skills to learn? 
- What skills are both highly in demand and highly paid? 
*/



-- query 3 copy and pasted at line 9 and making it into a CTE, then editing the queries inside
WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills,
        COUNT (skills_job_dim.job_id) as demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Business Analyst' AND job_work_from_home = 'FALSE' AND salary_year_avg IS NOT NULL
        AND job_country = 'United States'
    GROUP BY skills_dim.skill_id
)

-- query 4 copy and pasted at line 24 and making it into a CTE, then editing the queries inside  

, avg_salary_of_skills AS (
    SELECT
        skills_dim.skill_id,
        skills,
        ROUND(AVG(salary_year_avg),0) as avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Business Analyst' AND job_work_from_home = 'FALSE' AND salary_year_avg IS NOT NULL
    AND job_country = 'United States'
    GROUP BY skills_dim.skill_id
)

SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM    
    skills_demand
INNER JOIN  
    avg_salary_of_skills ON 
    skills_demand.skill_id = avg_salary_of_skills.skill_id
WHERE 
    demand_count > 15
ORDER BY
    avg_salary DESC, demand_count DESC
LIMIT 25

/* Setting 15 as the minimum count threshold is subjective and meant to filter out high paying skills that may
be obscure; rarely desired. Setting the threshold higher returns skills that have higher demand */

-- snowflake, go, azure, r, python, sas, tableau, sql, oracle, flow, powerbi, sap, excel