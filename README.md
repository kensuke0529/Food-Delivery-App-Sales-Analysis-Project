#  Delivery App Sales Analysis Project 


## Overview

Delivr is a fictional food delivery startup created for practice purposes. The dataset used in this project is sourced from DataCamp.

Through the analysis, I analyzed weekly revenue and profit, profit for each meal, day of the week profit, retention rate and ARPU (average revenue per user) as KPIs to determine trends and performance using SQL, Python. 

- [View code in Jupyter Notebook](https://github.com/kensuke0529/delivery_analysis/blob/main/csv_file/visualization.ipynb)

## Languages and Tools

- **SQL**: Data extraction and aggregation from relational databases.
- **Python**:
  - **Pandas**: Data transformation.
  - **Matplotlib/Seaborn**: Data visualization.
  - **Jupyter Notebook**: Interactive data analysis.

## Database Schema Overview

This project uses three main tables to manage Delivr's food delivery operations.

### 1. Meals
Stores basic information about the meals offered.

| Column Name   | Description                   |
|---------------|-------------------------------|
| `meal_id`     | Unique identifier for the meal |
| `meal_price`  | Selling price of the meal      |
| `meal_cost`   | Cost of producing the meal     |
| `eatery`      | Name of the restaurant offering the meal |

#### The Meals dataset is connected to the Orders dataset using the meal_id column, which serves as a primary key.

### 2. Orders
Manages user order data.

| Column Name       | Description                     |
|-------------------|---------------------------------|
| `order_id`        | Unique identifier for the order |
| `order_date`      | Date of the order               |
| `user_id`         | Unique identifier for the user  |
| `meal_id`         | Unique identifier for the meal ordered |
| `order_quantity`  | Quantity of the meal ordered    |

#### The meal_id column in the Orders dataset is a foreign key to link meal data with order data


## Features

### 1. **Weekly Revenue and Profit Analysis**
- **Goal**: Measure weekly growth in sales and profit.
- **Key Insight**: Steady growth in both metrics, indicating a healthy market expansion.

![Weekly revenue](https://github.com/kensuke0529/delivery_analysis/blob/main/images/download.png)

- #### Revenue increased by 3493% from May to December 2018. The highest growth happened in July with a 40.7% increase, followed by significant rises in September (28.5%) and October (26.8%). However, June and December decreased by -5.6% and -3.9%, respectively. Despite these declines, the overall trend was positive, reflecting strong growth throughout the period.

### 2. **Profit by each Meal**
- **Goal**: Identify the most and least profitable menu items.
- **Key Insight**: High-profit item can be promoted further, while low-margin items need improvement.

![Weekly revenue](https://github.com/kensuke0529/delivery_analysis/blob/main/images/profit.png)

- #### Per-profit measures the profit per unit sold for each meal by dividing the total profit by the total quantity sold. Meal 11 has the highest per-profit of 4.75, which generates the most profit per item sold, while Meal 0 has the lowest per-profit of 2, indicating it generates the least profit per unit.


### 3. **Day-of-Week Profit Analysis**
- **Goal**: Evaluate whether the day of the week affects orders and profitability.
- **Key Insight**: Weekends show slightly higher performance, but no significant weekday trend.
![Weekly retention rate](https://github.com/kensuke0529/delivery_analysis/blob/main/images/download%20(1).png)

- #### Wednesday was the least profitable day and Sunday was the most profitable, 24.7% more than Wednesday. Weekend profits were 11.8% higher than the weekday average.


### 4. **Retention Rate**
- **Goal**: Analyze weekly user retention to understand customer loyalty.
- **Key Insight**: Retention trends upward overall, with occasional dips requiring further investigation.
![Weekly retention rate](https://github.com/kensuke0529/delivery_analysis/blob/main/images/download%20(3).png)

- #### From May to November 2018, the retention rate changed significantly on a weekly basis, with both increases and decreases. The highest weekly increase occurred from 08-06 to 08-13 (54.6%), while the largest decrease happened from 06-18 to 06-25 (-32.4%). The overall trend showed periods of growth, particularly in August, October, and November, with the retention rate improving significantly toward the end.

### 5. **ARPU (Average Revenue Per User)**
- **Goal**: Assess the average revenue generated per user each week.
- **Key Insight**: ARPU increases over time but shows seasonal fluctuations.
 
![Order nubmer](https://github.com/kensuke0529/delivery_analysis/blob/main/images/arpu.png)

- #### The ARPU data shows steady overall growth of approximately 47.0%, starting at 22.7 and peaking at 33.7 in December. Seasonal trends are evident, with ARPU surging during November to December and dropping slightly during July (06-07 to 06-11) and early October (10-01 to 10-15). Weekly fluctuations indicate periodic highs and lows, but ARPU stabilized above 30.0 in late 2018.

## Takeaways 
#### Overall, the analysis highlights strong growth trends in revenue, profitability, customer retention and ARPU from May to December, although it has some drops throughout the period. Weekends, especially Sundays, generally outperformed weekdays in profitability and certain menu items (meals ID 10 and 11) showed higher profitability potential. Customer retention has had a strong growing trend since October compared to the period between May and October which had several rapid drops. Additionally, ARPU showed a promising upward trend. From 10-29 to 11-12, it has both a rapid increase and a rapid drop. Further research about other factors such as marketing campaigns and other competitors will be beneficial to get a deeper understanding of the app's sales.   
