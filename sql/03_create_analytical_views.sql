CREATE OR REPLACE VIEW vw_hr_kpi_global AS

SELECT
    COUNT(*) AS total_employes,

    SUM(
        CASE
            WHEN attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS nombre_departs,

    SUM(
        CASE
            WHEN attrition = 'No' THEN 1
            ELSE 0
        END
    ) AS employes_restants,

    ROUND(
        SUM(
            CASE
                WHEN attrition = 'Yes' THEN 1.0
                ELSE 0
            END
        ) / COUNT(*) * 100,
        2
    ) AS taux_attrition

FROM employees;




SELECT *
FROM vw_hr_kpi_global;


CREATE OR REPLACE VIEW vw_attrition_department AS

SELECT
    department,

    COUNT(*) AS total_employes,

    SUM(
        CASE
            WHEN attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS nombre_departs,

    ROUND(
        SUM(
            CASE
                WHEN attrition = 'Yes' THEN 1.0
                ELSE 0
            END
        ) / COUNT(*) * 100,
        2
    ) AS taux_attrition

FROM employees

GROUP BY department

ORDER BY taux_attrition DESC;


SELECT *
FROM vw_attrition_department;


CREATE OR REPLACE VIEW vw_attrition_jobrole AS

SELECT
    jobrole,

    COUNT(*) AS total_employes,

    SUM(
        CASE
            WHEN attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS nombre_departs,

    ROUND(
        SUM(
            CASE
                WHEN attrition = 'Yes' THEN 1.0
                ELSE 0
            END
        ) / COUNT(*) * 100,
        2
    ) AS taux_attrition

FROM employees

GROUP BY jobrole

ORDER BY taux_attrition DESC;

SELECT *
FROM vw_attrition_jobrole;


CREATE OR REPLACE VIEW vw_attrition_satisfaction AS

SELECT
    jobsatisfaction AS niveau_satisfaction,

    COUNT(*) AS total_employes,

    SUM(
        CASE
            WHEN attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS nombre_departs,

    ROUND(
        SUM(
            CASE
                WHEN attrition = 'Yes' THEN 1.0
                ELSE 0
            END
        ) / COUNT(*) * 100,
        2
    ) AS taux_attrition

FROM employees

GROUP BY jobsatisfaction

ORDER BY jobsatisfaction;

SELECT *
FROM vw_attrition_satisfaction;



CREATE OR REPLACE VIEW vw_attrition_overtime AS

SELECT
    overtime AS heures_supplementaires,

    COUNT(*) AS total_employes,

    SUM(
        CASE
            WHEN attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS nombre_departs,

    ROUND(
        SUM(
            CASE
                WHEN attrition = 'Yes' THEN 1.0
                ELSE 0
            END
        ) / COUNT(*) * 100,
        2
    ) AS taux_attrition

FROM employees

GROUP BY overtime

ORDER BY taux_attrition DESC;

SELECT *
FROM vw_attrition_overtime;



CREATE OR REPLACE VIEW vw_attrition_tenure_overtime AS

SELECT
    CASE
        WHEN yearsatcompany < 2 THEN 'Moins de 2 ans'
        WHEN yearsatcompany BETWEEN 2 AND 5 THEN '2 à 5 ans'
        WHEN yearsatcompany BETWEEN 6 AND 10 THEN '6 à 10 ans'
        ELSE 'Plus de 10 ans'
    END AS tranche_anciennete,

    overtime AS heures_supplementaires,

    COUNT(*) AS total_employes,

    SUM(
        CASE
            WHEN attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS nombre_departs,

    ROUND(
        SUM(
            CASE
                WHEN attrition = 'Yes' THEN 1.0
                ELSE 0
            END
        ) / COUNT(*) * 100,
        2
    ) AS taux_attrition

FROM employees

GROUP BY
    tranche_anciennete,
    overtime

ORDER BY
    MIN(yearsatcompany),
    overtime;

SELECT *
FROM vw_attrition_tenure_overtime;


SELECT table_name
FROM information_schema.views
WHERE table_schema = 'public'
ORDER BY table_name;


SELECT COUNT(*) FROM employees;


CREATE OR REPLACE VIEW vw_attrition_tenure AS
SELECT
    CASE
        WHEN yearsatcompany < 2 THEN 'Moins de 2 ans'
        WHEN yearsatcompany BETWEEN 2 AND 5 THEN '2 à 5 ans'
        WHEN yearsatcompany BETWEEN 6 AND 10 THEN '6 à 10 ans'
        ELSE 'Plus de 10 ans'
    END AS tranche_anciennete,

    COUNT(*) AS total_employes,

    SUM(
        CASE
            WHEN attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS nombre_departs,

    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1.0 ELSE 0 END)
        / COUNT(*) * 100,
        2
    ) AS taux_attrition

FROM employees

GROUP BY tranche_anciennete

ORDER BY MIN(yearsatcompany);


SELECT *
FROM vw_attrition_tenure;