from pathlib import Path
import pandas as pd

# 1. Définir le chemin du projet
ROOT = Path(__file__).resolve().parents[1]

# 2. Localiser le fichier CSV
file_path = ROOT / "data" / "raw" / "WA_Fn-UseC_-HR-Employee-Attrition.csv"

# 3. Charger les données
df = pd.read_csv(file_path)

# 4. Afficher les premières informations
print("DIMENSIONS DU DATASET")
print(df.shape)

print("\nAPERÇU DES DONNÉES")
print(df.head())

print("\nLISTE DES COLONNES")
print(df.columns.tolist())

print("\nTYPES DE DONNÉES")
print(df.dtypes)

print("\nVALEURS MANQUANTES")
print(df.isna().sum())

print("\nNOMBRE DE DOUBLONS")
print(df.duplicated().sum())