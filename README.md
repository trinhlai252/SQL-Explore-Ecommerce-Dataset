
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
#### SQL code

![q1](https://github.com/user-attachments/assets/55b12c68-3cfc-40b6-a293-87a4793a5c22)

#### Query results

![rq1](https://github.com/user-attachments/assets/6d1f67bf-37d4-4a35-8530-93a64ea34500)
#### Insights


* Visits and pageviews increased significantly in March 2017 compared to January and February, reflecting higher user activity.
* The highest number of transactions occurred in March 2017, indicating improved conversion rates or marketing efforts.

### Query 02: Bounce rate per traffic source in July 2017
#### SQL code

![q2](https://github.com/user-attachments/assets/df33dd31-2d6f-4227-82f6-83f7fbb0cb04)

#### Query results

![rq2](https://github.com/user-attachments/assets/ab1e918a-8fa3-480d-8c1d-41574c7b7c48)
#### Insights
* Google had the highest visits (38,400) with a moderate bounce rate (51.56%).
* YouTube.com and m.facebook.com had the highest bounce rates (66.73% and 64.28%, respectively), suggesting users may not find content relevant or engaging.
* Reddit.com had the lowest bounce rate (28.57%), reflecting better alignment with user expectations and engagement.
* Smaller sources like dfa, sites.google.com, and reddit.com showed low bounce rates, indicating niche traffic quality.
### Query 3: Revenue by traffic source by week, by month in June 2017
#### SQL code

![q3](https://github.com/user-attachments/assets/50a83e3d-637e-4b75-9e24-ddd4657e3751)

#### Query results

<img width="245" alt="image" src="https://github.com/user-attachments/assets/9389cb86-1bf5-414a-92d3-dd62006ed666">

More detailed results, you can be found at
[here](https://docs.google.com/spreadsheets/d/134DD3LqknTSfrjY1jEigEragSJDEkExmdwLh1AbTuUU/edit?gid=2000657425#gid=2000657425)

#### Insights
* Bing was the top-performing source in June 2017, generating the highest revenue of 13.98, both weekly and monthly.
* l.facebook.com also performed well, contributing 12.48 in revenue consistently across weeks and the month.
* Other sources, such as analytics.google.com, quora.com, and duckduckgo.com, showed no measurable revenue, indicating potential gaps in monetization or tracking.
* Efforts could focus on leveraging high-performing sources like Bing and l.facebook.com while finding ways to improve or monetize low-value sources.
### Query 04: Average number of product pageviews by purchaser type (purchasers vs non-purchasers) in June, July 2017
#### SQL code

![q4](https://github.com/user-attachments/assets/2659f802-8184-4f39-98b6-4024722aadc6)

#### Query results

![rq4](https://github.com/user-attachments/assets/b721c50a-e86e-4e48-8634-80000defad7a)
#### Insights
* In June 2017, non-purchasers averaged 316.87 product pageviews, significantly higher than purchasers at 94.02 pageviews.
* In July 2017, this gap persisted, with non-purchasers averaging 334.06 pageviews compared to 124.24 pageviews for purchasers.
* Non-purchasers consistently exhibited higher browsing activity, suggesting interest without purchase intent or difficulty in decision-making.
### Query 05: Average number of transactions per user that made a purchase in July 2017
#### SQL code

![q5](https://github.com/user-attachments/assets/7a8b8c54-60a2-4697-83b4-1f90069c18ff)

#### Query results

![rq5](https://github.com/user-attachments/assets/e63d7459-3204-4fb0-be0b-74f12bfc79aa)
#### Insights
*  Average number of transactions per user can provide insights into user activity levels and transaction frequency, which can be used to track engagement or establish goals for the coming months.
### Query 06: Average amount of money spent per session. Only include purchaser data in July 2017
#### SQL code

![q6](https://github.com/user-attachments/assets/c0bb49bb-cc8c-466f-9e4e-9c9fd700658c)

#### Query results

![rq6](https://github.com/user-attachments/assets/684a5a0b-b74c-495c-b9d7-403002eaaaa1)
#### Insights

* The average amount of spending per session in July 2017 for purchasers reflects strong purchasing behavior, indicating deeper engagement and higher transaction values per visit. Analyzing this metric can help optimize pricing and promotional strategies.
### Query 07: Other products purchased by customers who purchased product "YouTube Men's Vintage Henley" in July 2017. Output should show product name and the quantity was ordered.
#### SQL code

![q7](https://github.com/user-attachments/assets/45826dd9-18ca-4ea2-b324-4e3b5e7180ab)

#### Query results

![rq7](https://github.com/user-attachments/assets/2e55bae0-d7b7-40b9-8d65-a0e14b7b07a1)
#### Insights
* Customers who purchased the YouTube Men's Vintage Henley in July 2017 tended to buy other YouTube-branded products, such as the YouTube Men's Fleece Hoodie Black and 22 oz YouTube Bottle Infuser, indicating a strong brand affinity.
* There was also a noticeable trend in purchasing Google-branded items, like Google Sunglasses and Google Women's Vintage Hero Tee, which suggests that customers who are interested in YouTube products may also have a preference for other tech-related brands.
* The variety of products purchased, from clothing to accessories like the Android Wool Heather Cap and Crunch Noise Dog Toy, points to a broad range of customer interests, suggesting opportunities for cross-selling and targeted marketing.
* The significant purchase quantity of Google Sunglasses (20 units) shows a potential high demand for certain products alongside YouTube apparel.
### Query 08: Calculate cohort map from pageview to addtocart to purchase in last 3 month.
#### SQL code

![q8](https://github.com/user-attachments/assets/0b9be397-1e11-4309-b8a1-7c3651f247da)

#### Query results

![rq8](https://github.com/user-attachments/assets/40433288-bb11-4b93-ba76-36d01a590362)
#### Insights
* In January 2017, the add-to-cart rate was 28.47%, and the purchase rate was 8.31%, showing a relatively low conversion from views to purchases.
* February 2017 saw an increase in the add-to-cart rate to 34.25% and a slight increase in the purchase rate to 9.59%, indicating improved engagement and * potential interest from users.
* March 2017 showed the highest rates, with add-to-cart at 37.29% and purchase rate at 12.64%, reflecting stronger customer intent and conversions.
* The steady increase in both add-to-cart and purchase rates over the three months suggests that product appeal and customer purchase intent may have improved, potentially due to more effective marketing or promotions.
* Overall, the purchase rate remains lower than the add-to-cart rate, which highlights an opportunity for further optimization in the purchase funnel to drive more conversions
## V. Conclusion

In conclusion, my analysis of the eCommerce dataset using SQL on Google BigQuery, based on the Google Analytics data, offers a detailed understanding of customer behavior—from product views to add-to-cart and conversion rates. This project provides valuable insights into customer behavior, highlighting opportunities to optimize marketing strategies and improve conversion rates. 

