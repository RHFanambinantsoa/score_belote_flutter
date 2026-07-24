# Flutter - Rendre un texte cliquable

## 1. Pourquoi un Text classique n'est pas cliquable ?

Le widget `Text` sert uniquement à afficher du texte.

Exemple :

```dart
Text("Mot de passe oublié ?")
```

Ce texte est affiché mais ne réagit pas aux interactions.

Pour détecter un clic, il faut ajouter un comportement.

---

# 2. Méthode simple : GestureDetector

`GestureDetector` permet d'ajouter des gestes à un widget.

Exemple :

```dart
GestureDetector(
  onTap: () {
    print("Texte cliqué");
  },
  child: Text(
    "Mot de passe oublié ?",
  ),
)
```

Ici :

- `child` = le widget qui reçoit le geste
- `onTap` = fonction exécutée lors du clic

---

# 3. Exemple avec navigation

On peut utiliser un texte cliquable pour aller vers une autre page.

```dart
GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HistoryScreen(),
      ),
    );
  },
  child: Text(
    "Voir l'historique",
  ),
)
```

Quand l'utilisateur clique sur le texte :

```
Voir l'historique
        |
        v
HistoryScreen
```

---

# 4. Ajouter un style pour montrer que le texte est cliquable

Un texte cliquable doit généralement être visuellement différent.

Exemple :

```dart
GestureDetector(
  onTap: () {
    print("clic");
  },
  child: Text(
    "Créer un compte",
    style: TextStyle(
      color: Colors.blue,
      decoration: TextDecoration.underline,
    ),
  ),
)
```

Résultat :

```
Créer un compte
^^^^^^^^^^^^^^^
(couleur + soulignement)
```

L'utilisateur comprend qu'il peut cliquer.

---

# 5. Utiliser InkWell (souvent préférable avec Material Design)

`InkWell` est une alternative à `GestureDetector`.

La différence :

- `GestureDetector` détecte seulement le geste
- `InkWell` ajoute un effet visuel (ripple)

Exemple :

```dart
InkWell(
  onTap: () {
    print("clic");
  },
  child: Text(
    "Historique",
  ),
)
```

Lors du clic :

```
Historique
    ↓
effet d'onde Material
```

---

# 6. InkWell nécessite un contexte Material

Dans certains cas, `InkWell` doit être placé dans un widget Material.

Exemple :

```dart
Material(
  child: InkWell(
    onTap: () {},
    child: Text("Cliquer"),
  ),
)
```

---

# 7. TextButton pour un texte cliquable simple

Si le texte représente une action, `TextButton` est souvent le meilleur choix.

Exemple :

```dart
TextButton(
  onPressed: () {
    print("Action");
  },
  child: Text(
    "Annuler",
  ),
)
```

Avantages :

- accessible
- respecte Material Design
- gestion du focus
- effet visuel automatique

---

# 8. Quel widget utiliser ?

| Besoin                         | Widget conseillé                    |
| ------------------------------ | ----------------------------------- |
| Simple clic sur un texte       | `TextButton`                        |
| Texte avec effet Material      | `InkWell`                           |
| Détecter un geste personnalisé | `GestureDetector`                   |
| Lien dans une phrase           | `RichText` + `TapGestureRecognizer` |

---

# 9. Rendre seulement une partie d'un texte cliquable

Exemple :

Phrase :

```
J'accepte les conditions d'utilisation
```

On veut seulement rendre :

```
conditions d'utilisation
```

cliquable.

Utiliser `RichText`.

```dart
RichText(
  text: TextSpan(
    text: "J'accepte les ",
    children: [
      TextSpan(
        text: "conditions d'utilisation",
        style: TextStyle(
          color: Colors.blue,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            print("Conditions cliquées");
          },
      ),
    ],
  ),
)
```

---

# 10. Résumé

Pour un texte entièrement cliquable :

```dart
GestureDetector(
  onTap: () {},
  child: Text("Cliquer"),
)
```

ou :

```dart
TextButton(
  onPressed: () {},
  child: Text("Cliquer"),
)
```

Pour une vraie interface utilisateur Flutter :

- bouton → `TextButton`
- lien → `RichText`
- geste personnalisé → `GestureDetector`
- effet Material → `InkWell`
