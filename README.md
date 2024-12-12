# delivery_analysis

## Overview

Delivr is a fictional food delivery startup created for practice purposes. This project is designed to help users enhance their SQL skills by working with a simulated real-world scenario. The dataset used in this project is sourced from DataCamp and serves as an educational tool to explore database management, querying, and analysis.


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


### 2. Orders
Manages user order data.

| Column Name       | Description                     |
|-------------------|---------------------------------|
| `order_id`        | Unique identifier for the order |
| `order_date`      | Date of the order               |
| `user_id`         | Unique identifier for the user  |
| `meal_id`         | Unique identifier for the meal ordered |
| `order_quantity`  | Quantity of the meal ordered    |

## Features

### 1. **Weekly Revenue and Profit Analysis**
- **Goal**: Measure weekly growth in sales and profit.
- **Key Insight**: Steady growth in both metrics, indicating a healthy market expansion.

### 2. **Profit Margin by Meal**
- **Goal**: Identify the most and least profitable menu items.
- **Key Insight**: High-profit item can be promoted further, while low-margin items need improvement.

### 3. **Day-of-Week Order and Profit Analysis**
- **Goal**: Evaluate whether the day of the week affects orders and profitability.
- **Key Insight**: Weekends show slightly higher performance, but no significant weekday trend.

### 4. **Retention Rate**
- **Goal**: Analyze weekly user retention to understand customer loyalty.
- **Key Insight**: Retention trends upward overall, with occasional dips requiring further investigation.

### 5. **ARPU (Average Revenue Per User)**
- **Goal**: Assess the average revenue generated per user each week.
- **Key Insight**: ARPU increases over time but shows seasonal fluctuations.

## Visualization Examples:

## Future Improvements
- Expand the analysis to include external factors like marketing campaigns or weather data.

