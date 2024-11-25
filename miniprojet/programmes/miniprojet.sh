#!/usr/bin/env bash


if [[ -z "$1" ]]; then
    echo "Erreur : Vous devez spécifier un fichier en argument."
    exit 1
fi


#input_file="$1"
output_file="$HOME/PPE1-2024/miniprojet/tableaux/tableau-fr.html"


echo "<!DOCTYPE html>" > "$output_file"
echo "<html>" >> "$output_file"
echo "<head>" >> "$output_file"
echo "  <meta charset=\"UTF-8\">" >> "$output_file"
echo "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">" >> "$output_file"
echo "   <title>Mini-projet tableau</title>" >> "$output_file"
echo "   <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bulma@1.0.2/css/bulma.min.css\">" >> "$output_file"
echo "</head>" >> "$output_file"
echo "<body>" >> "$output_file"
echo "    <div class=\"table-container\">" >> "$output_file"
echo "      <table class=\"table is-bordered is-hoverable is-striped is-fullwidth\">" >> "$output_file"
echo "        <tr>" >> "$output_file"
echo "            <th>Numero</th>" >> "$output_file"
echo "            <th>URL</th>" >> "$output_file"
echo "            <th>Code HTTP</th>" >> "$output_file"
echo "            <th>Encodage</th>" >> "$output_file"
echo "            <th>Nb de mots</th>" >> "$output_file"
echo "        </tr>" >> "$output_file"

count=0
while read -r line
do
    ((count++))

    if [[ ! "$line" =~ ^https?:// ]]
    then
        line="https://$line"
    fi

    stdout_a=$(curl -s -I -L "$line")
    stdout_b=$(lynx -dump -nolist "$line")
    code_http=$(echo "$stdout_a" | head -n 1 | cut -d' ' -f2)

    if [ "$code_http" = "200" ]
    then
        encodage=$(echo "$stdout_a" | grep "^content-type" | cut -d'=' -f2)
        encodage=${encodage:-"N/A"}
        nb_mots=$(echo "$stdout_b" | wc -w | tr -d '[:space:]')

        echo "        <tr>" >> "$output_file"
        echo "            <td>$count</td>" >> "$output_file"
        echo "            <td>$line</td>" >> "$output_file"
        echo "            <td>$code_http</td>" >> "$output_file"
        echo "            <td>$encodage</td>" >> "$output_file"
        echo "            <td>$nb_mots</td>" >> "$output_file"
        echo "        </tr>" >> "$output_file"
    else
        echo "        <tr>" >> "$output_file"
        echo "            <td>$count</td>" >> "$output_file"
        echo "            <td>$line</td>" >> "$output_file"
        echo "            <td>$code_http</td>" >> "$output_file"
        echo "            <td>N/A</td>" >> "$output_file"
        echo "            <td>0</td>" >> "$output_file"
    fi
done <"$1"

echo "    </table>" >> "$output_file"
echo "   </div>" >> "$output_file"
echo "</body>" >> "$output_file"
echo "</html>" >> "$output_file"
