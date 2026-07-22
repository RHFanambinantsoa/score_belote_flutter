# Responsive Design Flutter — Comprendre et adapter les interfaces

## Introduction

Quand on développe une application Flutter, il ne suffit pas de créer un écran qui fonctionne sur son propre téléphone.

Un bon écran Flutter doit pouvoir fonctionner sur plusieurs tailles d'écran :

- petit téléphone
- grand téléphone
- tablette
- navigateur web

Une interface qui paraît parfaite sur un appareil peut être mauvaise sur un autre.

Le but du responsive design est de créer une interface qui **s'adapte automatiquement**.

---

# 1. Comment reconnaître une bonne pratique Flutter ?

Les bonnes pratiques Flutter viennent principalement de :

- la documentation officielle Flutter
- l'expérience des développeurs
- l'analyse d'applications professionnelles

Une règle importante :

> Ne pas construire une interface basée uniquement sur des valeurs fixes.

## Exemple à éviter

```dart
Container(
  width: 350,
  height: 700,
)
```

Pourquoi ?

Parce que :

- sur un petit écran, le contenu peut dépasser
- sur un grand écran, l'interface peut sembler vide

---

## Exemple préférable

```dart
Container(
  width: double.infinity,
  padding: EdgeInsets.all(24),
)
```

Flutter laisse alors le parent gérer l'espace disponible.

---

# 2. Le problème des tailles fixes

Exemple :

```dart
Container(
  width: 74,
  height: 74,
)
```

Cela fonctionne sur un appareil précis.

Mais :

## Petit écran

Exemple :

```
320 x 568

Logo
Titre
Texte
Bouton

Manque de place
```

## Grand écran

Exemple :

```
1440 x 3200


        Logo


        Texte


        Bouton


Beaucoup d'espace vide
```

---

# 3. Première règle responsive Flutter

Éviter de penser uniquement en pixels fixes.

En CSS on peut écrire :

```css
width: 500px;
```

En Flutter :

```dart
width:500,
```

est possible.

Mais il faut éviter d'en abuser.

Préférer :

- MediaQuery
- LayoutBuilder
- Expanded
- Flexible
- Fraction de l'écran

---

# 4. MediaQuery

## Rôle

`MediaQuery` permet de connaître les informations de l'écran actuel.

Exemple :

```dart
final screenHeight =
    MediaQuery.of(context).size.height;

final screenWidth =
    MediaQuery.of(context).size.width;
```

On récupère :

- largeur disponible
- hauteur disponible

---

## Exemple : taille proportionnelle

Au lieu de :

```dart
Container(
  width:74,
  height:74,
)
```

Faire :

```dart
final size =
    MediaQuery.of(context).size.width * 0.18;

Container(
  width:size,
  height:size,
)
```

Résultat :

Petit écran :

```
360 * 0.18 = 65 px
```

Grand écran :

```
600 * 0.18 = 108 px
```

Le logo s'adapte.

---

# 5. LayoutBuilder

## Rôle

`LayoutBuilder` permet de connaître l'espace donné par le parent.

Très utile pour créer plusieurs versions d'un widget.

Exemple :

```dart
LayoutBuilder(
 builder:(context,constraints){

   if(constraints.maxWidth < 400){

     return SmallLayout();

   }

   return LargeLayout();

 }
)
```

Signification :

- largeur < 400 → petit écran
- largeur >= 400 → grand écran

---

# 6. Column et problème de hauteur

Une Column place ses enfants verticalement.

Exemple :

```dart
Column(
 children:[
   Logo(),
   Text(),
   Button(),
 ]
)
```

Equivalent CSS :

```css
display: flex;
flex-direction: column;
```

---

Le problème :

Si la hauteur est insuffisante :

```
Logo

Texte

Message

Bouton

+
+
+

Pas assez de place
```

Flutter peut afficher :

```
BOTTOM OVERFLOWED BY xx PIXELS
```

---

# 7. SingleChildScrollView

Pour les pages contenant beaucoup de texte :

Utiliser :

```dart
SingleChildScrollView(
 child: Column(
   children:[
   ]
 )
)
```

Cela permet de faire défiler le contenu.

À utiliser pour :

- page d'accueil avec description
- conditions d'utilisation
- formulaire long

---

À éviter pour :

- écran de jeu
- tableau de score
- interface qui doit rester fixe

