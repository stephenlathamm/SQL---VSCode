Select COUNT(job_id) AS job_posted_count,
extract(month from job_posted_date) as month 
From job_postings_fact
WHERE job_title_short = 'Data Analyst'
group by MONTH
ORDER BY job_posted_count DESC;