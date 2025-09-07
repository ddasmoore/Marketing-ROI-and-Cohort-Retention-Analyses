-- add user_id to to subscriptions table using join
WITH

cost_data as (
    SELECT
    	DATE,
    	CAMPAIGN,
    	COST,
    	CLICKS,
    	IMPRESSIONS 
    FROM SQLIII.RAW_DATA.campaigns
),

users as (
    SELECT
     signup_date,
     USER_ID,
     SIGNUP_CAMPAIGN
    FROM SQLIII.RAW_DATA.users
    ), 
    
subscriptions as (
    SELECT
     S.USER_ID,
     U.SIGNUP_CAMPAIGN,
     U.signup_date,
     S.SUBSCRIPTION_ID,
     S.SUBSCRIPTION_TYPE,
     S.SUBSCRIPTION_START_DATE,
     S.SUBSCRIPTION_END_DATE,
     S.PLAN_PRICE
    FROM SQLIII.RAW_DATA.subscriptions S
    JOIN users U 
    ON s.user_id = u.user_id
),
-- SELECT * FROM subscriptions;

-- create months active columns

subscriptions_dates as (
    SELECT
     D.DATE_MONTH,
     S.USER_ID,
     S.SIGNUP_CAMPAIGN,
     S.signup_date,
     S.SUBSCRIPTION_ID,
     S.SUBSCRIPTION_TYPE,
     S.SUBSCRIPTION_START_DATE,
     S.SUBSCRIPTION_END_DATE,
     S.PLAN_PRICE,
     CASE WHEN (SUBSCRIPTION_START_DATE <= LAST_DAY(date_month) ) 
           AND (SUBSCRIPTION_END_DATE >= LAST_DAY(date_month) OR SUBSCRIPTION_END_DATE IS NULL) 
        THEN 1
		    ELSE NULL 
     END as is_active
    FROM subscriptions S 
    JOIN SQLIII.RAW_DATA.MONTHS D 
     ON (SUBSCRIPTION_START_DATE <= LAST_DAY(date_month)
    AND (LAST_DAY(date_month) <= S.SUBSCRIPTION_END_DATE or S.SUBSCRIPTION_END_DATE is null))
    ),
-- SELECT* FROM subscriptions_dates

-- calculate revenue using monthly and yearly subscriptions

subscription_payments as (
select *,
     CASE WHEN is_active = 1 and SUBSCRIPTION_TYPE = 'Monthly' then PLAN_PRICE
          WHEN is_active = 1 and SUBSCRIPTION_TYPE = 'Yearly'  then PLAN_PRICE/12
          ELSE NULL
     END as monthly_plan_price
from  subscriptions_dates
),
-- SELECT * FROM subscription_payments

-- Calculate MRR by sign up date

subscriptions_cohorted as (
  SELECT S.signup_date,
	s.SIGNUP_CAMPAIGN,
	SUM(monthly_plan_price) as total_mrr,
	SUM(IFF(S.SUBSCRIPTION_TYPE = 'Yearly', monthly_plan_price, 0) ) as yearly_subscriptions_mrr,
	SUM(IFF(S.SUBSCRIPTION_TYPE = 'Monthly', monthly_plan_price, 0) ) as monthly_subscriptions_mrr,
	COUNT(DISTINCT subscription_id) as total_subscriptions,
	COUNT(DISTINCT IFF(S.SUBSCRIPTION_TYPE = 'Yearly', subscription_id, NULL) ) as yearly_subscriptions,
	COUNT(DISTINCT IFF(S.SUBSCRIPTION_TYPE = 'Monthly', subscription_id, NULL) ) as monthly_subscriptions
  FROM subscription_payments S 
GROUP BY 1,2
),
-- SELECT* FROM subscriptions_cohorted

-- aggregate sign ups er day
users_agg as (
    SELECT
      signup_date,
      SIGNUP_CAMPAIGN,
      COUNT(user_id) as signups
    FROM users
    GROUP BY 1,2
),
-- SELECT * FROM users_agg 

-- Link marketing cost, conversions and revenue using date and campaign name
cost_conversions as (
  SELECT
    C.DATE,
    C.CAMPAIGN,
    C.COST,
    C.CLICKS,
    C.IMPRESSIONS,
    U.signups,
    S.yearly_subscriptions_mrr,
    S.monthly_subscriptions_mrr,
    S.total_mrr::int as total_mrr,
    S.monthly_subscriptions,
    S.yearly_subscriptions,
    S.total_subscriptions
  FROM cost_data C 
  LEFT JOIN USERS_AGG U 
    ON C.Date = U.signup_date AND C.campaign = U.SIGNUP_CAMPAIGN
  LEFT JOIN subscriptions_cohorted S 
    ON C.Date = S.signup_date AND C.campaign = S.SIGNUP_CAMPAIGN
--ORDER BY 1,2
)
SELECT * FROM cost_conversions
ORDER BY 1,2