---

# 8. Expanded

Equivalent CSS :

```css
flex: 1;
```

Exemple :

```dart
Expanded(
 child: Text(...)
)
```

Signification :

> prends tout l'espace disponible.

Utilisation :

Très utile dans :

- Row
- Column

---

# 9. Flexible

Similaire à Expanded mais plus souple.

Exemple :

```dart
Flexible(
 child: Text(...)
)
```

Permet au contenu de prendre de la place sans forcer.

Très utile pour :

- textes longs
- descriptions
- boutons avec texte variable

---

# 10. Spacer

## Rôle

Spacer prend l'espace disponible restant.

Exemple :

```dart
Column(
 children:[
   Text("Titre"),

   Spacer(),

   Button()
 ]
)
```

Résultat :

```
Titre


(grand espace)


Bouton
```

---

Equivalent CSS :

```css
flex: 1;
```

ou

```css
margin-top: auto;
```

---

## Attention avec Spacer

Spacer peut poser problème sur les petits écrans.

Exemple :

Petit téléphone :

```
Titre

pas assez de place

Bouton
```

Grand téléphone :

```
Titre



(grand vide)



Bouton
```

Pour une page responsive, parfois il vaut mieux utiliser :

```dart
SizedBox(height:30)
```

ou :

```dart
SizedBox(
 height: MediaQuery.of(context).size.height * 0.05,
)
```

---

# 11. Gestion des espaces

## Mauvais

```dart
SizedBox(
 height:200,
)
```

Trop rigide.

---

## Mieux

```dart
SizedBox(
 height:
 MediaQuery.of(context).size.height * 0.05,
)
```

L'espace dépend de l'écran.

---

# 12. Responsive du texte

Éviter :

```dart
fontSize:32
```

partout.

Un texte trop grand peut casser un écran.

Flutter possède aussi une gestion d'accessibilité :

```dart
MediaQuery.textScalerOf(context)
```

qui permet d'adapter les tailles selon les préférences utilisateur.

---

# 13. Packages responsive

Il existe des packages :

## flutter_screenutil

Permet d'écrire :

```dart
20.w
30.h
```

au lieu de :

```dart
20
30
```

---

## responsive_framework

Permet de gérer :

- mobile
- tablette
- web

---

Cependant :

Pour apprendre Flutter, il vaut mieux comprendre d'abord :

- MediaQuery
- LayoutBuilder
- Expanded
- Flexible

Avant d'ajouter des packages.

---

# 14. Exemple de structure recommandée pour un écran

Pour une page comme WelcomeScreen :

```
Scaffold

 └── SafeArea

      └── SingleChildScrollView

            └── Padding

                  └── Column

                        ├── Logo

                        ├── SizedBox

                        ├── Titre

                        ├── Texte

                        ├── Message important

                        └── Bouton
```

---

# 15. Analyse du WelcomeScreen

Le code actuel utilise :

```dart
Column
Padding
SizedBox
Spacer
Text
RichText
Container
```

C'est une bonne base.

Mais certains éléments sont fixes :

```dart
width:74

height:74

fontSize:20

padding:26
```

Ils peuvent être adaptés plus tard.

---

# 16. Pour le projet Score Belote

Pour l'instant garder :

✅ Column
✅ Row
✅ Expanded
✅ Flexible
✅ SingleChildScrollView
✅ MediaQuery

Éviter pour le moment :

❌ Ajouter beaucoup de packages responsive
❌ Faire des calculs compliqués
❌ Tout rendre dynamique immédiatement

La priorité :

1. Comprendre les widgets Flutter
2. Créer un design propre
3. Adapter les écrans importants
4. Ajouter une architecture plus avancée ensuite

---

# Conclusion

Le responsive Flutter n'est pas seulement "faire rentrer le contenu".

C'est apprendre à laisser Flutter gérer l'espace.

Les outils principaux :

- `MediaQuery` → connaître la taille de l'écran
- `LayoutBuilder` → réagir à la taille disponible
- `Expanded` → remplir l'espace
- `Flexible` → s'adapter sans forcer
- `SingleChildScrollView` → gérer les contenus longs
- `Spacer` → créer des espaces flexibles

Une bonne interface Flutter n'est pas une interface avec beaucoup de valeurs calculées.

C'est une interface qui utilise correctement le système de layout de Flutter.
