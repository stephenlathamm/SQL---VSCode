-- January jobs
CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- February jobs
CREATE TABLE february_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March jobs
CREATE TABLE march_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT job_posted_date FROM march_jobs;


SELECT 
    COUNT(job_id) AS number_of_jobs,
CASE 
    WHEN job_location = 'Anywhere' THEN 'remote'
    WHEN job_location = 'New York, NY' THEN 'local'
    ELSE 'onsite'
END AS location_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY location_category;