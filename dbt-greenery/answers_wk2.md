## (Part 1) Models

### What is our user repeat rate?
The repeat rate is 80%.

dbt=# select 1.0*count(case when num_orders>1 then user_id end)/count(*) as repeat_rate from (select user_id, count(distinct order_id) AS num_orders FROM dbt.dbt_nacho.fact_orders GROUP BY 1) as sub;
      repeat_rate       
------------------------
 0.80468750000000000000
(1 row)

### What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?
A good indicator of a user purchasing again is having short frequency of purchases.
A good indicator of a user not likely to purchase again is long recency (they have purchased but haven't done so in a while).
Some other data we could look into to answer the question could be by associating purchase behavior from users to events behavior, in terms of how often they are on the site.

### Explain the marts models you added. Why did you organize the models in the way you did?
I went backwards from the a few main questions I wanted to answer:
* Is the business profitable? That led me to make fact_orders, associating the cost information to the price of the goods sold.
    * To do this, it seemed reasonable to create an intermediate int_order_sales table, before populating the final fact table.
* Is the purchasing funnel seamless? That led me to make fact_sessions, understanding what events users take in each session and how far down the purchasing funnel they go.
    * To do this, it seemed reasonable to create an intermediate int_sessions table.

### Paste in an image of your DAG from the docs
Uploaded to repo.

## (Part 2) Tests

### What assumptions are you making about each model? (i.e. why are you adding each test?)
The main assumption I'm making is that prices don't change. I wouldn't be able to calculate profitability of each order otherwise. For the sake of the exercise it seemed like a reasonable one to make.
Other assumptions, for which I built test, were that the discounts would generally be values between 0 and 100, the prices and quantities of orders would never be zero.

### Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?
I did not find any bad data.

### Your stakeholders at Greenery want to understand the state of the data each day. Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.
To ensure the tests pass regularly they would need to be run regularly. The best solution to alert the stakeholders would be by storing test failures and notify when those results have new failures.