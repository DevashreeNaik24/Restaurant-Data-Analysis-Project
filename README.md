# Restaurant-Data-Analysis-Project
This project focuses on analyzing a dataset of restaurants to uncover insights about restaurant chains, their popularity, and ratings. The analysis involves identifying restaurant chains, evaluating their performance, and visualizing key metrics.

Table of Contents
	•	Project Overview
	•	Features
	•	Technologies Used
	•	Dataset
	•	Setup and Installation
	•	Project Workflow
	•	Key Insights
	•	Visualizations
	•	Usage
	•	Results
	•	License
	•	Contact

 Project Overview

This project analyzes a dataset of restaurants to identify:
	1.	Restaurant chains and their distribution.
	2.	Ratings and popularity of different chains.
	3.	Patterns in user reviews and votes.

The goal is to generate insights that can help understand customer preferences and business performance across restaurant chains.

Features
	•	Restaurant Chain Identification:
	•	Identify chains with multiple locations.
	•	Popularity Analysis:
	•	Total votes received by each chain.
	•	Rating Analysis:
	•	Average ratings of top chains.
  • Price Range Distribution
  • City Analysis
  • Restaurant Ratings
  • Cuisine Combination
  • Geographic Analysis
  • Restaurant Chains
  • Online Delivery
	•	Visualization:
	•	Generate bar charts to visualize popularity and ratings.
	•	Report Generation:
	•	Exported results and charts to CSV and PNG files.
	•	Created a professional report in PDF format.

 Technologies Used
	•	Programming Language: Python,R
	•	Libraries:
	•	pandas: Data manipulation and analysis
	•	matplotlib and seaborn: Data visualization
	•	fpdf2: Report generation
  • dplyr
  • sf
  • reshape2
	•	Environment:
	•	Google Colab , R Studio , Microsoft Excel

 Dataset
	•	The dataset includes information about restaurants such as:
	•	Restaurant_Name: Name of the restaurant.
	•	Rating: Average rating of the restaurant.
	•	Votes: Total votes received by the restaurant.
	•	Other columns: Latitude, Longitude, and Cuisine.

 Setup and Installation
 1.	Clone the Repository
 2.	Install Required Libraries: pip install pandas matplotlib seaborn fpdf2
 3.	Prepare the Dataset:
Place your dataset (Dataset.csv) in the project folder.
4.	Run the Analysis:
Open the restaurant_analysis.ipynb file in Jupyter Notebook or execute the restaurant_analysis.py script.

Project Workflow
	1.	Load Dataset:
	•	Load the dataset into a pandas DataFrame.
	2.	Identify Chains:
	•	Count occurrences of restaurant names.
	•	Filter restaurants with multiple locations.
	3.	Popularity and Rating Analysis:
	•	Calculate total votes and average ratings for each chain.
	4.	Visualize Results:
	•	Generate bar charts for popularity and ratings.

Key Insights
	•	Identified the most popular chains based on total votes.
	•	Highlighted chains with the highest average ratings.
	•	Visualized trends in restaurant performance using charts.

 Visualizations

Top 10 Restaurant Chains by Popularity
Average Ratings of Top 10 Chains

Usage
	1.	Run the Analysis Script
  2.	View Results:
	•	Open the generated Restaurant_Chain_Summary.csv for chain analysis.
	•	View visualizations in PNG format.
	•	Read the detailed report in PDF format.

 Results
	•	Restaurant_Chain_Summary.csv:
	•	Contains popularity and rating statistics for each chain.
	•	Visualizations:
	•	Top_10_Chain_Popularity.png
	•	Top_10_Chain_Ratings.png
	•	Report:
	•	Restaurant_Analysis_Report.pdf etc.

 License

This project is licensed under the MIT License. See the LICENSE file for details.

Contact

For questions or collaborations, feel free to reach out:
	•	Name: Devashree Naik
	•	Email: devashreenaik2431@gmail.com



 
