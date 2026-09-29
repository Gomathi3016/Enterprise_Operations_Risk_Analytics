# Enterprise Operations & Risk Analytics

Enterprise operations analytics project focused on SLA performance, resolution time, operational risk, escalations, ticket priorities, issue categories, business processes, and regional performance.

The project demonstrates an end-to-end Data Analyst workflow using BigQuery, SQL, Python, and Power BI to transform operational ticket data into measurable business insights and recommendations.

## Project Overview

The objective of this project is to understand operational performance and identify areas where SLA management, risk monitoring, escalation handling, and process improvement can be strengthened.

The analysis focuses on:

- SLA compliance and SLA breaches
- Resolution time
- Operational risk
- Ticket priority
- Escalation patterns
- Issue categories
- Business processes
- Business-unit performance
- Regional performance
- Root-cause patterns
- Data quality

## Business Questions

- What is the overall SLA performance?
- Which ticket priorities experience the highest SLA breaches?
- How is risk associated with SLA performance?
- Which ticket segments have higher escalation rates?
- Which business units and processes show elevated breach rates?
- Are there meaningful regional differences?
- Which operational combinations represent potential hotspots?
- What data-quality issues could affect reporting?

## Dataset

The project contains 100,000 operational ticket records supported by reference tables for business units, issue categories, processes, and SLA targets.

Main datasets:

| Dataset - Description |

| tickets.csv - Main operational ticket dataset |
| business_units.csv - Business unit reference data |
| issue_categories.csv - Issue category reference data |
| processes.csv - Business process reference data |
| sla_targets.csv - SLA target reference data |

## Technology Stack

- BigQuery
- SQL
- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Power BI
- DAX
- GitHub

## Project Workflow

Dataset
→ BigQuery
→ Data Validation
→ SQL Analysis
→ Python EDA
→ Power BI Dashboard
→ Insights
→ Recommendations
→ GitHub Documentation

## Data Model

The main ticket table is connected with supporting reference tables.

tickets
├── business_units
├── issue_categories
├── processes
└── sla_targets

Key relationship fields include:

Business_Unit_ID
Process_ID
Category_ID
Priority

## Data Validation

The project includes validation of:

- Row counts
- Missing values
- Duplicate records
- Referential integrity
- SLA target mappings
- Categorical values
- Date fields

Important data-quality findings include:

- 1,200 tickets with missing Root_Cause values
- 28,397 tickets with missing Customer_Impact values
- Unknown Root_Cause values requiring further clarification

## Key Performance Metrics

| Metric = Result |

| Total Tickets = 100,000 |
| SLA Compliance = 69.45% |
| SLA Breach Rate = 30.55% |
| Average Resolution Time = 45.94 hours |
| Average Risk Score = 41.99 |
| High-Risk Ticket Share = 9.08% |
| Escalation Rate = 16.86% |

## Key Insights

### SLA Performance

Overall SLA compliance is 69.45%, meaning 30.55% of tickets breached their SLA target.

SLA performance varies considerably by ticket priority, making priority one of the most important dimensions for operational analysis.

### Priority Performance

Critical tickets have the highest SLA breach rate at 80.76%, followed by High-priority tickets at 54.19%.

Critical tickets also have higher average risk scores and escalation rates than lower-priority tickets.

This indicates that high-priority operational work requires closer monitoring.

### Risk and SLA Performance

Risk Score has a strong positive association with SLA breaches, with a correlation of approximately 0.744.

Risk Score also has a positive association with escalation activity, with a correlation of approximately 0.507.

These relationships indicate that higher-risk tickets are frequently associated with greater operational pressure. The relationships are statistical associations and do not by themselves establish causation.

### SLA Breaches and Escalations

SLA breach status and escalation activity have a correlation of approximately 0.679.

This indicates that tickets associated with SLA breaches are also more frequently associated with escalations.

### Business Unit and Process Performance

Differences between business units and processes are relatively small compared with the variation observed across ticket priorities.

Quality Assurance has an SLA breach rate of approximately 31.42%, while Manufacturing is approximately 29.78%.

Process-level SLA breach rates are also relatively close, suggesting that ticket characteristics such as priority and risk provide stronger differentiation than process alone.

### Regional Performance

Regional SLA breach rates are relatively similar, ranging from approximately 30.02% to 31.18%.

