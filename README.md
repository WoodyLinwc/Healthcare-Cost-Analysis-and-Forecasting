# Healthcare Cost Analysis and Forecasting

## Project Overview
This project analyzes Medicare Part D drug spending data from 2018-2022, providing insights into healthcare costs through data analysis and visualization. The analysis includes spending patterns, manufacturer market share, and various cost efficiency metrics.

## Data Source
- [Medicare Part D Drug Spending Data (2018-2022)](https://data.cms.gov/summary-statistics-on-use-and-payments/medicare-medicaid-spending-by-drug/medicare-part-d-spending-by-drug) 

- Source: Centers for Medicare & Medicaid Services (CMS)

- Dataset: Medicare Part D Spending by Drug (Latest data available)

## Key Features
- Data cleaning and preprocessing

- Comprehensive data analysis

- Interactive visualizations

- SQL analytics queries

- Tableau dashboards

## Technologies
- **Python**: main programming language used here for data cleaning, analysis, and visualization

- **PostgreSQL**: a database system to store our cleaned Medicare data

- **Tableau**: a data visualization tool that makes data insights easily understandable

## Python Libraries
- **pandas**: reading and cleaning the Medicare dataset

- **numpy**: calculating spending averages and percentages

- **scikit-learn**: computing mean absolute error for spending analysis

- **plotly**: visualizing spending patterns over time

- **SQLAlchemy**: storing cleaned data in PostgreSQL

## Installation & Setup

1. Clone the repository
```
git clone https://github.com/WoodyLinwc/Healthcare-Cost-Analysis-and-Forecasting
cd healthcare-cost-analysis
```

2. Create virtual environment
```
python3.10 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```
3. Install required packages
```
pip install -r requirements.txt
```
4. Set up PostgreSQL database
```
createdb healthcare_costs
```

## Workflow
1. Data Preparation: 
    - Place the CMS dataset (DSD_PTD_RY24_P04_V10_DY22_BGM.csv) in the data/raw/ folder

2. Data Processing:
    - Run `01_data_cleaning.ipynb` inside the notebooks/ folder

    - Reads raw data from `data/raw/DSD_PTD_RY24_P04_V10_DY22_BGM.csv`

    - Cleans and processes the data

    - Saves cleaned data to `data/processed/cleaned_medicare_spending.csv`

    - Stores data in PostgreSQL database

3. Tableau Visualizations:
    - Connect Tableau to the cleaned data in `data/processed/cleaned_medicare_spending.csv`

    - View or recreate the following visualizations and more:
        - Top 10 Drugs by Spending 2022
        ![](./img/Top%2010%20Drugs%20by%20Spending%202022.png)

        - Manufacturer Market Share 2022
        ![](./img/Manufacturer%20Market%20Share%202022.png)

        - Outlier Analysis
        ![](./img/Outlier%20Analysis.png)

