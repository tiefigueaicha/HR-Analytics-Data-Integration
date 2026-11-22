from pathlib import Path
import json
import pandas as pd

# Chemin principal du projet
ROOT = Path(__file__).resolve().parents[1]

# Chemins des deux fichiers JSON
file_a = ROOT / "data" / "raw" / "hr_system_a.json"
file_b = ROOT / "data" / "raw" / "hr_system_b.json"

# Extraction des données du système A
with open(file_a, "r", encoding="utf-8") as file:
    data_a = json.load(file)

# Extraction des données du système B
with open(file_b, "r", encoding="utf-8") as file:
    data_b = json.load(file)

# Conversion en DataFrames
df_employees = pd.DataFrame(data_a)
df_absences = pd.DataFrame(data_b)

# Affichage des résultats
print("DONNEES DU SYSTEME RH A")
print(df_employees)

print("\nDONNEES DU SYSTEME RH B")
print(df_absences)

print("\nNOMBRE DE COLLABORATEURS :", len(df_employees))
print("NOMBRE D'ENREGISTREMENTS D'ABSENCES :", len(df_absences))




# Fusion des données des deux systèmes RH
df_merged = pd.merge(
    df_employees,
    df_absences,
    on="employee_id",
    how="left"
)

print("\nDONNEES RH CENTRALISEES")
print(df_merged)

# CONTROLES DE QUALITE DES DONNEES

print("\nCONTROLES DE QUALITE")

# Détection des identifiants dupliqués
print("\nIdentifiants dupliqués :")
print(df_absences[df_absences.duplicated(
    subset=["employee_id"], keep=False
)])

# Détection des valeurs négatives
print("\nAbsences négatives :")
print(df_absences[df_absences["absence_days"] < 0])

# Détection des employés inconnus
unknown_employees = df_absences[
    ~df_absences["employee_id"].isin(df_employees["employee_id"])
]

print("\nEmployés absents du système A :")
print(unknown_employees)



# NETTOYAGE DES DONNEES

# Identifier les employés ayant plusieurs enregistrements
duplicate_ids = df_absences.loc[
    df_absences.duplicated(
        subset=["employee_id"],
        keep=False
    ),
    "employee_id"
].unique()

# Conserver uniquement les enregistrements fiables
valid_absences = df_absences[
    (~df_absences["employee_id"].isin(duplicate_ids))
    & (df_absences["absence_days"] >= 0)
    & (df_absences["employee_id"].isin(df_employees["employee_id"]))
].copy()

print("\nDONNEES D'ABSENCES APRES NETTOYAGE")
print(valid_absences)

# Fusionner les données des deux systèmes
df_integrated = pd.merge(
    df_employees,
    valid_absences,
    on="employee_id",
    how="left"
)

print("\nDONNEES RH INTEGREES ET NETTOYEES")
print(df_integrated)




from sqlalchemy import create_engine

# CONNEXION A POSTGRESQL

DB_USER = "postgres"
DB_PASSWORD = "aichadata2027"
DB_HOST = "localhost"
DB_PORT = "5432"
DB_NAME = "hr_analytics_db"

engine = create_engine(
    f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
)

# CHARGEMENT DES DONNEES INTEGREES

df_integrated.to_sql(
    name="hr_employees_integrated",
    con=engine,
    if_exists="append",
    index=False
)

print("\nChargement dans PostgreSQL terminé !")