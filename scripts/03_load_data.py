from pathlib import Path
import os
import pandas as pd

from dotenv import load_dotenv
from sqlalchemy import create_engine, text
from sqlalchemy.engine import URL

# Définir le dossier principal du projet
ROOT = Path(__file__).resolve().parents[1]

# Charger les variables du fichier .env
load_dotenv(ROOT / ".env")

# Récupérer les données nettoyées
file_path = ROOT / "data" / "processed" / "hr_employee_clean.csv"
df = pd.read_csv(file_path)

# Récupérer les paramètres de connexion
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_HOST = os.getenv("DB_HOST")
DB_PORT = os.getenv("DB_PORT")
DB_NAME = os.getenv("DB_NAME")

# Construire l'URL de connexion
database_url = URL.create(
    drivername="postgresql+psycopg2",
    username=DB_USER,
    password=DB_PASSWORD,
    host=DB_HOST,
    port=int(DB_PORT),
    database=DB_NAME
)

# Créer la connexion à PostgreSQL
engine = create_engine(database_url)

# Charger les données dans PostgreSQL
df.to_sql(
    name="employees",
    con=engine,
    if_exists="append",
    index=False
)

# Vérifier le nombre d'enregistrements
with engine.connect() as connection:
    result = connection.execute(
        text("SELECT COUNT(*) FROM employees")
    )
    print("Nombre d'employés dans PostgreSQL :", result.scalar())

print("Chargement terminé avec succès !")