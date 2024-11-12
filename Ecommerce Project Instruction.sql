#Query 01: calculate total visit, pageview, transaction for Jan, Feb and March 2017 (order by month)
select
  FORMAT_DATE('%Y%m', PARSE_DATE('%Y%m%d', date)) AS month,
  sum(totals.visits) as total_visits,
  sum(totals.pageviews)   as total_pageviews,
  sum(totals.transactions) as totals_transactions
from `bigquery-public-data.google_analytics_sample.ga_sessions_2017*`
where _table_suffix between '0101' and '0331'
group by 1
order by 1;

#Query 02: Bounce rate per traffic source in July 2017 (Bounce_rate = num_bounce/total_visit) (order by total_visit DESC)
select
  trafficSource.`source`,
  sum(totals.visits) as total_visits,
  sum(totals.bounces) as total_bounces,
  100*sum(totals.bounces)/sum(totals.visits) as bounces_rate
from `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`
group by 1
order by 2 desc;

#Query 3: Revenue by traffic source by week, by month in June 2017
with month_data as
  (select
    'Month' as time_type,
    FORMAT_DATE('%Y%m', PARSE_DATE('%Y%m%d', date)) AS date,
    trafficSource.`source` as Sources,
    sum(product.productRevenue)/1000000 as revenue
  from `bigquery-public-data.google_analytics_sample.ga_sessions_201706*`,
      UNNEST(hits) AS hits,
      UNNEST(hits.product) AS product
    group by 2,3),

week_data as
  (select
    'Week' as time_type,
    FORMAT_DATE('%Y%W', PARSE_DATE('%Y%m%d', date)) AS date,
    trafficSource.`source` as Sources,
    sum(product.productRevenue)/1000000 as revenue
  from
    `bigquery-public-data.google_analytics_sample.ga_sessions_201706*`,
    UNNEST(hits) AS hits,
    UNNEST(hits.product) AS product
  group by
    2, 3)

select * from month_data
union all
select * from week_data
order by revenue desc;

#Query 04: Average number of pageviews by purchaser type (purchasers vs non-purchasers) in June, July 2017
WITH 
PUCHASER AS(SELECT
    FORMAT_DATE('%Y%m', PARSE_DATE('%Y%m%d', date)) AS month,
     SUM(totals.pageviews) / COUNT(DISTINCT fullVisitorId) AS avg_pageviews_per_user
  FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_2017*`,
    UNNEST(hits) AS hits,
    UNNEST(hits.product) AS product
  WHERE
    _TABLE_SUFFIX BETWEEN '0601' AND '0731'
    AND totals.transactions >= 1
    AND product.productRevenue IS NOT NULL
  GROUP BY 1),

NON_PUCHSER AS 
    (
SELECT
    FORMAT_DATE('%Y%m', PARSE_DATE('%Y%m%d', date)) AS month,
     SUM(totals.pageviews) / COUNT(DISTINCT fullVisitorId) AS avg_pageviews_per_user
  FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_2017*`,
    UNNEST(hits) AS hits,
    UNNEST(hits.product) AS product
  WHERE
    _TABLE_SUFFIX BETWEEN '0601' AND '0731'
    AND totals.transactions IS NULL
    AND product.productRevenue IS NULL
  GROUP BY 1
    )

    SELECT *
    FROM PUCHASER
    FULL JOIN NON_PUCHSER USING (month);

#Query 05: Average number of transactions per user that made a purchase in July 2017
select
    format_date("%Y%m",parse_date("%Y%m%d",date)) as month,
    sum(totals.transactions)/count(distinct fullvisitorid) as Avg_total_transactions_per_user
from `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`
    ,unnest (hits) hits,
    unnest(product) product
where  totals.transactions>=1
and product.productRevenue is not null
group by month;

#Query 06: Average amount of money spent per session. Only include purchaser data in July 2017

select
    format_date("%Y%m",parse_date("%Y%m%d",date)) as month,
    ((sum(product.productRevenue)/sum(totals.visits))/power(10,6)) as avg_revenue_by_user_per_visit
from `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`
  ,unnest(hits) hits
  ,unnest(product) product
where product.productRevenue is not null
and totals.transactions>=1
group by month;

#Query 07: Other products purchased by customers who purchased product "YouTube Men's Vintage Henley" in July 2017. Output should show product name and the quantity was ordered.
with buyer_list as(
    SELECT
        distinct fullVisitorId
    FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`
    , UNNEST(hits) AS hits
    , UNNEST(hits.product) as product
    WHERE product.v2ProductName = "YouTube Men's Vintage Henley"
    AND totals.transactions>=1
    AND product.productRevenue is not null
)

SELECT
  product.v2ProductName AS other_purchased_products,
  SUM(product.productQuantity) AS quantity
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`
, UNNEST(hits) AS hits
, UNNEST(hits.product) as product
JOIN buyer_list using(fullVisitorId)
WHERE product.v2ProductName != "YouTube Men's Vintage Henley"
 and product.productRevenue is not null
GROUP BY other_purchased_products
ORDER BY quantity DESC;
 
 	
#Query 08: Calculate cohort map from product view to addtocart to purchase in Jan, Feb and March 2017. For example, 100% product view then 40% add_to_cart and 10% purchase. Add_to_cart_rate = number product  add to cart/number product view. Purchase_rate = number product purchase/number product view. The output should be calculated in product level.
with product_data as(
select
    format_date('%Y%m', parse_date('%Y%m%d',date)) as month,
    count(CASE WHEN eCommerceAction.action_type = '2' THEN product.v2ProductName END) as num_product_view,
    count(CASE WHEN eCommerceAction.action_type = '3' THEN product.v2ProductName END) as num_add_to_cart,
    count(CASE WHEN eCommerceAction.action_type = '6' and product.productRevenue is not null THEN product.v2ProductName END) as num_purchase
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
,UNNEST(hits) as hits
,UNNEST (hits.product) as product
where _table_suffix between '20170101' and '20170331'
and eCommerceAction.action_type in ('2','3','6')
group by month
order by month
)

select
    *,
    round(num_add_to_cart/num_product_view * 100, 2) as add_to_cart_rate,
    round(num_purchase/num_product_view * 100, 2) as purchase_rate
from product_data;