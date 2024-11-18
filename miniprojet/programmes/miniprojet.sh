#!/usr/bin/env bash


if [[ -z "$1" ]]; then
    echo "Erreur : Vous devez spécifier un fichier TSV en argument."
    exit 1
fi


input_file="$1"
output_file="${input_file%.tsv}.html"


echo "<!DOCTYPE html>" > "$output_file"
echo "<html>" >> "$output_file"
echo "<head>" >> "$output_file"
echo "  <meta charset=\"UTF-8\">" >> "$output_file"
echo "  <title>Tableau des Données</title>" >> "$output_file"
echo "  <style>" >> "$output_file"
echo "    table { border-collapse: collapse; width: 100%; margin: 20px auto; }" >> "$output_file"
echo "    th, td { border: 1px solid black; padding: 8px; text-align: center; }" >> "$output_file"
echo "    th { background-color: #f2f2f2; }" >> "$output_file"
echo "  </style>" >> "$output_file"
echo "</head>" >> "$output_file"
echo "<body>" >> "$output_file"
echo "  <h1 style=\"text-align: center;\">Tableau des Données</h1>" >> "$output_file"
echo "  <table>" >> "$output_file"


line_number=0

while IFS=$'\t' read -r -a columns; do
    if [[ $line_number -eq 0 ]]; then
        
        echo "    <tr>" >> "$output_file"
        for header in "${columns[@]}"; do
            echo "      <th>${header}</th>" >> "$output_file"
        done
        echo "    </tr>" >> "$output_file"
    else
        
        echo "    <tr>" >> "$output_file"
        for ((i=0; i<${#columns[@]}; i++)); do
            if [[ $i -eq 4 ]]; then
                # URL
                echo "      <td><a href=\"${columns[$i]}\" target=\"_blank\">${columns[$i]}</a></td>" >> "$output_file"
            else
                
                echo "      <td>${columns[$i]}</td>" >> "$output_file"
            fi
        done
        echo "    </tr>" >> "$output_file"
    fi
    ((line_number++))
done < "$input_file"

#  fermer
echo "  </table>" >> "$output_file"
echo "</body>" >> "$output_file"
echo "</html>" >> "$output_file"

echo "Conversion terminée ! Le fichier HTML est : $output_file"
