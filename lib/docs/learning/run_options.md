# 🚀 Flutter - Options de lancement et de développement

Ce document rassemble les principales commandes Flutter utilisées pendant le développement ainsi que les différentes options de rechargement de l'application.

L'objectif est de comprendre quand utiliser **Hot Reload**, **Hot Restart** ou un redémarrage complet du projet.

---

# Démarrer l'application

## Lancer l'application

```bash
flutter run
```

ou directement depuis VS Code avec le bouton **Run**.

Flutter compile l'application puis la lance sur la plateforme sélectionnée.

---

# Choisir la plateforme de lancement

Flutter permet d'exécuter une même application sur plusieurs plateformes.

Pour afficher les appareils disponibles :

```bash
flutter devices
```

Exemple :

```text
Found 2 connected devices:

Chrome (web)
Linux (desktop)
```

Chaque appareil possède un identifiant (_device id_) pouvant être utilisé avec `flutter run`.

---

## Lancer sur Chrome

```bash
flutter run -d chrome
```

Cette commande est particulièrement adaptée pendant le développement de l'interface graphique.

Le démarrage est rapide et fonctionne parfaitement avec **Hot Reload**.

---

## Lancer sur Linux

```bash
flutter run -d linux
```

Lance l'application sous forme d'application de bureau Linux.

---

## Lancer sur Android

```bash
flutter run -d android
```

Ou, si un émulateur est déjà démarré :

```bash
flutter run -d emulator-5554
```

---

## Lancer sur un téléphone connecté

Commencer par afficher les appareils disponibles :

```bash
flutter devices
```

Puis utiliser l'identifiant du téléphone :

```bash
flutter run -d <device_id>
```

Exemple :

```bash
flutter run -d R58N12345AB
```

---

## Si aucun appareil n'est précisé

```bash
flutter run
```

Flutter lance généralement l'application sur le dernier appareil utilisé.

Cependant, il est recommandé de préciser explicitement la plateforme :

```bash
flutter run -d chrome
```

Cela évite toute ambiguïté lorsque plusieurs appareils sont connectés.

---

# Hot Reload 🔥

Raccourci clavier :

```
r
```

ou le bouton **Hot Reload** de VS Code.

## À quoi sert-il ?

Hot Reload recharge uniquement le code modifié sans redémarrer entièrement l'application.

L'état actuel est conservé.

Par exemple :

- l'écran actuellement affiché reste ouvert ;
- les variables conservent leur valeur ;
- la navigation est conservée ;
- les données déjà saisies ne sont pas perdues.

Les modifications sont appliquées presque instantanément.

---

## Quand utiliser Hot Reload ?

Dans la majorité des cas.

Exemples :

- modification des couleurs ;
- modification des marges ;
- changement de police ;
- modification d'un texte ;
- ajout ou suppression d'un widget ;
- modification d'une méthode `build()` ;
- ajustement de l'interface graphique.

C'est l'outil utilisé le plus fréquemment pendant le développement.

---

# Hot Restart ♻️

Raccourci clavier :

```
R
```

ou le bouton **Hot Restart**.

## À quoi sert-il ?

Hot Restart redémarre complètement le code Dart.

L'application recommence depuis la fonction :

```dart
main()
```

Toutes les variables sont réinitialisées.

En revanche, Flutter ne recompile pas entièrement le projet, ce qui reste beaucoup plus rapide qu'un nouveau `flutter run`.

---

## Quand utiliser Hot Restart ?

Lorsque Hot Reload ne suffit plus.

Exemples :

- modification du `main()` ;
- modification de l'initialisation de l'application ;
- changement du thème global ;
- ajout d'un Provider ;
- modification importante des variables d'état ;
- modification de variables globales.

---

# Redémarrer complètement l'application

Arrêter l'application :

```
Ctrl + C
```

Puis relancer :

```bash
flutter run
```

ou

```bash
flutter run -d chrome
```

Flutter recompile entièrement le projet.

---

## Quand effectuer un redémarrage complet ?

Dans les situations suivantes :

- ajout ou suppression d'un package ;
- modification du fichier `pubspec.yaml` ;
- ajout d'assets ;
- ajout d'une police personnalisée ;
- ajout d'icônes ;
- Flutter semble bloqué ;
- Hot Restart ne suffit plus.

---

# flutter clean

Commande :

```bash
flutter clean
```

Cette commande supprime tous les fichiers générés automatiquement par Flutter.

Ensuite :

```bash
flutter pub get
flutter run
```

---

## Quand utiliser flutter clean ?

Uniquement en cas de problème.

Par exemple :

- erreurs de compilation inhabituelles ;
- cache corrompu ;
- changement de version de Flutter ;
- projet refusant de compiler.

Cette commande ne doit pas être utilisée systématiquement.

---

# flutter pub get

Commande :

```bash
flutter pub get
```

Télécharge les dépendances du projet.

Cette commande est nécessaire après :

- ajout d'un package ;
- suppression d'un package ;
- ajout d'une police ;
- ajout ou modification d'assets dans `pubspec.yaml`.

---

# flutter pub upgrade

Commande :

```bash
flutter pub upgrade
```

Met à jour les dépendances vers les versions autorisées.

Cette commande est à utiliser ponctuellement.

---

# Résumé

| Action          | Recharge le code           | Conserve l'état | Utilisation recommandée                             |
| --------------- | -------------------------- | --------------- | --------------------------------------------------- |
| Hot Reload      | ✅                         | ✅              | Modifications de widgets, styles, textes, interface |
| Hot Restart     | ✅                         | ❌              | Changements importants dans le code Dart            |
| flutter run     | ✅ Compilation complète    | ❌              | Premier lancement ou gros changements               |
| flutter clean   | Nettoyage du projet        | ❌              | Résolution de problèmes de compilation              |
| flutter pub get | Télécharge les dépendances | —               | Après modification du `pubspec.yaml`                |

---

# Recommandation

Pendant le développement, l'ordre conseillé est :

1. Modifier le code.
2. Effectuer un **Hot Reload**.
3. Si le changement n'apparaît pas, effectuer un **Hot Restart**.
4. Si le problème persiste, arrêter l'application puis lancer un nouveau `flutter run`.
5. Utiliser **flutter clean** uniquement en dernier recours.

Dans la grande majorité des situations :

- **Hot Reload** est suffisant ;
- **Hot Restart** résout la plupart des autres cas ;
- un redémarrage complet reste occasionnel.

---

# Commandes les plus utilisées

```bash
# Lancer sur Chrome
flutter run -d chrome

# Afficher les appareils disponibles
flutter devices

# Télécharger les dépendances
flutter pub get

# Nettoyer le projet
flutter clean

# Analyser le code
flutter analyze

# Formater tout le projet
dart format lib test
```
