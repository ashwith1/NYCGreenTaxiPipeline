# NYC Green Taxi Data Pipeline

An end-to-end cloud-based data engineering pipeline built on Microsoft Azure for analyzing NYC Green Taxi trip data from 2022. This project demonstrates modern data engineering practices including data ingestion, transformation, storage, and visualization using Azure services.

![Architecture](DE2%20Architecture.jpg)

## Project Overview

This data engineering project implements a complete ETL (Extract, Transform, Load) pipeline that processes over 80 million records of NYC Green Taxi trip data. The pipeline automates data ingestion from CSV sources, performs transformations using Azure Data Factory, stores data in Azure SQL Database, and provides interactive visualizations through Power BI.

## Architecture

The pipeline follows a modern cloud data architecture pattern:

1. **Data Source**: NYC TLC Green Taxi Trip Records (2022)
2. **Data Ingestion**: Azure Data Factory pipelines
3. **Data Storage**: Azure Data Lake Storage Gen2 + Azure SQL Database
4. **Data Transformation**: Azure Data Factory data flows
5. **Data Visualization**: Power BI Dashboard
6. **Orchestration**: Azure Data Factory scheduling and monitoring

## Key Features

- **Scalable Cloud Architecture**: Fully cloud-based solution using Azure services
- **Automated ETL Pipeline**: Scheduled data ingestion and transformation
- **Data Quality Management**: Built-in validation and error handling
- **Interactive Dashboard**: Real-time analytics and visualizations
- **Cost-Optimized**: Efficient use of Azure resources
- **Comprehensive Documentation**: Detailed project report and architecture diagrams

## Tech Stack

### Azure Services
- **Azure Data Factory**: ETL orchestration and data movement
- **Azure Data Lake Storage Gen2**: Raw and processed data storage
- **Azure SQL Database**: Structured data warehouse
- **Azure Synapse Analytics**: (Optional) Advanced analytics workloads

### Visualization & Reporting
- **Power BI Desktop**: Interactive dashboard development
- **Power BI Service**: Dashboard publishing and sharing

### Data Format
- **CSV**: Source data format
- **Parquet**: Optimized storage format
- **SQL**: Relational database storage

## Project Structure

```
NYCGreenTaxiPipeline/
├── 2022_Green_Taxi_Trip_Data_20240606.csv    # Source dataset (82 MB)
├── DE2 Architecture.jpg                      # System architecture diagram
├── NYCDashboard.pbix                         # Power BI dashboard file
├── Project Details.pdf                       # Project overview PDF
├── Project Report.docx                       # Comprehensive project report
├── ProjectPPT.pptx                           # Project presentation
├── data_dictionary_trip_records_green.pdf    # Data schema documentation
└── Azure Files/                              # Azure Data Factory configurations
    ├── NewYorkTaxiDataFactory/               # Main ADF project
    ├── data/                                 # Sample data files
    ├── dataset/                              # ADF dataset definitions
    ├── factory/                              # Factory configuration
    ├── linkedService/                        # Connection configurations
    ├── pipeline/                             # ETL pipeline definitions
    ├── sql queries/                          # SQL transformation scripts
    └── templates/                            # ARM templates
```

## Dataset Information

### NYC Green Taxi Trip Records (2022)

- **Source**: NYC Taxi and Limousine Commission (TLC)
- **Period**: January 2022 - December 2022
- **Size**: 82 MB (CSV format)
- **Records**: Approximately 1 million+ trip records
- **Update Frequency**: Monthly

### Key Data Fields

- **Trip Information**: Pickup/dropoff datetime, trip distance, trip duration
- **Location Data**: Pickup/dropoff location IDs, coordinates
- **Fare Details**: Fare amount, extra charges, tolls, tips, total amount
- **Payment**: Payment type (credit card, cash, etc.)
- **Passenger Count**: Number of passengers per trip
- **Rate Code**: Taxi rate code applied

For complete field descriptions, see `data_dictionary_trip_records_green.pdf`

