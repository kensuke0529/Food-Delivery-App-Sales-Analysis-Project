# delivery_analysis

## Overview

Delivr is a fictional food delivery startup created for practice purposes. This project is designed to help users enhance their SQL skills by working with a simulated real-world scenario. The dataset used in this project is sourced from DataCamp and serves as an educational tool to explore database management, querying, and analysis.

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

---

### 2. Stock
Tracks the inventory levels of meals.

| Column Name       | Description                     |
|-------------------|---------------------------------|
| `stocking_date`   | Date when the stock was updated |
| `meal_id`         | Unique identifier for the meal  |
| `stocked_quantity`| Quantity of the meal in stock   |

---

### 3. Orders
Manages user order data.

| Column Name       | Description                     |
|-------------------|---------------------------------|
| `order_id`        | Unique identifier for the order |
| `order_date`      | Date of the order               |
| `user_id`         | Unique identifier for the user  |
| `meal_id`         | Unique identifier for the meal ordered |
| `order_quantity`  | Quantity of the meal ordered    |


