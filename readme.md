# Enterprise Operations & Risk Analytics

End-to-end operational analytics project using BigQuery, Python, and Power BI to analyze SLA performance, resolution time, operational risk, escalations, and business-unit performance.

## Objective

Identify operational bottlenecks, high-risk ticket segments, SLA issues, and areas for process improvement.

## Tech Stack

- BigQuery
- SQL
- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Power BI
- DAX

## Key Metrics

| Metric - Result |

| Total Tickets - 100,000 |
| SLA Compliance - 69.45% |
| SLA Breach Rate - 30.55% |
| Average Resolution Time - 45.94 hours |
| Average Risk Score - 41.99 |
| High-Risk Ticket Share - 9.08% |
| Escalation Rate - 16.86% |

## Key Insights

- Critical tickets have an 80.76% SLA breach rate, compared with 54.19% for High-priority tickets.
- Risk Score has a strong positive association with SLA breaches.
- SLA breaches are also strongly associated with escalations.
- Business-unit, regional, and process-level differences are comparatively smaller than priority-level differences.
- Process Delay and Documentation combinations show elevated SLA breach rates.
- Customer Impact contains substantial missing data, limiting impact analysis.
- Root Cause data also requires quality improvement.

## Recommendations

- Prioritize monitoring of Critical and High-risk tickets.
- Use risk scores as an early-warning indicator for potential SLA breaches.
- Strengthen escalation monitoring for high-risk and overdue tickets.
- Investigate Process Delay and Documentation hotspots.
- Improve completeness and standardization of Customer Impact and Root Cause fields.

## Power BI Dashboard

The dashboard includes:

- SLA performance
- Resolution time
- Risk analysis
- Escalations
- Priority performance
- Business-unit performance
- Regional analysis
- Operational trends
- High-risk ticket analysis

## Repository Structure

Enterprise_Operations_Risk_Analytics/

├── data/
├── sql/
├── python/
├── powerbi/
├── image/
└── README.md

## Skills Demonstrated

SQL | BigQuery | Python | Pandas | Data Cleaning | EDA | DAX | Power BI | KPI Development | Risk Analysis | SLA Analysis | Business Insights


## Author

Gomathi

Data Analyst | SQL | Python | Power BI | BigQuery
