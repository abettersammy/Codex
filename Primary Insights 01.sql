USE codex;

SELECT *
FROM fact_survey_responses
LIMIT 5;

SELECT *
FROM fact_survey_responses 
WHERE Consume_frequency = 'Rarely'
;

SELECT 
    D.gender,
    COUNT(*) AS total_responses
FROM dim_repondents AS D
JOIN fact_survey_responses AS F
ON D.Respondent_ID = F.Response_ID
WHERE F.Heard_before = 'Yes'
GROUP BY r.gender;

-- DEMOGRAPHIC INSIGHTS 

-- Who prefers energy drinks more?
SELECT 
	D.gender, 	
    COUNT(*) AS total_responses
FROM fact_survey_responses AS F
JOIN dim_repondents AS D
ON F.Respondent_ID = D.Respondent_ID
WHERE Heard_before = 'Yes'
GROUP BY D.gender;


-- Which age group prefers energy drink more?
SELECT 
	D.Age, 
    COUNT(*) AS total_responses
FROM fact_survey_responses AS F
JOIN dim_repondents AS D
ON F.Respondent_ID= D.Respondent_ID
WHERE F.Heard_before = 'Yes'
GROUP BY D.Age
ORDER BY total_responses DESC;

-- What type of marketing reached the youth (15 - 30)
SELECT
    F.Marketing_channels,
    COUNT(*) AS total_responses
FROM fact_survey_responses AS F
JOIN dim_repondents AS D
ON F.Respondent_ID = D.Respondent_ID
WHERE D.Age BETWEEN 15 AND 30
GROUP BY F.Marketing_channels
ORDER BY total_responses DESC;


-- CONSUMER PREFERENCE

-- What are the preferred ingridients of the soft drinks
SELECT 
	Ingredients_expected,
    COUNT(*) AS total_responses
FROM fact_survey_responses
GROUP BY Ingredients_expected
ORDER BY total_responses DESC;

-- What packaging difference do respondents prefer 
SELECT 
	Packaging_preference,
    COUNT(*) AS total_responses
FROM fact_survey_responses
GROUP BY Packaging_preference
ORDER BY total_responses DESC;

-- COMPETETION ANALYSIS

-- Who are the current market leaders?
SELECT 
	Current_brands,
    COUNT(*) AS total_responses
FROM fact_survey_responses
GROUP BY Current_brands
ORDER BY total_responses DESC;

-- Primary reasons for choosing other brand over ours 
SELECT 
	Reasons_for_choosing_brands,
    COUNT(*) AS total_responses
FROM fact_survey_responses
GROUP BY Reasons_for_choosing_brands
ORDER BY total_responses DESC;

-- MARKETING CHANNELS AND BRAND AWARENESS 

-- Which marketing channel can be used to reach more customers?
SELECT
    F.Marketing_channels,
    COUNT(*) AS total_responses
FROM fact_survey_responses AS F
JOIN dim_repondents AS D
ON F.Respondent_ID = D.Respondent_ID
GROUP BY F.Marketing_channels
ORDER BY total_responses DESC;

-- BRAND PENETRATION 

-- What do people think about our brand?
SELECT 
	General_perception,
    COUNT(*) AS total_responses
FROM fact_survey_responses
GROUP BY General_perception
ORDER BY total_responses DESC;

-- Which cities do we need to focus more on?
SELECT 
	C.City,
	COUNT(*) AS total_responses
FROM dim_cities AS C
JOIN dim_repondents AS D
ON C.City_ID = D.City_ID
JOIN fact_survey_responses AS F
ON D.Respondent_ID = F.Respondent_ID
WHERE Brand_perception = 'Positive' OR 'Neutral'
GROUP BY City
ORDER BY total_responses DESC;

-- PURCHASE BEHAVIOUR 

-- Where do respondents prefer to purchase energy drinks?
SELECT 
	Purchase_location,
    COUNT(*) AS total_responses
FROM fact_survey_responses
GROUP BY Purchase_location
ORDER BY total_responses DESC;

-- What are the typical consumption situations for energy drinks among respondents?
SELECT 
	Typical_consumption_situations,
    COUNT(*) AS total_responses
FROM fact_survey_responses
GROUP BY Typical_consumption_situations
ORDER BY total_responses DESC;

-- What factors influence respondents' purchase decisions, such as price range and limited edition packaging?

-- PRODUCT DEVELOPMENT 

-- Which area of business should we focus more on our product development? 
-- Branding 
SELECT 
	Brand_perception,
    COUNT(*) AS total_responses
FROM fact_survey_responses
GROUP BY Brand_perception
ORDER BY total_responses DESC;

-- Taste 
SELECT 
	Taste_experience,
    COUNT(*) AS total_responses
FROM fact_survey_responses
GROUP BY Taste_experience
ORDER BY total_responses DESC;

-- Availablity 
SELECT 
	Heard_before,
    COUNT(*) AS total_responses
FROM fact_survey_responses
GROUP BY Heard_before
ORDER BY total_responses DESC;
