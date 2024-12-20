-- highest_donation_assignments


WITH donation_details AS (
    SELECT
        d.assignment_id,
        ROUND(SUM(d.amount), 2) AS rounded_total_donation_amount,
        dn.donor_type
    FROM
        donations d
    JOIN donors dn ON d.donor_id = dn.donor_id
    GROUP BY
        d.assignment_id, dn.donor_type
)
SELECT
    a.assignment_name,
    a.region,
    dd.rounded_total_donation_amount,
    dd.donor_type
FROM
    assignments a
JOIN
    donation_details dd ON a.assignment_id = dd.assignment_id
ORDER BY
    dd.rounded_total_donation_amount DESC
LIMIT 5;

-- top_regional_impact_assignments

--Identify the assignment with the highest impact score in each region
--that each listed assignment has received at least one donation
--The output should include four columns: 1) assignment_name, 2) region, 3) impact_score, and 4) num_total_donations
-- sorted by region in ascending order (group by)
--nclude only the highest-scoring assignment per region (ORDER BY)
--avoiding duplicates within the same region (DISTINCT)



-- top_regional_assignments
-- second SQL cell

WITH donation_counts AS (
    SELECT
        assignment_id,
        COUNT(donation_id) AS num_total_donations
    FROM
        donations
    GROUP BY
        assignment_id
),
ranked_assignments AS (
    SELECT
        a.assignment_name,
        a.region,
        a.impact_score,
        dc.num_total_donations,
        ROW_NUMBER() OVER (PARTITION BY a.region ORDER BY a.impact_score DESC) AS rank_in_region
    FROM
        assignments a
    JOIN
        donation_counts dc ON a.assignment_id = dc.assignment_id
    WHERE
        dc.num_total_donations > 0
)
SELECT
    assignment_name,
    region,
    impact_score,
    num_total_donations
FROM
    ranked_assignments
WHERE
    rank_in_region = 1
ORDER BY
    region ASC;




