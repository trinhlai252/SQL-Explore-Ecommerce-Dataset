
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

![q4](https://github.com/user-attachments/assets/2659f802-8184-4f39-98b6-4024722aadc6)

* Query results

![rq4](https://github.com/user-attachments/assets/b721c50a-e86e-4e48-8634-80000defad7a)

### Query 05: Average number of transactions per user that made a purchase in July 2017
* SQL code

![q5](https://github.com/user-attachments/assets/7a8b8c54-60a2-4697-83b4-1f90069c18ff)

* Query results

![rq5](https://github.com/user-attachments/assets/e63d7459-3204-4fb0-be0b-74f12bfc79aa)

### Query 06: Average amount of money spent per session. Only include purchaser data in July 2017
* SQL code

![q6](https://github.com/user-attachments/assets/c0bb49bb-cc8c-466f-9e4e-9c9fd700658c)

* Query results

![rq6](https://github.com/user-attachments/assets/684a5a0b-b74c-495c-b9d7-403002eaaaa1)

### Query 07: Other products purchased by customers who purchased product "YouTube Men's Vintage Henley" in July 2017. Output should show product name and the quantity was ordered.
* SQL code

![q7](https://github.com/user-attachments/assets/45826dd9-18ca-4ea2-b324-4e3b5e7180ab)

* Query results

![rq7](https://github.com/user-attachments/assets/2e55bae0-d7b7-40b9-8d65-a0e14b7b07a1)

### Query 08: Calculate cohort map from pageview to addtocart to purchase in last 3 month.
* SQL code

![q8](https://github.com/user-attachments/assets/0b9be397-1e11-4309-b8a1-7c3651f247da)

* Query results

![rq8](https://github.com/user-attachments/assets/40433288-bb11-4b93-ba76-36d01a590362)

## V. Conclusion
* In conclusion, my exploration of the eCommerce dataset using SQL on Google BigQuery based on the Google Analytics dataset has revealed several interesting insights.
* By exploring eCommerce dataset, I have gained valuable information about total visits, pageview, transactions, bounce rate, and revenue per traffic source,.... which could inform future business decisions.
* To deep dive into the insights and key trends, the next step will visualize the data with some software like Power BI,Tableau,...
* **Overall**, this project has demonstrated the power of using SQL and big data tools like Google BigQuery to gain insights into large datasets.
