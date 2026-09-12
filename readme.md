**# Enterprise Operations \& Risk Analytics**



**## Project Overview**



This project analyzes enterprise operational ticket data to identify SLA performance issues, operational bottlenecks, escalation patterns, and risk hotspots.



The analysis was designed to demonstrate an end-to-end Data Analyst workflow using SQL, Python, and Power BI.



The project uses a synthetic enterprise operations dataset containing 100,000 tickets across multiple business units, processes, regions, priorities, issue categories, and risk levels.



\---



**## Business Problem**



Enterprise operations teams need to understand:



\- Which areas are missing SLA targets?

\- Which business units and processes create operational bottlenecks?

\- How does operational risk relate to SLA performance?

\- Are escalated tickets associated with longer resolution times?

\- Which ticket priorities require the most attention?

\- Are there data-quality issues that could affect reporting?



The objective was to transform raw operational data into actionable insights through SQL analysis, Python-based exploration, and an interactive Power BI dashboard.



\---



**## Tools \& Technologies**



\- SQL: Google BigQuery

\- Python: Pandas, NumPy, Matplotlib, Seaborn

\- BI \& Visualization: Microsoft Power BI

\- Data Preparation: Python / Pandas

\- Data Storage: CSV / BigQuery

\- Documentation: Markdown



\---



**## Dataset**



The dataset contains 100,000 operational tickets covering approximately two years.



**Key fields include:**



\- Ticket ID

\- Business Unit

\- Process

\- Region

\- Priority

\- Created Date

\- Resolution Hours

\- SLA Hours

\- SLA Breached

\- Risk Score

\- Risk Category

\- Escalation Flag

\- Root Cause

\- Customer Impact



The dataset is synthetic and was created specifically for portfolio and analytical learning purposes.



\---



**Analytical Approach**

The project followed an end-to-end analytical workflow:



Raw Operational Data

&#x20;       ↓

Data Cleaning \& Validation

&#x20;       ↓

BigQuery SQL Analysis

&#x20;       ↓

Python Exploratory Data Analysis

&#x20;       ↓

KPI \& Operational Insights

&#x20;       ↓

Power BI Dashboard

&#x20;       ↓

Business Recommendations



\---



**## Analysis Performed**



**### 1. Overall Operational Performance**



Analyzed:



\- Total ticket volume

\- Average resolution time

\- SLA compliance

\- SLA breach rate

\- Average risk score

\- Escalation rate



**### 2. Business Unit Analysis**



Compared business units based on:



\- Ticket volume

\- Average resolution time

\- SLA compliance

\- Risk score

\- Escalation activity



**### 3. Risk Analysis**



Analyzed operational performance across:



\- Low-risk tickets

\- Medium-risk tickets

\- High-risk tickets



High-risk tickets showed substantially weaker SLA performance and higher average risk scores.



**### 4. Priority Analysis**



Evaluated SLA performance across:



\- Critical

\- High

\- Medium

\- Low



The analysis highlighted the importance of evaluating resolution time relative to the SLA target rather than using resolution time alone.



**### 5. Escalation Analysis**



Compared escalated and non-escalated tickets using:



\- Average resolution time

\- SLA compliance

\- Risk score

\- Ticket volume



Escalated tickets were associated with significantly longer resolution times and higher risk scores.



**### 6. Process \& Operational Hotspots**



A business-unit/process analysis was performed to identify combinations with weaker SLA performance and higher operational workload.



One notable hotspot was:



Supply Chain → Production Support



This combination showed relatively high resolution time, weaker SLA compliance, and elevated escalation activity.



**### 7. Monthly Trend Analysis**



Analyzed monthly SLA compliance and resolution performance to identify:



\- Performance trends

\- Peaks and declines

\- Potential periods requiring investigation



Overall SLA performance remained relatively stable over the analysis period.



**### 8. Data Quality Analysis**



Reviewed missing and unknown values in important fields such as:



\- Root Cause

\- Customer Impact



This highlighted opportunities for improving data completeness and reporting reliability.



\---



**## Key Findings**



**### Overall KPIs**



* Total Tickets - 100,000
* Average Resolution Time - 45.94 hours
* SLA Compliance - 69.45% 
* SLA Breach Rate - 30.55% 
* Average Risk Score - 41.99 
* Escalation Rate - 16.86% 



\---



**### Major Insights**



\- Overall SLA compliance was approximately 69.45%, indicating a significant opportunity for operational improvement.

\- High-risk tickets had extremely low SLA compliance, making them an important area for operational prioritization.

\- Escalated tickets had substantially higher average resolution times than non-escalated tickets.

\- Critical tickets had relatively short absolute resolution times but much tighter SLA targets, resulting in poor SLA compliance.

\- Business-unit SLA performance was relatively similar overall, suggesting that operational issues were not concentrated in a single business unit.

\- Specific business-unit/process combinations revealed more meaningful operational hotspots.

\- Root-cause categories showed relatively modest differences in SLA performance, while missing/unknown root-cause information represented a data-quality opportunity.

\- Customer impact did not strongly differentiate SLA performance in this dataset.



\---



**## Power BI Dashboard**



The final Power BI dashboard provides an interactive view of:



\- Overall operational KPIs

\- SLA compliance by risk category

\- SLA compliance by priority

\- SLA compliance by business unit

\- Monthly SLA trends

\- Escalated vs non-escalated resolution performance

\- Business-unit/process hotspots

\- Regional and risk-level filtering



Users can interact with the dashboard using **slicers** for:



\- Region

\- Priority

\- Risk Category



\---



**## Project Structure**



Enterprise\_Operations\_Risk\_Analytics/

│

├── data/

│   └── enterprise\_operations\_risk\_analytics\_clean.csv

│

├── sql/

│   └── analysis\_queries.sql

│

├── python/

│   ├── Enterprise\_Operations\_analytics.ipynb

│   └── enterprise\_operation\_analytics.py

│

├── powerbi/

│   └── Enterprise\_Operations\_Risk\_Analytics.pbix

│

├── images/

│   └── dashboard.png

│

└── README.md



**Business Recommendations**

Based on the analysis, operations teams should consider:



* Prioritizing high-risk tickets for proactive intervention.
* Investigating recurring process-level SLA hotspots rather than focusing only on business-unit averages.
* Reviewing escalation drivers and early-warning indicators.
* Monitoring critical-ticket performance against their tighter SLA targets.
* Improving root-cause data completeness to support more reliable operational reporting.
* Using Power BI monitoring to track SLA performance and emerging operational risks.





**Limitations**

* The dataset is synthetic and does not represent real company performance.
* Observed relationships are associations and should not be interpreted as causal relationships.
* Business-unit differences were relatively small, so process-level analysis provided more useful differentiation.
* Customer impact was categorical and was therefore analyzed as a category rather than converted into arbitrary numeric scores.



**Skills Demonstrated**

* SQL data analysis
* BigQuery
* Data cleaning and validation
* Exploratory Data Analysis
* Python / Pandas
* KPI development
* Business performance analysis
* SLA analysis
* Risk analysis
* Operational hotspot analysis
* Data visualization
* Power BI dashboard development
* Business insight generation















