# Big Mart Sales Analysis

## Overview
This project focuses on the analysis of Big Mart sales data using SQL queries. By leveraging SQL, we can efficiently manage and manipulate data, enabling us to gain valuable insights and make data-driven decisions. The dataset provides information about various aspects of products and their sales in Big Mart stores.

## Data Description
Here's an overview of the key attributes in the dataset:

1. **Item_Identifier**: Unique product ID.
2. **Item_Weight**: The weight of the product.
3. **Item_Fat_Content**: Indicates whether the product is labeled as "Low Fat" or not.
4. **Item_Visibility**: The percentage of the total display area allocated to the particular product in a store.
5. **Item_Type**: The category to which the product belongs.
6. **Item_MRP**: The Maximum Retail Price (list price) of the product.
7. **Outlet_Identifier**: A unique identifier for each store.
8. **Outlet_Establishment_Year**: The year in which the store was established.
9. **Outlet_Size**: The size of the store in terms of ground area covered.
10. **Outlet_Location_Type**: The type of city in which the store is located.
11. **Outlet_Type**: Indicates whether the outlet is a grocery store or some type of supermarket.
12. **Item_Outlet_Sales**: Sales of the product in a particular store, which serves as the outcome variable to be predicted.

## Analysis and Queries
To extract meaningful information from the dataset, various SQL queries have been executed. These queries cover a wide range of analyses, including data exploration and statistical calculations. Each query serves a specific purpose, from basic data retrieval to advanced insights.

## How to Use This Repository
- The SQL queries are organized in a structured manner within this repository.
- You can refer to the queries by their respective numbers in the Table of Contents.
- Feel free to run these queries in your SQL environment to explore and analyze the Big Mart sales data effectively.

By using this repository, you can gain a deeper understanding of the dataset, perform data analysis, and derive valuable insights that can inform decision-making processes related to Big Mart sales and product management.

Table of Contents

1. Database Creation

2. Selecting the Database

3. Data Exploration :-
	Query 1: List All Item Identifiers
	Query 2: Count Total Item Identifiers
	Query 3: Display Maximum Item Weight
	Query 4: Show Minimum Item Weight
	Query 5: Calculate Average Item Weight
	Query 6: Count Low Fat Item Fat Content
	Query 7: Count Regular Item Fat Content
	Query 8: Find Maximum Item MRP
	Query 9: Find Minimum Item MRP
	Query 10: Items with MRP > 200
4. Data Analysis
	Query 11: Max MRP for Low Fat Items
	Query 12: Min MRP for Low Fat Items
	Query 13: Items with MRP Between 50 and 100
	Query 14: Unique Item Fat Content Values
	Query 15: Unique Item Type Values
	Query 16: Sort All Data by Item MRP (Descending)
	Query 17: Sort All Data by Item Outlet Sales (Ascending)
	Query 18: Sort All Data by Item Type (Ascending)
	Query 19: Items of Types 'Dairy' and 'Meat'
	Query 20: Unique Outlet Sizes
	Query 21: Unique Outlet Location Types
	Query 22: Unique Outlet Types
	Query 23: Item Count by Item Type (Descending)
	Query 24: Item Count by Outlet Size (Ascending)
	Query 25: Item Count by Outlet Establishment Year (Ascending)
	Query 26: Item Count by Outlet Type (Descending)
	Query 27: Item Count by Outlet Location Type (Descending)
	Query 28: Max MRP by Item Type
	Query 29: Min MRP by Item Type
	Query 30: Min MRP by Outlet Establishment Year (Descending)
	Query 31: Max MRP by Outlet Establishment Year (Descending)
	Query 32: Avg MRP by Outlet Size (Descending)
	Query 33: Avg MRP by Outlet Size (Descending)
	Query 34: Avg MRP by Outlet Type (Ascending)
	Query 35: Max MRP by Outlet Type (Ascending)
	Query 36: Max Item Weight by Item Type (Descending)
	Query 37: Max Item Weight by Outlet Establishment Year (Ascending)
	Query 38: Min Item Weight by Outlet Type (Descending)
	Query 39: Avg Item Weight by Outlet Location Type (Descending)
	Query 40: Max Outlet Sales by Item Type
	Query 41: Min Outlet Sales by Item Type
	Query 42: Min Outlet Sales by Outlet Establishment Year (Descending)
	Query 43: Max Outlet Sales by Outlet Establishment Year (Descending)
	Query 44: Avg Outlet Sales by Outlet Size (Descending)
	Query 45: Avg Outlet Sales by Outlet Size
	Query 46: Avg Outlet Sales by Outlet Type (Ascending)
	Query 47: Max Outlet Sales by Outlet Type (Ascending)
	Query 48: Total Outlet Sales by Outlet Establishment Year (Descending)
	Query 49: Total Outlet Sales by Item Type (Descending)
	Query 50: Total Outlet Sales by Outlet Location Type (Descending)
	Query 51: Total Outlet Sales by Item Fat Content (Descending)
	Query 52: Max Item Visibility by Item Type (Descending)
	Query 53: Min Item Visibility by Item Type (Descending)
	Query 54: Total Outlet Sales by Item Type (Tier 1 Location)
	Query 55: Total Outlet Sales by Item Type (Low Fat & LF)
