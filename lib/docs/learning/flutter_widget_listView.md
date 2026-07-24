# Flutter ListView — Explications et bonnes pratiques

## 1. Qu'est-ce que ListView ?

`ListView` est un widget Flutter qui permet d'afficher une liste d'éléments qui peuvent défiler (scroll).

C'est l'équivalent d'une liste HTML avec un conteneur scrollable :

```html
<div class="container">
  <div>Item 1</div>
  <div>Item 2</div>
  <div>Item 3</div>
</div>
```

Avec CSS :

```css
.container {
  overflow-y: scroll;
}
```

En Flutter, `ListView` gère automatiquement :

- le défilement vertical
- le calcul de la taille des éléments
- le recyclage des éléments visibles
- l'optimisation des performances pour les longues listes

---

# 2. Utilisation simple

Exemple :

```dart
ListView(
  children: [
    Text("Premier élément"),
    Text("Deuxième élément"),
    Text("Troisième élément"),
  ],
)
```

Résultat :

```
Premier élément

Deuxième élément

Troisième élément

        ↓
      scroll
```

Chaque enfant est affiché verticalement.

---

# 3. ListView dans une Column : problème fréquent

## Mauvais exemple

```dart
Column(
  children: [
    Text("Titre"),

    ListView(
      children: [
        Text("Item 1"),
        Text("Item 2"),
      ],
    )
  ],
)
```

Cela provoque souvent une erreur :

```
Vertical viewport was given unbounded height
```

## Pourquoi ?

Une `Column` donne une hauteur illimitée à ses enfants.

La `ListView` ne connaît donc pas sa hauteur.

Flutter a un conflit :

La Column dit :

> "Prends autant de place que possible."

La ListView dit :

> "Je prends la hauteur nécessaire à mon contenu."

Flutter ne sait pas quelle taille appliquer.

---

# 4. Solution : Expanded

Quand une ListView doit prendre l'espace restant :

```dart
Column(
  children: [

    Text("Titre"),

    Expanded(
      child: ListView(
        children: [
          Text("Item 1"),
          Text("Item 2"),
        ],
      ),
    ),

  ],
)
```

Structure :

```
Column
│
├── Titre
│
└── Expanded
      │
      └── ListView
            │
            ├── Item 1
            ├── Item 2
            └── ...
```

`Expanded` signifie :

> "Prends toute la place disponible restante."

---

# 5. ListView.builder

Quand la liste contient beaucoup d'éléments, il faut utiliser :

```dart
ListView.builder(
  itemCount: items.length,

  itemBuilder: (context, index) {

    final item = items[index];

    return Text(
      item.name,
    );

  },
)
```

## Pourquoi utiliser builder ?

`ListView` classique crée tous les widgets directement.

Exemple :

```
1000 éléments

Créer 1000 widgets
Afficher seulement quelques éléments visibles
```

Avec `ListView.builder` :

```
Créer uniquement les éléments visibles
Créer les autres au moment du scroll
```

C'est beaucoup plus performant.

Cela ressemble au fonctionnement de :

- Angular avec `*ngFor`
- React avec le rendering optimisé

---

# 6. Les paramètres importants de ListView.builder

## itemCount

Définit le nombre d'éléments :

```dart
itemCount: items.length
```

Exemple :

```dart
itemCount: 20
```

Flutter créera 20 éléments.

---

## itemBuilder

Fonction appelée pour construire chaque élément :

```dart
itemBuilder: (context, index)
```

`index` représente la position :

```
0 → premier élément

1 → deuxième élément

2 → troisième élément
```

Exemple :

```dart
itemBuilder: (context, index) {

  return Text(
    "Item $index"
  );

}
```

Résultat :

```
Item 0
Item 1
Item 2
...
```

---

# 7. Afficher les éléments dans l'ordre inverse

Par défaut :

```
Ancien

Item 1

Item 2

Item 3

Récent
```

Pour afficher le dernier élément en premier :

```
Récent

Item 3

Item 2

Item 1

Ancien
```

Il faut inverser la liste.

## Méthode simple

```dart
items.reversed
```

Mais attention :

