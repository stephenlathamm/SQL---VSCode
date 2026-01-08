/* what are the most in-demand skills for Business Analysts? (not just the top 10 highest paying roles)
- join job postings to inner join table similar to query 2
- identify the top 5 in-demand skills for a BA
- Focus on all job postings 
- Deviatied from video to find top 8 skills, filtering for non-remote roles
*/





SELECT 
    skills,
    COUNT (skills_job_dim.job_id) as demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Business Analyst' AND job_work_from_home = 'FALSE'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 8

-- excel, sql, powerbi, tableau, python, powerpoint, r, sap