
# Denormalized Sales database

An assignment modelling sales database starting with a given dataset.

## Story

Our company sales department has a really denormalized  database stored in csv format. They need a more proper enterprise solution to generating valuable reports and predicting future sales. It will play a crucial part of the company's sales strategy in the upcoming year. You need to create a normalized database structure which is able to store the data and a corresponding web service which is able to manage the database.

## What are you going to learn?

- Generating database schema based on dataset
- How to normalize a database
- How to create proper indexing in your database
- Work with SQL transactions

## Tasks

- Build the normalized database from the given dataset. Save the DDL commands into an SQL file.
- Write a service which generates new records for the dataset without changing the distributions
- Createa a Customer representative database:
  - name
  - address
  - phone number
- Generate random customer representative data
- Write a service which inserts new random data, even faulty data. It should be scheduled in cron job which is triggered every 30 minutes.
- Write a service which updates the random customer representative data from time to time
- You need to track all the changes in the customer representative table - take care of you need to keep the old data as well: e.g. we have to know that who was the company representative at a certain time
- The sales department asks a list of regular customers - 4 consecutive months they bought products

## General requirements

- DDL statements are stored in SQL files
- Database objects (table, columns, indexes, keys) are properly named
- Database is normalized (tables, conjunction table)
- Primary keys and foreign keys are properly used
- There is proper indexes on the tables
- Written services can be scheduled via cron job

## Hints

- Use TRIGGER to insert record changes into another table

## Starting repository and dataset

You can find the original dataset on [kaggle](https://www.kaggle.com/kyanyoga/sample-sales-data#sales_data_sample.csv). Kaggle is an AirBnB for Data Scientists – this is where they spend their nights and weekends. It’s a crowd-sourced platform to attract, nurture, train and challenge data scientists from all around the world to solve data science, machine learning and predictive analytics problems. It provides countless high quality datasets you can use to practice your data science skills.
Please register - the easiest way if you use your google authentication.
