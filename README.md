
# [SQL] Explore Ecommerce Dataset
## I. Introduction
This project contains an eCommerce dataset that I will explore using SQL on [Google BigQuery](https://cloud.google.com/bigquery). The dataset is based on the Google Analytics public dataset and contains data from an eCommerce website.
## II. Requirements
* [Google Cloud Platform account](https://cloud.google.com)
* Project on Google Cloud Platform
* [Google BigQuery API](https://cloud.google.com/bigquery/docs/enable-transfer-service#:~:text=Enable%20the%20BigQuery%20Data%20Transfer%20Service,-Before%20you%20can&text=Open%20the%20BigQuery%20Data%20Transfer,Click%20the%20ENABLE%20button.) enabled
* [SQL query editor](https://cloud.google.com/monitoring/mql/query-editor) or IDE
## III. Dataset Access
The eCommerce dataset is stored in a public Google BigQuery dataset. To access the dataset, follow these steps:
* Log in to your Google Cloud Platform account and create a new project.
* Navigate to the BigQuery console and select your newly created project.
* In the navigation panel, select "Add Data" and then "Search a project".
* Enter the project ID **"bigquery-public-data.google_analytics_sample.ga_sessions"** and click "Enter".
* Click on the **"ga_sessions_"** table to open it.
## IV. Exploring the Dataset
In this project, I will write 08 query in Bigquery base on Google Analytics dataset
### Query 01: Calculate total visit, pageview, transaction and revenue for January, February and March 2017 order by month
* SQL code

![q1](https://github.com/user-attachments/assets/55b12c68-3cfc-40b6-a293-87a4793a5c22)

* Query results

![rq1](https://github.com/user-attachments/assets/6d1f67bf-37d4-4a35-8530-93a64ea34500)

### Query 02: Bounce rate per traffic source in July 2017
* SQL code

![q2](https://github.com/user-attachments/assets/df33dd31-2d6f-4227-82f6-83f7fbb0cb04)

* Query results

![rq2](https://github.com/user-attachments/assets/ab1e918a-8fa3-480d-8c1d-41574c7b7c48)

### Query 3: Revenue by traffic source by week, by month in June 2017
* SQL code

![q3](https://github.com/user-attachments/assets/50a83e3d-637e-4b75-9e24-ddd4657e3751)

* Query results

![rq3](https://github.com/user-attachments/assets/876346fe-5c77-4b20-95ae-b30c7ab60363)

### Query 04: Average number of product pageviews by purchaser type (purchasers vs non-purchasers) in June, July 2017
* SQL code

![image](https://user-images.githubusercontent.com/101726623/235143185-85e4ffbe-1030-4f70-99c6-1571facdf3d8.png)

* Query results

![image](https://user-images.githubusercontent.com/101726623/235143315-8d87f354-351b-4218-ac77-bf8c0f9e716b.png)

### Query 05: Average number of transactions per user that made a purchase in July 2017
* SQL code

![image](https://user-images.githubusercontent.com/101726623/235143576-0a816953-e12d-4d47-ab8b-0a851e82a65c.png)

* Query results

![image](https://user-images.githubusercontent.com/101726623/235143708-06c7b447-5c1e-44bb-89ae-c5fed537bd92.png)

### Query 06: Average amount of money spent per session. Only include purchaser data in July 2017
* SQL code

![image](https://user-images.githubusercontent.com/101726623/235144017-2e40f75c-4374-4d2b-94cb-a36c591a80c2.png)

* Query results

![image](https://user-images.githubusercontent.com/101726623/235144083-3499b416-0388-46ea-850f-30006e1b4ede.png)

### Query 07: Other products purchased by customers who purchased product "YouTube Men's Vintage Henley" in July 2017. Output should show product name and the quantity was ordered.
* SQL code

![image](https://user-images.githubusercontent.com/101726623/235146761-aeb66e07-8f91-4c6f-a4c2-c3fb8d64708a.png)

* Query results

![image](https://user-images.githubusercontent.com/101726623/235146847-e367b16c-38f0-484e-8c89-85dfa1b69499.png)

### Query 08: Calculate cohort map from pageview to addtocart to purchase in last 3 month.
* SQL code

```
with get_1month_cohort as (SELECT  
  CASE WHEN 1 = 1 THEN "201701" END AS month,
  COUNT(CASE WHEN hits.eCommerceAction.action_type = "2" AND product.isImpression IS NULL THEN fullVisitorId END) AS 
num_product_view,
  COUNT(CASE WHEN hits.eCommerceAction.action_type = "3" AND product.isImpression IS NULL THEN fullVisitorId END) AS 
num_addtocart,
  COUNT(CASE WHEN hits.eCommerceAction.action_type = "6" AND product.isImpression IS NULL THEN fullVisitorId END) AS 
num_purchase,
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201701*` ,
UNNEST(hits) as hits,
UNNEST(hits.product) as product),

get_2month_cohort as (SELECT  
  CASE WHEN 1 = 1 THEN "201702" END AS month,
  COUNT(CASE WHEN hits.eCommerceAction.action_type = "2" AND product.isImpression IS NULL THEN fullVisitorId END) AS 
num_product_view,
  COUNT(CASE WHEN hits.eCommerceAction.action_type = "3" AND product.isImpression IS NULL THEN fullVisitorId END) AS 
num_addtocart,
  COUNT(CASE WHEN hits.eCommerceAction.action_type = "6" AND product.isImpression IS NULL THEN fullVisitorId END) AS 
num_purchase,
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201702*` ,
UNNEST(hits) as hits,
UNNEST(hits.product) as product),

get_3month_cohort as (SELECT  
  CASE WHEN 1 = 1 THEN "201703" END AS month,
  COUNT(CASE WHEN hits.eCommerceAction.action_type = "2" AND product.isImpression IS NULL THEN fullVisitorId END) AS 
num_product_view,
  COUNT(CASE WHEN hits.eCommerceAction.action_type = "3" AND product.isImpression IS NULL THEN fullVisitorId END) AS 
num_addtocart,
  COUNT(CASE WHEN hits.eCommerceAction.action_type = "6" AND product.isImpression IS NULL THEN fullVisitorId END) AS 
num_purchase,
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201703*` ,
UNNEST(hits) as hits,
UNNEST(hits.product) as product)

select 
month,
num_product_view,
num_addtocart,
num_purchase,
ROUND(num_addtocart/num_product_view*100,2) as add_to_cart_rate,
ROUND(num_purchase/num_product_view*100,2) as purchase_rate
from 
(SELECT * FROM get_1month_cohort
UNION ALL 
SELECT * FROM get_2month_cohort
UNION ALL
SELECT * FROM get_3month_cohort)
ORDER BY month;
```
* Query results

![image](https://user-images.githubusercontent.com/101726623/235148311-a2d83174-9bf3-43e3-aed1-47030af40b3b.png)

## V. Conclusion
* In conclusion, my exploration of the eCommerce dataset using SQL on Google BigQuery based on the Google Analytics dataset has revealed several interesting insights.
* By exploring eCommerce dataset, I have gained valuable information about total visits, pageview, transactions, bounce rate, and revenue per traffic source,.... which could inform future business decisions.
* To deep dive into the insights and key trends, the next step will visualize the data with some software like Power BI,Tableau,...
* **Overall**, this project has demonstrated the power of using SQL and big data tools like Google BigQuery to gain insights into large datasets.
