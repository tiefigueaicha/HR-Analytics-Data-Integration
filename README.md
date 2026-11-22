# HR Analytics & Data Integration Project
### Projet d'analyse RH et d'intégration de données

🌍 **Languages / Langues :** [Français](#version-française) | [English](#english-version)

---

# 🇫🇷 Version française

## 1. Présentation du projet

Ce projet consiste à mettre en place une chaîne complète de traitement et d'analyse de données RH, depuis l'extraction et la préparation des données jusqu'à leur intégration dans une base de données, leur analyse avec SQL et leur visualisation avec Power BI.

L'objectif est d'analyser les phénomènes de départ des collaborateurs (attrition) et de transformer les données brutes en informations utiles à la prise de décision RH.

Le projet comprend également un exercice pratique d'intégration de données provenant de deux systèmes RH simulés.

## 2. Objectifs métier

- Analyser les tendances de départ et de rétention des collaborateurs.
- Identifier les départements et métiers présentant les taux de départ les plus élevés.
- Étudier les relations entre les heures supplémentaires, la satisfaction, l'ancienneté et les départs.
- Intégrer des informations provenant de différentes sources RH.
- Produire des indicateurs et des analyses facilitant la prise de décision.

## 3. Architecture technique

```text
SOURCE DE DONNÉES (CSV)
          |
          v
PYTHON / PANDAS
Exploration, nettoyage et transformation
          |
          v
POSTGRESQL
Stockage et gestion des données
          |
          v
SQL
Requêtes, indicateurs et vues analytiques
          |
          v
POWER BI
Tableaux de bord et visualisation
          |
          v
AIDE À LA DÉCISION RH
```

## 4. Technologies utilisées

| Technologie | Utilisation |
|---|---|
| Python | Extraction et traitement des données |
| Pandas | Nettoyage et transformation |
| PostgreSQL | Gestion de la base de données |
| SQL | Analyse et création d'indicateurs |
| Power BI | Visualisation et reporting |
| JSON | Format d'échange de données |
| Git / GitHub | Gestion des versions et publication du projet |

## 5. Étapes de réalisation

### Étape 1 – Exploration des données
- Importation du fichier CSV avec Pandas.
- Analyse de la structure et des types de données.
- Vérification des valeurs manquantes et des doublons.

### Étape 2 – Nettoyage et transformation
- Suppression des doublons.
- Suppression de trois colonnes non informatives.
- Standardisation des noms de colonnes.
- Exportation du jeu de données nettoyé.

### Étape 3 – Intégration dans PostgreSQL
- Création de la base de données.
- Création de la table des employés.
- Chargement de 1 470 enregistrements avec Python et SQLAlchemy.

### Étape 4 – Analyse SQL
Réalisation de requêtes et de vues analytiques portant sur :
- Le taux global de départ.
- Les départs par département et métier.
- Les heures supplémentaires.
- La satisfaction professionnelle.
- L'ancienneté.
- Les tranches de salaire.
- Le croisement entre ancienneté et heures supplémentaires.

### Étape 5 – Tableau de bord Power BI
Connexion à PostgreSQL via ODBC et création de visualisations permettant de suivre les principaux indicateurs RH.

### Étape 6 – Exercice d'intégration de données
Simulation de deux systèmes RH indépendants à partir de fichiers JSON :
- Système A : informations sur les employés.
- Système B : informations sur les absences.

Utilisation de Python et Pandas pour extraire, rapprocher et fusionner les données, puis détecter plusieurs anomalies :
- Identifiants dupliqués.
- Valeurs négatives de jours d'absence.
- Identifiants d'employés inconnus.

## 6. Principaux résultats

L'analyse des 1 470 enregistrements a permis d'identifier les résultats suivants :

| Indicateur | Résultat |
|---|---:|
| Nombre total d'employés | 1 470 |
| Nombre de départs | 237 |
| Nombre d'employés restants | 1 233 |
| Taux global de départ | 16,12 % |
| Département avec le taux le plus élevé | Sales – 20,63 % |
| Métier avec le taux le plus élevé | Sales Representative – 39,76 % |

L'analyse croisée a également révélé un taux de départ de 55,07 % parmi les employés ayant moins de deux ans d'ancienneté et effectuant des heures supplémentaires.

Ces résultats mettent en évidence des associations statistiques et ne permettent pas, à eux seuls, d'établir des liens de causalité.

## 7. Structure du dépôt

```text
HR_ANALYTICS_DATA_PROJECT/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── scripts/
├── sql/
├── dashboard/
├── documentation/
│
├── .gitignore
└── README.md
```

Les fichiers de données CSV ne sont pas inclus dans le dépôt. Ils doivent être téléchargés séparément.

## 8. Source des données

Jeu de données : IBM HR Analytics Employee Attrition & Performance.

[Consulter le dataset sur Kaggle](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)

Il s'agit d'un jeu de données synthétiques utilisé dans le cadre d'un projet pédagogique et de portfolio.

## 9. Limites du projet

- Les données sont synthétiques et ne représentent pas nécessairement la réalité de toutes les organisations.
- Les deux systèmes RH de l'exercice d'intégration sont simulés à l'aide de fichiers JSON.
- Aucune connexion API réelle ni plateforme d'intégration en production n'a été mise en œuvre.
- Ce projet constitue un prototype pédagogique et non un système RH destiné à être exploité en production.

---

# 🇬🇧 English Version

## 1. Project Overview

This project implements an end-to-end HR data processing and analytics workflow, from data extraction and preparation to database integration, SQL analysis and Power BI reporting.

The objective is to analyze employee attrition patterns and transform raw HR data into meaningful insights that can support Human Resources decision-making.

The project also includes a practical data integration exercise involving two simulated HR information systems.

## 2. Business Objectives

- Analyze employee attrition and retention patterns.
- Identify departments and job roles with higher attrition rates.
- Explore relationships between overtime, job satisfaction, tenure and employee departures.
- Integrate employee information from different HR data sources.
- Produce meaningful indicators to support HR decision-making.

## 3. Technical Architecture

```text
DATA SOURCE (CSV)
        |
        v
PYTHON / PANDAS
Data profiling, cleaning and transformation
        |
        v
POSTGRESQL
Data storage and management
        |
        v
SQL
Queries, KPIs and analytical views
        |
        v
POWER BI
Dashboards and data visualization
        |
        v
HR DECISION SUPPORT
```

## 4. Technologies Used

| Technology | Purpose |
|---|---|
| Python | Data extraction and processing |
| Pandas | Data cleaning and transformation |
| PostgreSQL | Database management |
| SQL | Data analysis and KPI creation |
| Power BI | Data visualization and reporting |
| JSON | Data exchange format |
| Git / GitHub | Version control and project publishing |

## 5. Project Implementation

### Step 1 – Data Profiling
- Imported the CSV dataset using Pandas.
- Examined dataset structure and data types.
- Checked missing values and duplicate records.

### Step 2 – Data Cleaning and Transformation
- Removed duplicate records.
- Removed three non-informative columns.
- Standardized column names.
- Exported the cleaned dataset.

### Step 3 – PostgreSQL Integration
- Created a PostgreSQL database.
- Designed the employees table.
- Loaded 1,470 employee records using Python and SQLAlchemy.

### Step 4 – SQL Analysis
Developed SQL queries and analytical views to investigate:
- Overall employee attrition.
- Attrition by department and job role.
- Overtime and employee departures.
- Job satisfaction.
- Employee tenure.
- Salary ranges.
- Combined tenure and overtime analysis.

### Step 5 – Power BI Dashboard
Connected Power BI to PostgreSQL through ODBC and created visualizations to monitor key HR indicators.

### Step 6 – Data Integration Exercise
Simulated two independent HR systems using JSON files:
- System A: employee profile information.
- System B: employee absence information.

Used Python and Pandas to extract, match and merge records, and identify data quality issues:
- Duplicate employee identifiers.
- Negative absence values.
- Unknown employee identifiers.

## 6. Key Findings

The analysis of 1,470 employee records identified the following results:

| Indicator | Result |
|---|---:|
| Total employees | 1,470 |
| Employees who left | 237 |
| Employees remaining | 1,233 |
| Overall attrition rate | 16.12% |
| Department with highest attrition rate | Sales – 20.63% |
| Job role with highest attrition rate | Sales Representative – 39.76% |

A combined analysis also revealed a 55.07% attrition rate among employees with less than two years of tenure who worked overtime.

These findings highlight statistical associations and do not establish causal relationships.

## 7. Repository Structure

```text
HR_ANALYTICS_DATA_PROJECT/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── scripts/
├── sql/
├── dashboard/
├── documentation/
│
├── .gitignore
└── README.md
```

CSV dataset files are not included in this repository and must be downloaded separately.

## 8. Dataset

Dataset: IBM HR Analytics Employee Attrition & Performance.

[Kaggle – IBM HR Analytics Dataset](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)

The dataset contains synthetic employee information and is used for educational and portfolio purposes.

## 9. Project Limitations

- The analysis is based on synthetic data and cannot be generalized to all organizations.
- The two HR systems used in the integration exercise are simulated using JSON files.
- No live API connection or production integration platform was implemented.
- This project is a learning and portfolio prototype, not a production HR information system.