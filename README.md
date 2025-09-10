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

1. 2024 marketing campaigns successfully generated a 400.8% return on investment (ROI). The total marketing spend of $2.87 million resulted in $11.49 million in revenue, along with 85,813 new sign-ups and 65,955 new subscriptions. Campaign spending peaked in March and June, with a corresponding peak in sign-ups and subscriptions during June. 

2. Search campaigns had a higher sign-up per click rate compared to display campaigns. However, this trend reversed for subscriptions per sign-up, where display campaigns converted users at a higher rate than search campaigns.

3. Top Performers:

    - Display: Instagram, and Pinterest campaigns drove strong results. Notably, a specific campaign on Facebook and a few on Instagram and Pinterest were particularly successful.

    - Search: All search campaigns performed well, with specific campaigns for branding, generic, and remarketing driving the highest volume of sign-ups and subscriptions.

4. Cohorts who signed up early in the year (Jan-Apr) had first-month retention in the 60-67% range, while later cohorts (May-Dec) were consistently higher, with rates above 79% after one month.


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

1. The marketing initiatives delivered significant returns. The total investment of $2,866,530 generated a gross revenue of $11,488,181, leading to a strong 400.8% ROI. These efforts resulted in 85,813 new sign-ups and 65,955 new subscriptions. While campaign expenditure peaked in March and June, the volume of new sign-ups and subscriptions was highest in June.

2. The overall average cost per sign-up was $33.40, while the average cost per subscription was $43.50. Across all campaigns, the sign-up per click rate was 5.9%, and the conversion rate from sign-up to subscription was an impressive 76.9%.

3. Search campaigns were more effective at driving initial sign-ups per click. However, display campaigns proved to be more efficient at converting those sign-ups into paying subscribers.

4. Diplay campaign performance:  Instagram had the highest sign-up per click rate, followed by Pinterest and then Facebook. Subscription rates were consistently high across all major display channels, with Instagram, Pinterest, and Facebook all converting at approximately 86%. Facebook campaigns incurred higher costs than those on Instagram or Pinterest.

5. Search campaign performance: Branding-focused campaigns were the most effective in driving sign-ups, followed by remarketing and generic campaigns. The conversion rate from sign-up to subscription was highest for remarketing campaigns, followed by branding and generic. Branding campaigns were the most expensive, with a total cost of $1,000,079, while generic and remarketing campaigns cost $555,701 and $582,295, respectively.

6. The most successful campaigns in terms of sign-ups and subscriptions were a Facebook campaign (c1), an Instagram campaign (c1), and two Pinterest campaigns (c1 and c2). All search campaigns performed strongly, with specific campaigns for branding (c1), generic (c1), and remarketing (c1) proving to be exceptionally effective.
   
7. There was a strong and positive trend of increasing retention rates over the year. Cohorts from early in the year (Jan-Apr) had first-month retention in the 60-67% range, while recent cohorts (May-Dec) are consistently higher, with rates above 79% after one month. This difference is driven by high retention rates for recent cohorts for both Search and Display campaigns. However, retention rates for Display campaigns were better for early cohorts compared to Search campaigns. 
   



## Recommendations 
1. Reallocate budget to top performing campaigns: 
    - Facebook c1, Instagram c1 and Pinterest c1 and c2 within Dislay
    - Branding (c1), Generic (c1), and Remarketing (c1) within Search
2. For Branding campaigns that are costly, breakdown conversions by age group, gender, location, and subscription type to unpack if some branding appeals to specific user segments.
3. Identify and Replicate Success: Conduct a deep dive to determine what specific changes were implemented around May 2024 that caused the significant jump in retention rates. These successful strategies should be documented and applied to all future marketing and product initiatives to sustain the positive trend.
4. Leverage User Feedback from Top Cohorts: Gather feedback from the most successful cohorts to understand why they are so engaged. This could provide valuable insights for product improvements and content strategy to further increase long-term retention.
  