## Pipeline Workflow

### 1. Data Ingestion

- Source data downloaded from NYC TLC website
- Uploaded to Azure Data Lake Storage Gen2
- Automated ingestion pipeline using Azure Data Factory
- Incremental loading capability for new data

### 2. Data Transformation

- **Data Cleaning**:
  - Remove null and invalid records
  - Filter outliers and anomalies
  - Standardize data formats
  - Validate data types

- **Data Enrichment**:
  - Calculate trip duration
  - Derive time-based features (hour, day, month)
  - Create aggregations and metrics
  - Join with lookup tables

- **Data Quality Checks**:
  - Validate fare calculations
  - Check location ID validity
  - Ensure datetime consistency
  - Monitor data completeness

### 3. Data Loading

- Load transformed data to Azure SQL Database
- Create fact and dimension tables
- Build optimized indexes
- Implement partitioning strategies

### 4. Data Visualization

- Connect Power BI to Azure SQL Database
- Build interactive dashboards
- Create key performance indicators (KPIs)
- Enable drill-down analytics

## Azure Data Factory Components

### Datasets

Define data structures for:
- Source CSV files
- Intermediate Parquet files
- Target SQL tables

### Linked Services

Connections to:
- Azure Data Lake Storage Gen2
- Azure SQL Database
- Azure Key Vault (for secrets)

### Pipelines

Orchestration workflows:
- Data ingestion pipeline
- Data transformation pipeline
- Data loading pipeline
- Master pipeline (orchestrates all)

### Data Flows

Visual data transformation logic:
- Source transformations
- Join operations
- Aggregations
- Sink configurations

## Power BI Dashboard

**File**: `NYCDashboard.pbix`

### Dashboard Features

- **Trip Analysis**: Total trips, average fare, trip distance trends
- **Temporal Patterns**: Hourly, daily, monthly trip distributions
- **Geographic Insights**: Popular pickup/dropoff locations
- **Revenue Metrics**: Total revenue, tip percentages, payment types
- **Performance KPIs**: Average trip duration, trips per hour
- **Interactive Filters**: Date range, location, payment type

### Visualizations

- Line charts for time-series trends
- Bar charts for categorical comparisons
- Maps for geographic distribution
- Cards for key metrics
- Tables for detailed data

## Setup Instructions

### Prerequisites

- Microsoft Azure subscription
- Azure Data Factory instance
- Azure Data Lake Storage Gen2 account
- Azure SQL Database
- Power BI Desktop
- Azure Storage Explorer (optional)

### Deployment Steps

1. **Create Azure Resources**
   ```bash
   # Create Resource Group
   az group create --name rg-nyc-taxi --location eastus
   
   # Create Storage Account
   az storage account create --name stnyctaxi --resource-group rg-nyc-taxi
   
   # Create Data Factory
   az datafactory create --resource-group rg-nyc-taxi --name adf-nyc-taxi
   
   # Create SQL Database
   az sql server create --name sql-nyc-taxi --resource-group rg-nyc-taxi
   az sql db create --name nyctaxidb --server sql-nyc-taxi
   ```

2. **Upload Source Data**
   - Upload `2022_Green_Taxi_Trip_Data_20240606.csv` to Azure Data Lake
   - Organize in appropriate folder structure

3. **Deploy ADF Components**
   - Import linked services from `Azure Files/linkedService/`
   - Import datasets from `Azure Files/dataset/`
   - Import pipelines from `Azure Files/pipeline/`
   - Update connection strings and credentials

4. **Execute SQL Scripts**
   - Run table creation scripts from `Azure Files/sql queries/`
   - Create indexes and constraints
   - Set up stored procedures

5. **Run Pipeline**
   - Trigger initial pipeline execution
   - Monitor pipeline runs
   - Validate data in SQL Database

6. **Configure Power BI**
   - Open `NYCDashboard.pbix`
   - Update data source connections
   - Refresh data
   - Publish to Power BI Service