`reversed` retourne un Iterable.

Souvent il faut faire :

```dart
items.reversed.toList()
```

Exemple :

```dart
final reversedItems = items.reversed.toList();
```

Puis :

```dart
ListView.builder(

  itemCount: reversedItems.length,

  itemBuilder: (context,index){

    final item = reversedItems[index];

    return Text(item.name);

  },

)
```

---

# 8. Garder un élément fixe pendant le scroll

En CSS :

```css
position: fixed;
```

Flutter n'utilise pas ce système.

On utilise plutôt la structure des widgets.

Exemple :

```
Column

├── Header fixe
│
└── Expanded
      │
      └── ListView scrollable
```

Code :

```dart
Column(
  children: [

    Header(),

    Expanded(
      child: ListView.builder(
        itemBuilder: ...
      ),
    )

  ],
)
```

Résultat :

```
----------------
Header fixe
----------------

Item 1

Item 2

Item 3

(scroll)
```

Le header reste visible.

---

# 9. Hauteur et ListView

Une ListView doit connaître sa hauteur.

## Correct

Avec Expanded :

```dart
Expanded(
  child: ListView(...)
)
```

Avec SizedBox :

```dart
SizedBox(
  height: 400,

  child: ListView(...)
)
```

## Incorrect

```dart
Column(
  children:[
    ListView()
  ]
)
```

Car la hauteur n'est pas définie.

---

# 10. ListView avec des cartes personnalisées

Exemple :

```dart
ListView.builder(

 itemCount: items.length,

 itemBuilder:(context,index){

   final item = items[index];

   return Card(
     child: ListTile(

       title: Text(
         item.title
       ),

       trailing: Text(
         item.value.toString()
       ),

     ),
   );

 }

)
```

Structure :

```
-----------------
Titre

Valeur
-----------------

Titre

Valeur
-----------------
```

---

# 11. Différence Column vs ListView

## Column

Utiliser quand :

- nombre d'éléments limité
- contenu fixe
- pas besoin de scroll

Exemple :

```
Titre

Image

Bouton

Bouton
```

---

## ListView

Utiliser quand :

- beaucoup d'éléments
- contenu dynamique
- besoin de scroll

Exemple :

```
Item 1

Item 2

Item 3

...

Item 100
```

---

# 12. Différence ListView et ListView.builder

## ListView

```dart
ListView(
 children:[
   Widget1(),
   Widget2(),
   Widget3(),
 ]
)
```

Utilisation :

- petites listes
- contenu connu à l'avance

---

## ListView.builder

```dart
ListView.builder(
 itemBuilder: ...
)
```

Utilisation :

- longues listes
- données venant d'une API
- données dynamiques
- meilleure performance

---

# 13. Structure générale recommandée pour un écran avec une liste

```
Scaffold

 |
Column

 |
├── Partie fixe
│
├── Expanded
│
└── ListView.builder
        |
        ├── Item
        ├── Item
        └── Item
```

---

# 14. Résumé à retenir

## Column

```
Contenu fixe
Pas de scroll
```

---

## Expanded

```
Prend l'espace restant disponible
```

---

## ListView

```
Liste scrollable
```

---

## ListView.builder

```
Liste optimisée pour beaucoup d'éléments
```

---

## Règle importante

Ne jamais faire :

```
Column
 |
 ListView
```

Faire :

```
Column
 |
 Expanded
 |
 ListView
```

---

# 15. Comparaison rapide avec CSS

| Flutter   | CSS / Web                    |
| --------- | ---------------------------- |
| Column    | Flex column                  |
| Row       | Flex row                     |
| Expanded  | flex: 1                      |
| ListView  | overflow-y: scroll           |
| SizedBox  | width / height fixe          |
| Container | div                          |
| Padding   | padding                      |
| Margin    | margin                       |
| Stack     | position relative + absolute |

Flutter ne fonctionne pas avec des positions absolues partout comme le web.

La mise en page repose principalement sur :

- Row
- Column
- Expanded
- Flexible
- Stack
- Constraints

Comprendre ces widgets est essentiel pour créer des interfaces Flutter propres.
