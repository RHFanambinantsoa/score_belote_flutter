# Flutter Widgets vs CSS — Guide de référence

## Introduction

Comme je connais CSS, le plus simple est de voir Flutter comme un système où les **widgets remplacent les balises HTML + CSS**.

La grande différence :

- En web : on a une structure **HTML**, puis on applique du **CSS**.
- En Flutter : tout est un **widget**, et le style est souvent directement dans le widget ou dans un `Theme`.

---

## Comparaison de base

### HTML / CSS

```html
<button class="primary">Valider</button>
```

```css
.primary {
  background: gold;
  border-radius: 16px;
  padding: 10px;
}
```

### Flutter

```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.amber,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),
  child: Text("Valider"),
)
```

---

# 1. Les widgets de structure (équivalent layout CSS)

Ce sont les widgets les plus importants à connaître.

| Flutter              | CSS équivalent                                             | Rôle                        |
| -------------------- | ---------------------------------------------------------- | --------------------------- |
| `Container`          | `<div>` + CSS                                              | boîte avec style            |
| `SizedBox`           | `width / height`                                           | espace ou taille fixe       |
| `Padding`            | `padding`                                                  | espace intérieur            |
| `Container(margin:)` | `margin`                                                   | espace extérieur            |
| `Center`             | `display:flex; justify-content:center; align-items:center` | centrer                     |
| `Align`              | `align-items / text-align`                                 | positionner                 |
| `Row`                | `display:flex; flex-direction:row`                         | ligne horizontale           |
| `Column`             | `display:flex; flex-direction:column`                      | colonne verticale           |
| `Stack`              | `position:absolute`                                        | superposition               |
| `Expanded`           | `flex:1`                                                   | prendre l'espace disponible |
| `Flexible`           | `flex` moins strict                                        | prendre une partie          |
| `Spacer`             | espace libre en flex                                       | créer un espace             |

---

## Exemple Flexbox CSS vs Flutter

### CSS

```css
.container {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
```

### Flutter

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children:[
    Text("A"),
    Text("B"),
  ],
)
```

---

# 2. Les widgets de style (équivalent CSS visuel)

Le plus gros outil est :

```dart
Container + BoxDecoration
```

C'est l'équivalent d'une classe CSS.

---

## Exemple CSS

```css
.card {
  background: white;
  border-radius: 12px;
  border: 2px solid black;
  box-shadow: 0 4px 10px grey;
}
```

---

## Flutter

```dart
Container(
 decoration: BoxDecoration(
   color: Colors.white,

   borderRadius: BorderRadius.circular(12),

   border: Border.all(
     color: Colors.black,
     width:2,
   ),

   boxShadow:[
     BoxShadow(
       blurRadius:10,
     )
   ],
 ),
)
```

---

# 3. Le texte (équivalent font CSS)

## CSS

```css
.title {
  font-size: 24px;
  font-weight: bold;
  color: red;
  letter-spacing: 2px;
}
```

## Flutter

```dart
Text(
 "Titre",
 style: TextStyle(
   fontSize:24,
   fontWeight:FontWeight.bold,
   color:Colors.red,
   letterSpacing:2,
 ),
)
```

---

## Correspondances CSS / Flutter

| CSS             | Flutter       |
| --------------- | ------------- |
| font-size       | fontSize      |
| font-weight     | fontWeight    |
| color           | color         |
| letter-spacing  | letterSpacing |
| line-height     | height        |
| text-decoration | decoration    |

---

# 4. Les boutons

## Bouton HTML

```html
<button></button>
```

## Flutter

| Widget                 | Usage               |
| ---------------------- | ------------------- |
| `ElevatedButton`       | bouton principal    |
| `TextButton`           | bouton simple       |
| `OutlinedButton`       | bouton avec contour |
| `IconButton`           | bouton icône        |
| `FloatingActionButton` | bouton flottant     |

---

# 5. Les listes

En CSS :

```css
display: flex;
flex-direction: column;
```

En Flutter :

```dart
ListView(
 children:[
   Text("A"),
   Text("B"),
 ]
)
```

---

## Widgets de liste

| Flutter            | Usage                   |
| ------------------ | ----------------------- |
| `ListView`         | liste scrollable        |
| `ListView.builder` | grande liste dynamique  |
| `GridView`         | grille                  |
| `Wrap`             | équivalent de flex-wrap |

---

# 6. Les images

## HTML

```html
<img src="logo.png" />
```

## Flutter

```dart
Image.asset(
 "assets/logo.png",
)
```

---

## Object-fit CSS

CSS :

```css
object-fit: cover;
```

Flutter :

```dart
Image.asset(
 fit: BoxFit.cover,
)
```

---

# 7. Positionnement

## CSS

```css
position: absolute;
top: 10px;
right: 20px;
```

## Flutter

```dart
Stack(
 children:[
   Positioned(
     top:10,
     right:20,
     child:Text("X"),
   )
 ]
)
```

---

# 8. Les animations

## CSS

```css
transition: all 0.3s;
```

## Flutter

| Widget               | Usage                     |
| -------------------- | ------------------------- |
| `AnimatedContainer`  | changement de style animé |
| `AnimatedPositioned` | position animée           |
| `AnimatedOpacity`    | transparence              |
| `Hero`               | transition entre pages    |

---

Exemple dans Score Belote :

Le bouton enfoncé utilise :

```dart
AnimatedPositioned
```

pour descendre légèrement quand on clique.

---

# 9. Responsive Design

## CSS

```css
width: 50%;
max-width: 400px;
```

## Flutter

Utiliser :

```dart
Expanded(
 child: Widget()
)
```

ou :

```dart
MediaQuery.of(context).size.width
```

Exemple :

```dart
final width = MediaQuery.of(context).size.width;
```

---

# 10. Les widgets à absolument maîtriser

## Niveau débutant ⭐

- `Container`
- `SizedBox`
- `Padding`
- `Center`
- `Row`
- `Column`
- `Text`
- `Icon`
- `Image`
- `Scaffold`

---

## Niveau intermédiaire ⭐⭐

- `Stack`
- `Positioned`
- `Expanded`
- `Flexible`
- `Wrap`
- `ListView`
- `GestureDetector`
- `InkWell`
- `SingleChildScrollView`

---

## Niveau avancé ⭐⭐⭐

- `CustomPaint` (dessiner comme Canvas)
- `AnimatedContainer`
- `AnimatedBuilder`
- `SliverList`
- `LayoutBuilder`
- `InheritedWidget`
- `Theme`
- `MediaQuery`

---

# La mentalité à avoir venant de CSS

En CSS on pense :

```
HTML
 |
 CSS
 |
 rendu
```

En Flutter :

```
Widget
 |
Widget
 |
Widget
 |
rendu
```

---

## Exemple d'un écran Flutter

```dart
Scaffold
 └── SafeArea
      └── Padding
           └── Column
                ├── Text
                ├── GameVariantSelector
                └── AppPrimaryButton
```

C'est l'équivalent d'un arbre HTML + CSS.

---

# Conclusion pour Score Belote

Vu l'état actuel du projet :

- utilisation d'extensions Dart
- création de widgets réutilisables
- création d'un thème
- séparation `models`, `widgets`, `enums`, `services`

Le niveau débutant est déjà dépassé.

Le prochain gros morceau à maîtriser est surtout :

- `Row`
- `Column`
- `Expanded`
- `Flexible`
- `Stack`

car ils sont l'équivalent du **Flexbox CSS**, mais avec des règles plus strictes.

Comprendre ces widgets permet de construire presque toutes les interfaces Flutter.
