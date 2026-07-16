# git

## Pull request : Comment faire?

Tu termines ta fonctionnalité.

Tu fais :

git push -u origin feature/home-screen

Maintenant GitHub connaît ta branche.

Sur GitHub :

Tu vas sur ton dépôt :

score_belote_flutter

GitHub va souvent afficher un bouton :
Compare & pull request
Tu cliques dessus.

Tu choisis :

base repository : score_belote_flutter
base branch : dev

compare branch : feature/home-screen

Ce qui veut dire :

"Je veux prendre les changements de feature/home-screen et les mettre dans dev."

Ensuite tu écris un titre :

feat: add home screen navigation menu

Et une description :

- Created HomeScreen
- Added reusable MenuButton widget
- Added navigation to:
  - Score screen
  - History screen
  - Settings screen

Puis :

Create pull request

Après ça, GitHub affiche :

feature/home-screen
|
| Pull Request
↓
dev

## workflow complet après une Pull Request devient :

revenir sur dev
git checkout dev

récupérer le merge
git pull

supprimer la branche locale
git branch -d feature/home-screen

nettoyer les anciennes références
git fetch --prune
Ça dit à Git :
"Va voir les branches qui existent encore sur le serveur et oublie celles qui ont été supprimées."

# installation manuel de flutter

telecharger flutter fichier.tar
extraire dans un dossier
ajouter dans path
nano ~/.bashrc
ajouter export PATH="$PATH:$HOME/dossier_misy_ilay_avy_nextractena/flutter/bin"
source ~/.bashrc

# animation flutter (voir spalsh screen)

Dans Flutter, une animation est presque toujours composée de trois éléments :

1. AnimationController
   |
   | contrôle le temps
   ↓

2. Animation / Tween
   |
   | transforme la valeur
   ↓

3. Widget animé
   |
   | applique le résultat
   ↓

FadeTransition, ScaleTransition...
