# Indian Parliament Election Analysis

## Overview

This project analyzes the election data related to the Indian Parliament, focusing on various aspects such as the total number of seats, party alliances, election results, and candidate performance. The goal is to provide insights into the electoral landscape of India, particularly for the upcoming 2024 elections.

## Features

- **Seat Count Analysis**: Determine the total number of seats in the Indian Parliament and the distribution of seats across different states.
- **Party Alliance Performance**: Analyze total seats won by major alliances, including NDA and I.N.D.I.A.
- **Candidate Performance**: Identify the candidates with the highest number of EVM and postal votes, as well as winning and runner-up candidates in each constituency.
- **Election Results Summary**: Generate summaries of the election results for each state and constituency.

## Technologies Used

- **Database**: SQL
- **Data Source**: Custom datasets for constituency, party, and election results.

## Getting Started

### Prerequisites

- SQL database management system (e.g., MySQL, PostgreSQL)
- Access to the relevant datasets for analysis

### Running the Queries

1. Import the SQL queries provided in this repository into your SQL environment.
2. Execute the queries to analyze the election data.

### Example Queries

- **Total Seats in Indian Parliament**:
    ```sql
    SELECT COUNT(Parliament_Constituency) AS Total_Seats
    FROM constituencywise_results;
    ```

- **Total Seats by State**:
    ```sql
    SELECT s.state AS State_Name,
    COUNT(cr.parliament_constituency) AS Total_Seats
    FROM constituencywise_results cr
    INNER JOIN statewise_results sr ON cr.parliament_constituency = sr.parliament_constituency
    INNER JOIN states s ON s.state_id = sr.state_id
    GROUP BY s.state;
    ```

## Insights

- Summary of key findings from your analysis (e.g., which party won the most seats, demographic trends among voters, etc.).

