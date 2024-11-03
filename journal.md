# Journal de bord du projet encadré
## séance 1
 La première séance m'a permis de me familiariser avec les bases de la gestion de fichiers et de répertoires sous Linux. La maîtrise des notions de chemin absolu et chemin relatif est particulièrement importante pour naviguer efficacement dans le système de fichiers. De plus, les commandes de base telles que ls, cd, et pwd sont essentielles pour une gestion de fichiers fluide. Je vais continuer à pratiquer ces commandes pour les mémoriser et les utiliser de manière plus intuitive.

Commandes vues :

    pwd : Affiche le répertoire de travail actuel (print working directory).
    ls : Liste le contenu d'un dossier.
    cd : Change le répertoire de travail.
    cp : Copie des fichiers ou dossiers.
    mv : Déplace des fichiers ou dossiers.
    rm : Supprime des fichiers ou dossiers.
    mkdir : Crée un nouveau dossier.
    touch : Crée un fichier vide ou met à jour la date de modification d'un fichier.
    zip / unzip : Compresse ou décompresse des archives zip.
    tar : Manipule les archives tar.
    file : Donne des informations sur le type de fichier.
    cat : Affiche le contenu d’un ou plusieurs fichiers.
    head : Affiche le début d’un fichier.
    tail : Affiche la fin d’un fichier.
    cut : Sélectionne une ou plusieurs colonnes dans un fichier tabulé.
    less : Permet de lire le contenu d’un fichier de manière interactive.

## séance 2
Cette séance a été très utile pour comprendre l'importance de la gestion de version dans un projet. Les commandes de base telles que git add, git commit et git push sont essentielles pour gérer l'évolution de notre projet et collaborer avec d'autres membres de l'équipe. La compréhension des éditeurs comme vim et nano est également cruciale, car ils permettent de modifier des fichiers directement dans le terminal, une compétence souvent nécessaire lorsqu’on travaille avec Git.

Je vais continuer à pratiquer ces commandes pour mieux comprendre leur fonctionnement et devenir plus à l’aise avec Git et GitHub dans un environnement de développement collaboratif.

git vs github 

ssh -keygen -t ad255519
git config --global user.name "xiaotong-0913" 
git config --global user.email "xiaotong.he@parisnanterre.fr"
git clone https://github.com/xiaotong-0913/PPE1-2024  
git init cree un depot  ex: git init my-repo
git status / git add / git commit / git add . /
vim i Esc :wq !q Ctrl + f （forward）Ctrl + b （backward
nano Ctrl + O Enter  Ctrl + X
git tag [-a] [-m message] <tagname> [commit]
git push origin <tagname>

## séance 3
J'ai  exploré les commandes avancées de Git, notamment celles permettant de gérer l’historique des versions, de corriger des erreurs et de manipuler des sauvegardes temporaires (stash). Ces fonctionnalités sont cruciales pour une gestion plus fine et précise des versions, en particulier lorsque des erreurs surviennent ou lorsque des modifications doivent être temporairement mises de côté.

Revenir à un état précédent avec git reset :

    git reset HEAD~1 : Revenir au dernier commit, en gardant ou supprimant les modifications selon les options choisies (--soft, --hard).
    git reset --soft HEAD~1 : Revenir au dernier commit, en conservant les modifications dans le staging area.
    git reset --hard HEAD~1 : Revenir au dernier commit, en supprimant toutes les modifications non validées.
    git diff : Permet de voir les différences entre deux versions.

Utilisation de git stash :

    git stash : Mettre de côté les modifications en cours, pour libérer le working directory sans les valider.
    git stash list : Afficher tous les changements mis de côté dans le stash.
    git stash show -p <stash> : Voir le contenu d'un stash spécifique.
    git stash apply : Appliquer les modifications d'un stash sans les supprimer de la liste.

Recommandation d'utilisation de git fetch :

    git fetch : Récupérer les métadonnées du dépôt distant sans fusionner les modifications, permettant une mise à jour sûre des informations sans risque de conflit immédiat.

Cette séance a été particulièrement enrichissante, car elle m'a permis de comprendre comment manipuler efficacement l’historique des commits et comment résoudre des erreurs de manière contrôlée avec git reset. La commande git stash s'est révélée très pratique pour mettre temporairement de côté des changements, ce qui est particulièrement utile dans des situations de conflit de versions ou lorsque l’on souhaite conserver des modifications pour les appliquer plus tard.

Cependant, ces commandes avancées nécessitent de la pratique pour être pleinement maîtrisées. Les options --soft et --hard de git reset, ainsi que la gestion des stashes, peuvent être délicates et demander une bonne compréhension pour éviter des pertes de données involontaires. Je vais continuer à m'exercer à utiliser ces commandes pour renforcer ma maîtrise de Git, car une utilisation efficace de ces commandes est essentielle pour des projets de développement collaboratif et pour une gestion de version sécurisée.

## exercices git
Lors de ces exercices sur Git, j'ai rencontré plusieurs erreurs de base, notamment des confusions dans l'utilisation des chemins et des commandes entre `vim` et `nano`. La recherche de fichiers comme `classement_2016` et `Locations` m’a demandé plusieurs essais pour bien comprendre l'organisation des dossiers. La gestion des erreurs, en particulier avec `git reset`, `git revert` et `git stash`, a été difficile et a nécessité un temps d'adaptation pour maîtriser ces outils. Une pratique régulière m'aidera à mieux comprendre ces concepts et à éviter les erreurs similaires à l'avenir.

## séance 4
Dans cet exercice, j'ai créé plusieurs scripts pour compter les occurrences de "Location" dans les fichiers .ann. Tout d'abord, le script comptes.sh parcourt les années de 2016 à 2018 et utilise grep et wc -l pour compter les résultats annuels. Ensuite, j'ai développé le script compte_par_type.sh permettant de spécifier une année et un type d'entité, et compte_par_type_par_an.sh pour exécuter cette tâche sur chaque année. De plus, le script compte_lieux.sh prend en compte l'année, le mois, et un nombre de résultats, en utilisant * comme joker pour traiter plusieurs années et mois. J'ai appliqué chmod +x pour rendre les scripts exécutables, et tous les scripts ont été ajoutés à Git pour la gestion des versions.

J'ai expliqué le fonctionnement de la boucle dans le script comptes.sh. La boucle parcourt les années 2016, 2017 et 2018, utilise grep pour rechercher le mot "Location" dans les fichiers .ann, et compte le nombre de lignes contenant ce mot avec wc -l. Le script affiche ensuite le nombre de lieux trouvés pour chaque année.













 
modif 1
#Modification2
changement depuis l'ordinateur.