## SQL Database Schema

### Fact Table: Trip_Fact

- trip_id (PK)
- pickup_datetime
- dropoff_datetime
- pickup_location_id (FK)
- dropoff_location_id (FK)
- passenger_count
- trip_distance
- fare_amount
- tip_amount
- total_amount
- payment_type_id (FK)

### Dimension Tables

- **Dim_Location**: Location details and zones
- **Dim_Payment**: Payment type descriptions
- **Dim_Date**: Date hierarchy for time analysis
- **Dim_Time**: Time of day categorization

## Key Insights from Analysis

Based on the dashboard and analysis:

- **Peak Hours**: Higher trip volumes during morning (7-9 AM) and evening (5-7 PM) rush hours
- **Revenue Patterns**: Weekend trips tend to have higher average fares
- **Payment Preferences**: Credit card usage increasing over cash payments
- **Trip Characteristics**: Average trip distance of 3-5 miles
- **Seasonal Trends**: Trip volume variations across months

## Performance Optimization

### Data Factory
- Parallel processing using partitioning
- Incremental data loading
- Optimized data flow transformations
- Activity retry policies

### SQL Database
- Columnstore indexes for analytics
- Table partitioning by date
- Query performance tuning
- Statistics updates

### Cost Management
- Auto-pause for SQL Database
- Lifecycle management for storage
- Scheduled pipeline execution
- Resource tagging for cost tracking

## Monitoring and Logging

- Azure Data Factory monitoring dashboard
- Pipeline run history and metrics
- SQL Database query performance insights
- Azure Monitor integration
- Alert configuration for failures

## Documentation

### Project Report
**File**: `Project Report.docx`
- Detailed methodology
- Design decisions
- Implementation steps
- Results and findings
- Challenges and solutions

### Project Presentation
**File**: `ProjectPPT.pptx`
- Executive summary
- Architecture overview
- Key results
- Demo screenshots
- Recommendations

### Project Details
**File**: `Project Details.pdf`
- Quick reference guide
- Architecture diagram
- Component descriptions

## Technologies and Skills Demonstrated

- **Cloud Computing**: Microsoft Azure platform expertise
- **Data Engineering**: ETL pipeline design and implementation
- **Data Warehousing**: Dimensional modeling and schema design
- **SQL**: Complex queries, optimization, and database management
- **Data Visualization**: Power BI dashboard development
- **DevOps**: Infrastructure as Code (ARM templates)
- **Data Quality**: Validation and cleansing techniques
- **Project Management**: Documentation and presentation

## Future Enhancements

- [ ] Real-time streaming data ingestion using Azure Event Hubs
- [ ] Machine learning models for fare prediction
- [ ] Integration with weather and traffic data
- [ ] Advanced analytics with Azure Synapse Analytics
- [ ] Automated anomaly detection
- [ ] Data quality monitoring dashboard
- [ ] CI/CD pipeline for ADF deployments
- [ ] Multi-year historical analysis
- [ ] Integration with Databricks for advanced processing
- [ ] API development for data access

## Lessons Learned

- Importance of data profiling before pipeline development
- Value of incremental loading for large datasets
- Need for comprehensive error handling and logging
- Benefits of modular pipeline design
- Cost implications of always-on resources

## Contributing

This is an academic project, but suggestions and feedback are welcome. Please open an issue for any improvements or questions.

## License

This project is created for educational purposes as part of Data Engineering coursework.

## Data Source Attribution

Data provided by NYC Taxi and Limousine Commission (TLC).
For more information: [NYC TLC Trip Record Data](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page)

## Contact

For questions or discussions about this project, please open an issue on the [GitHub repository](https://github.com/ashwith1/NYCGreenTaxiPipeline).

## Acknowledgments

- NYC Taxi and Limousine Commission for providing open data
- Data Engineering 2 course instructors
- Microsoft Azure documentation and community
- Power BI community for visualization best practices

---

**Project Status**: Completed

**Last Updated**: June 2024
