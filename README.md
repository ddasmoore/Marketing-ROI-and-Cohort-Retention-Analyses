# Marketing-ROI-and-Cohort-Retention-Analyses

 
  ## Table of Contents
* [About the project](#About-the-project)
* [Executive summary of insights](#Executive-summary-of-insights)
* [Technical Details and detailed insights](#Technical-Details-and-detailed-insights)
  *   [About the dataset](#About-the-dataset)
  *   [Tools and libraries](#Tools-and-libraries)
  *   [Data analysis](#Data-analysis)
  *   [Results](#Results)
  *   [Recommendations](#Recommendations )

## About-the-project

This data analysis was conducted on marketing campign funnel data for a subscription-based product. The user journey for this product looks like the following: users get exposed to the company’s offering via search engine or social media ads. If they click on the ad they are brought to the home page. 
Users then have the option to sign up and also to subscribe to monthly and yearly paid options. 

The goal of this project was to :
1) Calculate marketing campaign return of invesment (ROI) in terms of how effectively the campaigns led to subscriptions. 
2) Identify high and low performing campaigns
3) Calculate retention rate for each cohort of users across campaigns.


## Executive-summary-of-insights

1) The marketing efforts overall achieved a high return on investment, with a total ROI of 400.8%. This indicates the company was effectively turning marketing spend into valuable subscriptions.
2) Within Display campaigns, Facebook and Pinterest ads performed better than Instagram. Within Search campaigns, Remarketing C1 had the highest impressions and >80% subscription per sign up conversion. Search C2 Branding had the next highest impression and also greater than 80% subscription per sign up conversion.
3) Cohorts from early in the year (Jan-Apr) had first-month retention in the 60-67% range, while recent cohorts (May-Dec) are consistently higher, with rates above 79% after one month.

<img width="1678" height="1068" alt="image" src="https://github.com/user-attachments/assets/38692052-3b43-4b19-91a8-b91b5dae5d95" />

<img width="1692" height="1089" alt="image" src="https://github.com/user-attachments/assets/498acae3-c7a5-4455-ab7c-fa7f673c495e" />


## Technical-Details-and-detailed-insights

## About-the-dataset
There were 3 tables: `USERS`, `CAMPAIGNS` and `SUBSCRIPTIONS`.

`USERS`: The table contains user_id, signup_date and the name of the campaign by which the user was acquired.
<img width="1325" height="233" alt="image" src="https://github.com/user-attachments/assets/80588ee6-24ff-47f4-bfc9-ee6d52bbe55e" />

`CAMPAIGNS`: Contains daily marketing spend (cost) per campaign as well as the daily number of impressions and clicks.
<img width="1326" height="285" alt="image" src="https://github.com/user-attachments/assets/fa0133dc-fe46-49ff-9826-d6074a919a84" />

`SUBSCRIPTIONS`: Contains data on subscriptions purchased by each user including user_id, subscription_id, subscription_type (yearly or monthly), subscription_start_date, subscription_end_date and plan_price.
<img width="1322" height="334" alt="image" src="https://github.com/user-attachments/assets/c85fa472-1553-44ae-bcff-01baad00f36e" />


## Tools-and-libraries
SQL(SNOWFLAKE) and Tableau were used for data analysis and visualization

## Data-analysis
1. From the raw data shared above, the following metrics were aggregated. MRR refers to monthly recurring revenue. 
    DATE,
    CAMPAIGN,
    COST,
    CLICKS,
    IMPRESSIONS,
    signups,
    yearly_subscriptions_mrr,
    monthly_subscriptions_mrr,
    total_mrr,
    monthly_subscriptions,
    yearly_subscriptions,
    total_subscriptions

2. The aggregated data above was used to create an interactive dashboard visualizing marketing ROI, marketing funnel, and impresessions, clicks, costs and subscroptions across channels
3. The aggregated data above was also used to create an interactive retention cohort dashboard where the retention rate of each acquired cohort (so each group of users that signed up in the given month).
   The retention rate is the percentage of users that have an active subscription n months since the sign-up.

## Results
1. Overall ROI of the campaigns was 400.8%, with a 76.9% subscriptions per signup conversion. As  expected, costs for display campaigns ($728,455) were lower than cost for search campaigns ($2138075). Subscription to sign up rate was higher for display campaign (84.6%) compared to search campaigns (73.5%)
2. Within Display campaigns, all 3 Facebook campaigns had 78-87% subscriptions per signup conversion and between $43-$67 cost per subscription. These ads also had some of the highest impressions within display ads. All 3 Pinterest campaigns also had between 83%-87% subscriptions per signup conversion, with Pinterest C1 campaign
   having one of the highest impression count at 4M+. Instagram campaigns had the lowest impressions but comparable cost as Facebook and Pinterest. Instagram C1 performed better than C2 and C3, which would be good candidates for streamlining 
4. Among Search campaigns, Search C2 Branding and Search C1 remarketing had the highest impressions and over 80% subscriptions per signup conversion. Both generic search campaigns had 1M+ impressions but 37%-79% subscriptions per signup conversion, making them less competitive than the rest of the search campaigns.
5. There is a strong and positive trend of increasing retention rates over the year. Cohorts from early in the year (Jan-Apr) had first-month retention in the 60-67% range, while recent cohorts (May-Dec) are consistently higher, with rates above 79% after one month. This difference is driven by high retention rates for recent cohorts for both Search and Display campaigns. However, retention rates for Display campaigns were better for early cohorts compared to Search campaigns. 
6. The most recent user groups are retaining at the highest rates seen on the dashboard. The December 2024 cohort shows a first-month retention of 87.1%, and the August 2024 cohort is at 86.0%. This indicates recent changes to the product or marketing have been highly effective.


## Recommendations 
1. Reallocate budget to top performing campaigns: 
    - Facebook, Instagram, C1 Instagram within Dislay
    - Search C2 Branding and Search C1 remarketing within Search
2. For Branding campaigns that are costly, breakdown conversions by age group, gender, location, and subscription type to unpack if some branding appeals to specific user segments.
3. Identify and Replicate Success: Conduct a deep dive to determine what specific changes were implemented around May 2024 that caused the significant jump in retention rates. These successful strategies should be documented and applied to all future marketing and product initiatives to sustain the positive trend.
4. Leverage User Feedback from Top Cohorts: Gather feedback from the most successful cohorts (e.g., August and December 2024) to understand why they are so engaged. This could provide valuable insights for product improvements and content strategy to further increase long-term retention.
   Similarly, leverage user feedback to unpack why there was a difference in retention during Jan-April between Search and Display. 



