#!/usr/bin/env bash

#!/usr/bin/env bash

# Vérifier si un argument est fourni
if [[ -z "$1" ]]; then
    echo "Erreur : Vous devez spécifier un fichier en argument."
    exit 1
fi

echo "Le fichier à lire : $1"

# Définir le chemin du fichier de sortie
output_file="/home/hxt/PPE1-2024/miniprojet/tableaux/tableau-fr.tsv"


# Initialiser un compteur de lignes
line_number=1

# Lire les lignes du fichier et afficher chaque ligne avec son numéro, le code HTTP et l'encodage
while read -r line; do
    # Obtenir le code HTTP de la requête
    http_code=$(curl -o /dev/null -s -w "%{http_code}" "$line")

    # Obtenir l'encodage de la page si disponible
    content_type=$(curl -sI "$line" | grep -i "Content-Type")
    if [[ "$content_type" =~ charset=([a-zA-Z0-9-]+) ]]; then
        encoding="${BASH_REMATCH[1]}"
    else
        encoding="N/A" #Si l'encodage n'est pas trouvé
    fi

    # Obtenir le contenu de la page et compter les mots
    nombre_de_mots=$(curl -s "$line" | wc -w)

    # Afficher le numéro de ligne, le code HTTP, l'encodage, le nombre de mots et l'URL et ajouter le résultat dans le fichier
    echo -e "${line_number}\t${http_code}\t${encoding}\t${nombre_de_mots}\t${line}" >> "$output_file"

    # Incrémenter le numéro de ligne
    ((line_number++))
done < "$1"


