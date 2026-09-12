#Info check
SELECT
  table_name
FROM `operations_analytics.INFORMATION_SCHEMA.TABLES`;

#info check with datatypes
SELECT
    column_name,
    data_type
FROM `enterprise-operation-analytics.operations_analytics.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'tickets'
ORDER BY ordinal_position;

#row count check
SELECT 'business_units' AS table_name, COUNT(*) AS row_count
FROM `operations_analytics.business_units`

UNION ALL

SELECT 'processes', COUNT(*)
FROM `operations_analytics.processes`

UNION ALL

SELECT 'issue_categories', COUNT(*)
FROM `operations_analytics.issue_categories`

UNION ALL

SELECT 'sla_targets', COUNT(*)
FROM `operations_analytics.sla_targets`

UNION ALL

SELECT 'tickets', COUNT(*)
FROM `operations_analytics.tickets`;


#Preview main table
SELECT *
FROM `operations_analytics.tickets`
LIMIT 10;

#total no of tickets
SELECT COUNT(*) AS total_tickets
FROM `enterprise-operation-analytics.operations_analytics.tickets`;

#operational risk KPIs
SELECT
    COUNT(*) AS total_tickets,

    ROUND(AVG(Resolution_Hours), 2) AS avg_resolution_hours,

    ROUND(
        100 * COUNTIF(SLA_Breached = FALSE) / COUNT(*),
        2
    ) AS sla_compliance_pct,

    ROUND(AVG(Risk_Score), 2) AS avg_risk_score

FROM `enterprise-operation-analytics.operations_analytics.tickets`;

#Which business units are responsible for the highest SLA breach rates and operational risk?
SELECT
    b.Business_Unit,
    COUNT(*) AS total_tickets,
    ROUND(AVG(t.Resolution_Hours), 2) AS avg_resolution_hours,
    ROUND(
        100 * COUNTIF(t.SLA_Breached = FALSE) / COUNT(*),
        2
    ) AS sla_compliance_pct,
    ROUND(AVG(t.Risk_Score), 2) AS avg_risk_score
FROM `enterprise-operation-analytics.operations_analytics.tickets` AS t
JOIN `enterprise-operation-analytics.operations_analytics.business_units` AS b
    ON t.Business_Unit_ID = b.Business_Unit_ID
GROUP BY
    b.Business_Unit
ORDER BY
    sla_compliance_pct ASC;

#Which issue categories are responsible for the highest SLA breach rates and operational risk / Which types of problems are most difficult to resolve?
SELECT
    c.Issue_Category,
    COUNT(*) AS total_tickets,
    COUNTIF(t.SLA_Breached = TRUE) AS sla_breaches,
    ROUND(
        100 * COUNTIF(t.SLA_Breached = FALSE) / COUNT(*),
        2
    ) AS sla_compliance_pct,
    ROUND(AVG(t.Resolution_Hours), 2) AS avg_resolution_hours,
    ROUND(AVG(t.Risk_Score), 2) AS avg_risk_score
FROM `enterprise-operation-analytics.operations_analytics.tickets` AS t
JOIN `enterprise-operation-analytics.operations_analytics.issue_categories` AS c
    ON t.Category_ID = c.Category_ID
GROUP BY
    c.Issue_Category
ORDER BY
    sla_compliance_pct ASC;


# check whether High/Critical risk tickets are associated with SLA breaches.
SELECT
    t.Risk_Category,
    COUNT(*) AS total_tickets,
    COUNTIF(t.SLA_Breached = TRUE) AS sla_breaches,
    ROUND(100 * COUNTIF(t.SLA_Breached = FALSE) / COUNT(*), 2) AS sla_compliance_pct,
    ROUND(AVG(t.Resolution_Hours), 2) AS avg_resolution_hours,
    ROUND(AVG(t.Risk_Score), 2) AS avg_risk_score
FROM `enterprise-operation-analytics.operations_analytics.tickets` AS t
GROUP BY t.Risk_Category
ORDER BY avg_risk_score DESC;

#Is operational performance improving or deteriorating over time?
SELECT
    EXTRACT(YEAR FROM Created_Date) AS year,
    EXTRACT(MONTH FROM Created_Date) AS month,
    COUNT(*) AS total_tickets,
    ROUND(AVG(Resolution_Hours), 2) AS avg_resolution_hours,
    ROUND(100 * COUNTIF(SLA_Breached = FALSE) / COUNT(*), 2) AS sla_compliance_pct,
    ROUND(AVG(Risk_Score), 2) AS avg_risk_score
FROM `enterprise-operation-analytics.operations_analytics.tickets`
GROUP BY year, month
ORDER BY year, month;

#identify which combination of Business Unit + Process is creating the greatest operational risk.
SELECT
    b.Business_Unit,
    p.Process,
    COUNT(*) AS total_tickets,
    ROUND(AVG(t.Resolution_Hours), 2) AS avg_resolution_hours,
    ROUND(100 * COUNTIF(t.SLA_Breached = FALSE) / COUNT(*), 2) AS sla_compliance_pct,
    ROUND(AVG(t.Risk_Score), 2) AS avg_risk_score,
    COUNTIF(t.Escalation_Flag = TRUE) AS escalations
FROM `enterprise-operation-analytics.operations_analytics.tickets` AS t
JOIN `enterprise-operation-analytics.operations_analytics.business_units` AS b
    ON t.Business_Unit_ID = b.Business_Unit_ID
JOIN `enterprise-operation-analytics.operations_analytics.processes` AS p
    ON t.Process_ID = p.Process_ID
GROUP BY
    b.Business_Unit,
    p.Process
ORDER BY
    avg_risk_score DESC;

#Do escalated tickets actually have worse operational performance?
SELECT
    CASE
        WHEN Escalation_Flag = TRUE THEN 'Escalated'
        ELSE 'Not Escalated'
    END AS escalation_status,
    COUNT(*) AS total_tickets,
    ROUND(AVG(Resolution_Hours), 2) AS avg_resolution_hours,
    ROUND(100 * COUNTIF(SLA_Breached = FALSE) / COUNT(*), 2) AS sla_compliance_pct,
    ROUND(AVG(Risk_Score), 2) AS avg_risk_score,
    ROUND(100 * AVG(SAFE_CAST(Customer_Impact AS FLOAT64)), 2) AS avg_customer_impact_pct
FROM `enterprise-operation-analytics.operations_analytics.tickets`
GROUP BY escalation_status
ORDER BY avg_resolution_hours DESC;

#Find the highest-risk individual tickets

SELECT
    Ticket_ID,
    Business_Unit_ID,
    Process_ID,
    Category_ID,
    Region,
    Priority,
    Resolution_Hours,
    SLA_Hours,
    SLA_Breached,
    Risk_Score,
    Risk_Category,
    Escalation_Flag,
    Status
FROM `enterprise-operation-analytics.operations_analytics.tickets`
ORDER BY Risk_Score DESC
LIMIT 20;

#data quality analysis (customer impact null values)
SELECT
    COUNT(*) AS total_rows,
    COUNTIF(Customer_Impact IS NULL) AS null_customer_impact,
    COUNTIF(TRIM(Customer_Impact) = '') AS blank_customer_impact,
    COUNTIF(SAFE_CAST(Customer_Impact AS FLOAT64) IS NULL
            AND Customer_Impact IS NOT NULL
            AND TRIM(Customer_Impact) != '') AS non_numeric_customer_impact,
    COUNTIF(Root_Cause IS NULL) AS null_root_cause
FROM `enterprise-operation-analytics.operations_analytics.tickets`;


SELECT
    Customer_Impact,
    COUNT(*) AS frequency
FROM `enterprise-operation-analytics.operations_analytics.tickets`
WHERE Customer_Impact IS NOT NULL
GROUP BY Customer_Impact
ORDER BY frequency DESC
LIMIT 20;


#How does customer impact relate to risk, SLA performance, resolution time, and escalation?
SELECT
    Customer_Impact,
    COUNT(*) AS total_tickets,
    ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct_of_tickets,
    ROUND(AVG(Resolution_Hours), 2) AS avg_resolution_hours,
    ROUND(100 * COUNTIF(SLA_Breached = TRUE) / COUNT(*), 2) AS sla_breach_pct,
    ROUND(AVG(Risk_Score), 2) AS avg_risk_score,
    COUNTIF(Escalation_Flag = TRUE) AS escalations
FROM `enterprise-operation-analytics.operations_analytics.tickets`
GROUP BY Customer_Impact
ORDER BY
    CASE Customer_Impact
        WHEN 'Severe' THEN 1
        WHEN 'High' THEN 2
        WHEN 'Medium' THEN 3
        WHEN 'Low' THEN 4
        WHEN 'None' THEN 5
        ELSE 6
    END;