installation manuel de flutter
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