# SQL Joins and Group By Practice: Sakila Database Exercises

This project contains a series of SQL queries that practice the use of joins and `GROUP BY` clauses on the Sakila database. The Sakila database provides a realistic data model of a DVD rental business, making it an ideal platform for learning advanced SQL concepts like joining tables and grouping data.

## Project Overview

The primary goals of this project are:
- To demonstrate the ability to perform SQL joins between multiple tables.
- To explore the use of the `GROUP BY` clause for summarizing and aggregating data.
- To answer business-related queries from the Sakila database that involve combining data from different tables.

## Dataset

The Sakila database consists of various tables representing different aspects of a DVD rental store. The key tables used in this project are:
- **Actor**: Information about the actors appearing in films.
- **Film**: Details about the films available for rent.
- **Customer**: Information on customers.
- **Rental**: Details about movie rentals, including rental dates.
- **Payment**: Data on payments made by customers.
- **Inventory**: Inventory details of films in stock across stores.

## Key SQL Concepts Covered
- **INNER JOIN**: Combines records from two or more tables based on a related column between them.
- **LEFT JOIN**: Retrieves all records from one table and the matched records from the other table.
- **GROUP BY**: Groups rows that have the same values in specified columns into aggregate data.
- **HAVING**: Filters data after the `GROUP BY` clause based on aggregate conditions.
- **COUNT, SUM, AVG**: Aggregate functions to summarize data.
- **ORDER BY**: Sorting the result set.

## Example Queries

1. **Find the total number of rentals for each customer**:
   ```sql
   SELECT customer_id, COUNT(rental_id) AS total_rentals
   FROM rental
   GROUP BY customer_id;