This suggests that region is not a major standalone driver of SLA performance in this dataset.

### Operational Hotspots

Several combinations of business unit and issue category show elevated SLA breach rates.

Examples include Process Delay within Customer Operations and Quality Assurance, as well as Documentation-related activity within Regulatory Affairs.

These combinations provide useful starting points for deeper operational investigation.

### Data Quality

Customer_Impact has substantial missing data, with 28,397 records affected.

Root_Cause also contains missing and Unknown values.

These issues reduce the reliability of impact and root-cause analysis and should be addressed as part of reporting improvement.


## Recommendations

### 1. Strengthen Critical and High-Priority Monitoring

Critical and High-priority tickets have substantially higher SLA breach rates.

Operational teams should consider tighter monitoring, earlier intervention, and stronger escalation controls for these ticket classes.

### 2. Use Risk Score for Early Warning

Because risk score has a strong association with SLA breaches, it can be incorporated into operational dashboards as an early-warning indicator.

### 3. Improve Escalation Management

Monitoring SLA breaches together with escalation activity can help identify tickets requiring additional operational attention.

### 4. Investigate Operational Hotspots

Process Delay and Documentation-related combinations with elevated breach rates should be reviewed for workflow delays, handoff issues, documentation requirements, or resource constraints.

### 5. Improve Data Quality

Customer_Impact and Root_Cause should be standardized and completed more consistently.

Improved data quality would strengthen root-cause analysis, customer-impact reporting, and operational decision-making.

## Power BI Dashboard

The Power BI dashboard provides an interactive view of operational performance.

Key dashboard areas include:

- SLA compliance
- SLA breach rate
- Average resolution time
- Risk exposure
- Escalation rate
- Priority performance
- Business-unit performance
- Issue-category analysis
- Process performance
- Regional performance
- Monthly operational trends
- High-risk ticket analysis

Interactive filters allow users to explore performance by priority, business unit, region, issue category, process, risk category, and SLA status.

## Python Analysis

Python was used for:

- Data loading
- Data validation
- Data cleaning
- Exploratory data analysis
- KPI calculations
- Group-level analysis
- Correlation analysis
- Risk analysis
- Operational trend analysis
- Visualization

Main libraries:

Pandas
NumPy
Matplotlib
Seaborn

## SQL Analysis

BigQuery SQL was used for:

- Aggregations
- JOINs
- CTEs
- Window functions
- Ranking
- SLA calculations
- Priority analysis
- Risk analysis
- Business-unit analysis
- Regional analysis
- Process analysis
- Trend analysis

## Skills Demonstrated

SQL | BigQuery | Python | Pandas | NumPy | Data Cleaning | EDA | Statistical Analysis | Power BI | DAX | KPI Development | SLA Analysis | Risk Analysis | Operational Analytics | Data Visualization | Business Insights | Data Quality

## Repository Structure

Enterprise_Operations_Risk_Analytics/

├── data/
│   └── operational datasets
│
├── sql/
│   └── analysis_queries.sql
│
├── python/
│   ├── Enterprise_Operations_analytics.ipynb
│   └── Enterprise_Operations_analytics.py
│
├── powerbi/
│   └── Enterprise_Operations_Risk_Analytics.pbix
│
├── image/
│   └── dashboard.png
│
└── README.md

## Business Value

The project demonstrates how operational ticket data can be transformed into actionable insights for SLA management, risk monitoring, escalation management, and process improvement.

The analysis shows that priority and risk provide stronger differentiation in operational performance than broad regional or business-unit comparisons.

The findings can support better operational monitoring, risk-based prioritization, escalation management, process improvement, and data-quality initiatives.

## Conclusion

The analysis of 100,000 operational tickets shows an overall SLA compliance rate of 69.45% and a breach rate of 30.55%.

Critical and High-priority tickets show substantially higher SLA breach and escalation rates, while risk score has a strong association with SLA performance.

Business-unit, regional, and process differences are comparatively narrower, indicating that operational performance is better understood through combinations of priority, risk, issue type, and process.

Overall, the project demonstrates an end-to-end Data Analyst workflow from raw operational data through BigQuery SQL analysis, Python EDA, Power BI reporting, insights, and business recommendations.

## Author

Gomathi

Data Analyst | SQL | Python | Power BI | BigQuery
