SELECT COUNT(*) FROM employees;

SELECT *
FROM employees
LIMIT 10;

SELECT
    attrition,
    COUNT(*) AS nombre_employes
FROM employees
GROUP BY attrition;

SELECT
    COUNT(*) AS total_employes,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS nombre_departs,
    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1.0 ELSE 0 END)
        / COUNT(*) * 100,
        2
    ) AS taux_attrition
FROM employees;

SELECT
    department,
    COUNT(*) AS total_employes,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS nombre_departs
FROM employees
GROUP BY department
ORDER BY nombre_departs DESC;

SELECT
    department,
    COUNT(*) AS total_employes,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS nombre_departs,
    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1.0 ELSE 0 END)
        / COUNT(*) * 100,
        2
    ) AS taux_attrition
FROM employees
GROUP BY department
ORDER BY taux_attrition DESC;

SELECT
    jobrole,
    COUNT(*) AS total_employes,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS nombre_departs,
    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1.0 ELSE 0 END)
        / COUNT(*) * 100,
        2
    ) AS taux_attrition
FROM employees
GROUP BY jobrole
ORDER BY taux_attrition DESC;

SELECT
    jobsatisfaction,
    COUNT(*) AS total_employes,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS nombre_departs,
    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1.0 ELSE 0 END)
        / COUNT(*) * 100,
        2
    ) AS taux_attrition
FROM employees
GROUP BY jobsatisfaction
ORDER BY jobsatisfaction;

SELECT
    overtime,
    COUNT(*) AS total_employes,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS nombre_departs,
    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1.0 ELSE 0 END)
        / COUNT(*) * 100,
        2
    ) AS taux_attrition
FROM employees
GROUP BY overtime
ORDER BY taux_attrition DESC;

SELECT
    CASE
        WHEN yearsatcompany < 2 THEN 'Moins de 2 ans'
        WHEN yearsatcompany BETWEEN 2 AND 5 THEN '2 à 5 ans'
        WHEN yearsatcompany BETWEEN 6 AND 10 THEN '6 à 10 ans'
        ELSE 'Plus de 10 ans'
    END AS tranche_anciennete,

    COUNT(*) AS total_employes,

    SUM(CASE
        WHEN attrition = 'Yes' THEN 1
        ELSE 0
    END) AS nombre_departs,

    ROUND(
        SUM(CASE
            WHEN attrition = 'Yes' THEN 1.0
            ELSE 0
        END) / COUNT(*) * 100,
        2
    ) AS taux_attrition

FROM employees

GROUP BY tranche_anciennete

ORDER BY MIN(yearsatcompany);


SELECT
    CASE
        WHEN monthlyincome < 3000 THEN 'Moins de 3000'
        WHEN monthlyincome BETWEEN 3000 AND 5000 THEN '3000 à 5000'
        WHEN monthlyincome BETWEEN 5001 AND 8000 THEN '5001 à 8000'
        ELSE 'Plus de 8000'
    END AS tranche_salaire,

    COUNT(*) AS total_employes,

    SUM(CASE
        WHEN attrition = 'Yes' THEN 1
        ELSE 0
    END) AS nombre_departs,

    ROUND(
        SUM(CASE
            WHEN attrition = 'Yes' THEN 1.0
            ELSE 0
        END) / COUNT(*) * 100,
        2
    ) AS taux_attrition

FROM employees

GROUP BY tranche_salaire

ORDER BY MIN(monthlyincome);



SELECT
    CASE
        WHEN yearsatcompany < 2 THEN 'Moins de 2 ans'
        WHEN yearsatcompany BETWEEN 2 AND 5 THEN '2 à 5 ans'
        WHEN yearsatcompany BETWEEN 6 AND 10 THEN '6 à 10 ans'
        ELSE 'Plus de 10 ans'
    END AS tranche_anciennete,

    overtime,

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