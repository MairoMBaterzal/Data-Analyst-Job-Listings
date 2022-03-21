

-- Data Analyst Jobs Listings scraped from Glassdoor


SELECT 
	   [F1]
      ,[Job Title]
      ,[Salary Estimate]
      ,[Job Description]
      ,[Rating]
--      ,[Company Name]
	  ,LEFT([Company Name], CHARINDEX('.', [Company Name])-2) AS Company_Name
      ,[Location]
      ,[Headquarters]
      ,[Size]
      ,[Founded]
      ,[Type of ownership]
      ,[Industry]
      ,[Sector]
      ,[Revenue]
--      ,[Competitors]
--      ,[Easy Apply]
  FROM [JobFinder].[dbo].[DataAnalyst$]
  ORDER BY F1
--  WHERE RATING <= 0


-- Select Data for Analysis

SELECT *
FROM [JobFinder].[dbo].[DataAnalyst$]
WHERE [Industry] = 'Unknown'

-- Delete Data Errors
DELETE 
  FROM JobFinder..DataAnalyst$
  WHERE Rating = -1;


-- Replacing incorrect words from [Company Name]
  Begin Transaction
	UPDATE [DataAnalyst$] SET [Company Name] = REPLACE([Company Name], 'In', 'Inc');
	UPDATE [DataAnalyst$] SET [Company Name] = REPLACE([Company Name], 'Incc', 'Inc');
   UPDATE [DataAnalyst$] SET [Company Name] = REPLACE([Company Name], 'Incc.', 'Inc');
  