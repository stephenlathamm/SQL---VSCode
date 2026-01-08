/* what are the top skills based on salary? 
- looking at the average salary associated with each skill 
- identify most financially rewarding skills to have
- deviated from video to filter for BA roles that are non remote and in the United States
- highest 20 paying skills
*/




SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Business Analyst' AND job_work_from_home = 'FALSE' AND salary_year_avg IS NOT NULL
AND job_country = 'United States'
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 20

/* airflow,spark,hadoop,c,numpy,pandas,jquery,ruby,gdpr,phoenix,
julia,php,nosql,kafka,electron,linux,tensorflow,pytorch,c++,java */