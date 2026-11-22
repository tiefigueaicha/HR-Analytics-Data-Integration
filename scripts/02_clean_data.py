from pathlib import Path
import pandas as pd

# 1. Définir le chemin du projet
ROOT = Path(__file__).resolve().parents[1]

# 2. Charger les données originales
input_file = ROOT / "data" / "raw" / "WA_Fn-UseC_-HR-Employee-Attrition.csv"

df = pd.read_csv(input_file)

print("Données initiales :", df.shape)

# 3. Supprimer les doublons
df = df.drop_duplicates()

# 4. Supprimer les colonnes inutiles
columns_to_remove = [
    "EmployeeCount",
    "Over18",
    "StandardHours"
]

df = df.drop(columns=columns_to_remove)

# 5. Uniformiser les noms des colonnes
df.columns = (
    df.columns
    .str.strip()
    .str.lower()
    .str.replace(" ", "_")
)

# 6. Créer le dossier de destination
output_folder = ROOT / "data" / "processed"
output_folder.mkdir(parents=True, exist_ok=True)

# 7. Enregistrer les données nettoyées
output_file = output_folder / "hr_employee_clean.csv"

df.to_csv(output_file, index=False)

print("Données après nettoyage :", df.shape)
print("Fichier nettoyé enregistré :", output_file)