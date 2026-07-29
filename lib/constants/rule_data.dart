import '../models/rule_content.dart';

/// Tout le texte de l'écran "Règles du jeu", séparé de l'affichage.
/// référencer un terme du glossaire avec `{{terme}}` (le texte entre
/// accolades doit correspondre exactement à une clé de [ruleGlossary]).

/// Termes techniques cliquables, affichés en bottom sheet.
final Map<String, RuleGlossaryTerm> ruleGlossary = {
  'cartes françaises': const RuleGlossaryTerm(
    title: 'Cartes françaises',
    icon: '🃏',
    body: [
      RuleParagraph(
        'Les cartes françaises désignent un type de jeu de cartes dont les '
        'symboles et les couleurs sont ceux utilisés traditionnellement en '
        'France.',
      ),
      RuleParagraph(
        'Un jeu classique contient 52 cartes réparties en 4 '
        'couleurs, chacune contenant : As, Roi, Dame, Valet, 10 à 2.',
      ),
      RuleTableBlock(
        rows: [
          RuleRow('♠ Pique', '13 cartes'),
          RuleRow('♥ Cœur', '13 cartes'),
          RuleRow('♦ Carreau', '13 cartes'),
          RuleRow('♣ Trèfle', '13 cartes'),
        ],
      ),
    ],
  ),
  'couper le paquet': const RuleGlossaryTerm(
    title: 'Comment couper le paquet ?',
    icon: '✂️',
    body: [
      RuleParagraph(
        '1. Le joueur qui coupe prend le paquet complet, posé face cachée.\n'
        '2. Il soulève une partie du paquet avec une main.\n'
        '3. Il pose cette partie à côté.\n'
        "4. Il prend la partie restante et la place sur l'autre partie.",
      ),
      RuleWarning(
        'Règle de coupe : la partie séparée doit contenir au minimum 4 '
        "cartes. Une coupe de moins de 4 cartes n'est pas autorisée.",
      ),
    ],
  ),
  'atout': const RuleGlossaryTerm(
    title: "Qu'est-ce qu'un atout ?",
    icon: '🂡',
    body: [
      RuleParagraph(
        'Un atout désigne une couleur spéciale qui devient plus forte que '
        "les autres pendant une manche. Une carte de cette couleur peut "
        "battre une carte d'une autre couleur, même si sa valeur normale "
        "est inférieure.",
      ),
      RuleExample(
        "Jeu en Cœur.\n "
        "Un joueur joue ♠ As. Un autre, sans pique, joue ♥ 7. "
        "Même si c'est une petite carte, le ♥ 7 remporte le pli car le "
        "cœur est l'atout.",
      ),
    ],
  ),
  'bonne': const RuleGlossaryTerm(
    title: "Que signifie le terme \"Bonne\" ?",
    icon: '🂡',
    body: [
      RuleParagraph(
        "Quand un joueur dit \"bonne\" cela signifie qu'il accepte le type de jeu annoncé "
        "et ne souhaite pas proposer un autre type de jeu supérieur à celui annoncé.",
      ),
    ],
  ),
};

/// Les 12 sections numérotées de l'écran, dans l'ordre d'affichage.
/// La section "13. Tableaux de référence" est gérée séparément (voir
/// [ruleReferenceTables]) car elle n'a pas de numéro d'accordéon propre.
final List<RuleSection> ruleSections = [
  const RuleSection(
    number: '0.',
    title: 'Note de l\'autrice',
    blocks: [
      RuleParagraph(
        "Dans cette documentation, j'ai essayé d'expliquer les règles du jeu du mieux possible, "
        "en m'appuyant sur mes connaissances et mon expérience de la Belote Gasy.",
      ),
      RuleParagraph(
        "Malgré le soin apporté à sa rédaction, il est possible que certaines explications "
        "soient incomplètes, imprécises ou ne correspondent pas aux règles pratiquées "
        "dans toutes les régions ou tous les cercles de joueurs.",
      ),
      RuleParagraph(
        "Si vous remarquez une erreur, une information à corriger, une règle manquante "
        "ou si vous avez des suggestions permettant d'améliorer cette documentation, "
        "je vous serais très reconnaissante de me les faire parvenir.",
      ),
      RuleExample(
        "Toute remarque constructive est la bienvenue et contribuera à rendre cette documentation "
        "plus claire, plus complète et plus fidèle aux différentes pratiques du jeu.",
      ),
      RuleParagraph("Merci pour votre lecture et votre contribution."),
    ],
  ),
  const RuleSection(
    number: '1.',
    title: 'Présentation du jeu',
    blocks: [
      RuleParagraph("La Belote Gasy est une variante de la belote classique."),
      RuleParagraph(
        "Elle reprend les principes généraux du jeu : choisir un type de jeu, jouer des plis, "
        "compter les points et atteindre un objectif afin de remporter la partie.",
      ),
      RuleParagraph(
        "Cette version possède toutefois certaines règles particulières "
        "qui la distinguent de la belote classique.",
      ),
    ],
  ),
  const RuleSection(
    number: '2.',
    title: 'Cartes utilisées',
    initiallyOpen: true,
    blocks: [
      RuleParagraph(
        'La Belote Gasy se joue avec des {{cartes françaises}}, comme la '
        'belote classique.',
      ),
      RuleParagraph(
        'Pour la belote, on utilise une version réduite de 32 cartes, '
        'contenant uniquement :',
      ),
      RuleExample(
        "As, Roi, Dame, Valet, 10, 9, 8, 7, dans les quatre couleurs (♠ ♥ ♦ ♣).",
      ),
    ],
  ),
  const RuleSection(
    number: '3.',
    title: 'Nombre de joueurs',
    blocks: [
      RuleParagraph(
        "La Belote Gasy peut se jouer avec plusieurs configurations :",
      ),
      RuleSubtitle('4 joueurs '),
      RuleParagraph(
        "Les joueurs sont répartis en deux équipes de deux joueurs. "
        "Les partenaires d'une même équipe sont placés face à face.",
      ),
      RuleSubtitle('Autres configurations (moins courantes)'),
      RuleParagraph('3 joueurs (jeu de capot) : 24 cartes utilisées.'),
      RuleParagraph('2 joueurs : 32 cartes, chaque joueur reçoit 16 cartes.'),
      RuleNote(
        "La suite de cette documentation sera consacrée à la belote à 4 joueurs.",
      ),
    ],
  ),
  const RuleSection(
    number: '4.',
    title: 'Objectif de la partie',
    blocks: [
      RuleParagraph("L'objectif principal : "),
      RuleExample("Atteindre 150 points."),
      RuleParagraph(
        "Une équipe gagne dès qu'elle atteint ou dépasse cet objectif.",
      ),
      RuleSubtitle("Cas particulier"),
      RuleParagraph(
        "un cas particulier peut arriver lorsque "
        "les deux équipes dépassent l'objectif après une même manche."
        "Das ce cas, aucune équipe n'est déclarée gagnante immédiatement",
      ),
      RuleExample(" L'objectif augmente alors de 50 points."),
      RuleParagraph("Exemple : "),
      RuleParagraph(
        "Avant la manche : équipe A = 148 pts, équipe B = 147 pts.",
      ),
      RuleParagraph("Manche terminée : équipe A +10pts, équipe B +16pts "),
      RuleParagraph(
        "Ces points obtenus font que les deux équipes dépassent 150 points en même temps",
      ),
      RuleParagraph('Le nouvel objectif devient 200 points.'),
      RuleWarning(
        "Si les deux équipes atteignent aussi ce nouvel objectif ensemble, il augmente encore "
        "de 50 points, et ainsi de suite jusqu'à ce qu'une seule équipe atteint l'objectif",
      ),
    ],
  ),
  const RuleSection(
    number: '5.',
    title: 'Préparation des cartes',
    blocks: [
      RuleSubtitle('Mélange des cartes et coupes'),
      RuleParagraph(
        'En Belote Gasy, il est courant de ne pas mélanger les cartes après '
        'chaque manche. La pratique habituelle consiste simplement à '
        '{{couper le paquet}}.',
      ),

      RuleSubtitle('Le ToutA forcé'),
      RuleParagraph(
        'Lorsque les joueurs choisissent de ne pas mélanger les cartes '
        'pendant la partie, une préparation spéciale peut être faite au '
        'début de la partie:\n\n'
        '1. Les cartes sont mélangées une seule fois.\n'
        '2. Une première manche est jouée obligatoirement en ToutA.\n'
        '3. Cette manche sert uniquement de préparation.\n'
        '4. Ses points ne sont pas comptabilisés.\n'
        "5. Ensuite, les cartes ne sont plus mélangées jusqu'à la fin de "
        'la partie.\n\n'
        'Le but est de rendre les cartes jouables avant de commencer la '
        'vraie partie.',
      ),
      RuleNote(
        'Remarque : certains joueurs préfèrent mélanger les cartes '
        'avant chaque manche — cela dépend des habitudes de chacun.',
      ),
    ],
  ),
  const RuleSection(
    number: '6.',
    title: 'Distribution des cartes',
    blocks: [
      RuleParagraph(
        'Avant chaque distribution, le joueur situé à droite du '
        'distributeur coupe le paquet. Le distributeur récupère ensuite '
        "les cartes et distribue ",
      ),
      RuleExample("dans le sens des aiguilles d'une montre."),
      RuleSubtitle('Première distribution'),
      RuleParagraph(
        'Les cartes ne sont pas distribuées une par une : le distributeur '
        'les distribue',
      ),
      RuleExample("par paquets (3 cartes par joueurs puis 2 cartes)."),
      RuleParagraph(
        "Cela peut varier selon la préférence du distributeur.\n"
        "L'important c'est que chaque joueur reçoit d'abord 5 cartes en main par paquet de 2 ou de 3 cartes.",
      ),
    ],
  ),
  const RuleSection(
    number: '7.',
    title: "L'appel et le choix du jeu",
    initiallyOpen: true,
    blocks: [
      RuleParagraph(
        'Après avoir reçu les 5 premières cartes, les joueurs procèdent à '
        "l'appel.\n"
        "Le premier joueur choisit le type de jeu qu'il veut appeler"
        " selon les cartes qu'il a en main et ce qui serait favorable pour lui de jouer."
        "— chaque type "
        'de jeu a un ordre des cartes et un score différents. \n'
        'Le premier joueur à parler est celui situé à gauche du '
        "distributeur. Puis il passe la parole au suivant et ainsi de suite dans le sens des aiguilles d'une "
        "montre. Jusqu'à ce qu'à validation du type de jeu à jouer.",
      ),
      RuleSubtitle('Les 6 types de jeux'),
      RuleParagraph(
        'Les couleurs : 1.Trèfle ♣ | 2.Carreau ♦ | 3.Cœur ♥ | 4.Pique ♠ . \n'
        '5.SansA (Sans Atout) | 6.ToutA (Tout Atout).',
      ),
      RuleSubtitle('Ordre des appels'),
      RuleExample('Trèfle ♣ → Carreau ♦ → Cœur ♥ → Pique ♠ → SansA → ToutA'),
      RuleWarning(
        "Un joueur ne peut pas revenir à un type de jeu inférieur à ce que le joueur précédent à appeler",
      ),
      RuleParagraph(
        "Exemple : \n "
        "Le joueur A appelle Pique ♠ , le joueur B ainsi que tous les autres joueurs qui suivent ne peut plus appeler Trèfle ♣ , Carreau ♦ ou Cœur ♥ . \n"
        "Les types de jeu autorisés à appeler après cet appel sont donc : Pique ♠ , SansA ou ToutA.",
      ),
      RuleSubtitle('Accord entre partenaires'),
      RuleWarning(
        "Si un joueur appelle une couleur, son partenaire ne peut pas appeler une autre couleur."
        "(tsy mahazo manitsaka couleur-n'ny akama)",
      ),
      RuleParagraph(
        "Exemple : \n"
        "Si le joueur A appelle Cœur ♥. Son partenaire (Joueur C) ne peut pas appeller Pique ♠.",
      ),
      RuleParagraph(
        "Cette restriction concerne uniquement les couleurs — le partenaire peut toujours appeler SansA ou ToutA.",
      ),
      RuleSubtitle("Nombre maximum d'appels de couleur"),
      RuleParagraph(
        'Une équipe ne peut pas multiplier les appels de couleur sans '
        'limite. La règle généralement appliquée est un maximum de 3 '
        'appels de couleur au total, en particulier lorsque le premier '
        'appel commence par Trèfle ♣.',
      ),
      RuleParagraph(
        'Exemple : \n'
        'Joueur A appelle Trèfle ♣. Joueur B appelle Carreau. Joueurs C et '
        'D acceptent Carreau ("bonne"). Joueur A peut encore appeler un autre couleur, '
        'Pique ♠ par exemple.',
      ),
      RuleWarning(
        "Cette règle peut nécessiter une précision supplémentaire selon les habitudes exactes des joueurs.",
      ),
    ],
  ),
  const RuleSection(
    number: '8.',
    title: 'Validation du jeu',
    initiallyOpen: true,
    blocks: [
      RuleParagraph(
        "Un jeu est joué dès que tous les joueurs se sont mis d'accord. \n"
        "Plusieurs situations arrêtent l'appel immédiatement :",
      ),
      RuleSubtitle("Trèfle bonne"),
      RuleParagraph(
        "Lorsque un joueur appelle Trèfle et que le joueur suivant dit : \"{{bonne}}\" , \n"
        "Le jeu est immédiatement validé.\n"
        "Les autres joueurs ne parlent plus. La manche est jouée en Trèfle.",
      ),
      RuleSubtitle("SansA bonne"),
      RuleParagraph(
        "Même principe que trèfle bonne. La manche est jouée en SansA",
      ),
      RuleSubtitle("ToutA"),
      RuleParagraph(
        "Puisque ToutA est le dernier type de jeu qu'on peut appeler, "
        "il est evident que quand un joueur appelle ToutA, on joue directement en ToutA.",
      ),
      RuleSubtitle("Contré"),
      RuleParagraph(
        "Le contré se fait pendant l'appel. \n"
        "Lorsqu'un joueur appelle un type de jeu , l'équipe adverse peut \"Contré\"",
      ),
      RuleWarning(
        "1. Un joueur peut contré même si ce n'est pas encore à son tour de parler\n"
        "2. Un joueur ne peut pas contré si c'est son partenaire qui a fait l'appel.\n"
        "3. La manche se joue directement dans le type de jeu appelé avec le multiplicateur du Contré",
      ),
      RuleParagraph(
        "Exemple :"
        "Joueur A appelle SansA. Le joueur D peut annoner immédiatement Contré\n"
        "La manche se joue en SansA contré",
      ),
      RuleSubtitle("Surcontré"),
      RuleParagraph(
        "Le surcontré intervient uniquement après un Contré."
        "Un des joueurs de l'équipe qui a appelé peut répondre : \"Surcontré\" \n"
        "La manche se joue avec le multiplicateur du surcontré.",
      ),
      RuleParagraph(
        "Exemple : \n"
        'Joueur A appelle ToutA. Joueur D annonce Contré. Joueur C (partenaire du joueur A) surcontre \n'
        'La manche se joue en ToutA surcontré.',
      ),
      RuleSubtitle("Validation normale"),
      RuleParagraph(
        "Si aucune des situations mentionées précédemment ne se produit (pas de trèfle bonne, pas de SansA bonne, pas de ToutA, pas de Contré),",
      ),
      RuleExample(
        'Le jeu est validé lorsque tous les joueurs ont accepté le type de jeu appelé en disant "Bonne".',
      ),
      RuleParagraph(
        "Une fois le type de jeu à jouer validé. On reprend la distribution des cartes restantes",
      ),
    ],
  ),
  const RuleSection(
    number: '9.',
    title: 'Distribution des cartes restantes',
    blocks: [
      RuleParagraph(
        "Après l'appel, le même distributeur continue : chaque joueur reçoit "
        "les 3 cartes restantes, toujours dans le sens des aiguilles d'une "
        'montre, par paquets de 3.\n'
        'Chaque joueur possède alors ses 8 cartes en main. \n Le jeu peut '
        'commencer.',
      ),
    ],
  ),
  const RuleSection(
    number: '10.',
    title: "Déroulement d'un pli",
    blocks: [
      RuleParagraph(
        'Une manche est composée de plusieurs plis. À 4 joueurs, chaque '
        'joueur possède 8 cartes, donc la manche compte 8 plis. Le '
        'premier joueur qui joue une carte est appelé "le joueur qui '
        'entame" — lors du premier pli, c\'est celui situé à gauche du '
        'distributeur ; ensuite, c\'est celui qui a remporté le pli '
        'précédent.',
      ),
      RuleSubtitle('Règle principale : fournir la couleur demandée'),
      RuleExample(
        'Le premier joueur pose ♥ Roi. Les autres doivent jouer un cœur '
        "s'ils en possèdent — ils ne peuvent pas jouer une autre couleur.",
      ),
      RuleSubtitle('Obligation de monter au jeu de ToutA'),
      RuleExample(
        'Joueur A joue 10 de pique. Le joueur B a 9 et 7 de pique — il '
        'doit obligatoirement jouer le 9, seule carte supérieure au 10.',
      ),
      RuleSubtitle("Si un joueur n'a pas la couleur demandée"),
      RuleParagraph(
        'Cas 1 — ToutA ou SansA : le joueur peut jouer une carte de son '
        'choix dans une autre couleur. Le pli est remporté par la carte '
        'la plus haute dans la couleur demandée.\n\n'
        'Cas 2 — Jeu de Couleur (une couleur est atout) : la couleur '
        "choisie devient l'{{atout}} et surpasse toutes les autres. Jouer "
        'un atout pour prendre le pli s\'appelle "couper".',
      ),
      RuleSubtitle('Obligation de couper'),
      RuleExample(
        'Jeu en Pique, couleur demandée : cœur. Un joueur sans cœur '
        'possède Pique 9 et Carreau As — il doit obligatoirement jouer '
        'Pique 9.',
      ),
      RuleSubtitle("Obligation de monter à l'atout"),
      RuleParagraph(
        "Si un joueur doit couper et qu'un atout plus fort a déjà été "
        "posé, il doit jouer un atout supérieur s'il en a un.",
      ),
      RuleExample(
        'Contrat en Pique. Joueur A joue Cœur As, Joueur B joue Pique 8. '
        'Le joueur C, sans cœur, a Pique 9 et Pique 7 — il doit jouer '
        "Pique 9 pour dépasser l'atout déjà posé.",
      ),
      RuleSubtitle('Remporter un pli'),
      RuleParagraph(
        'La carte la plus forte de la couleur demandée remporte le pli — '
        "sauf en jeu de Couleur, où l'atout le plus fort remporte le pli. "
        'Le gagnant du pli récupère les cartes et commence le pli '
        'suivant.',
      ),
    ],
  ),
  const RuleSection(
    number: '11.',
    title: 'Fin de manche et comptage des plis',
    initiallyOpen: true,
    blocks: [
      RuleParagraph(
        'Une fois toutes les cartes jouées, on compte les plis obtenus.\n\n'
        "Capot : si une équipe ne remporte aucun pli, l'équipe adverse "
        'réalise un capot et obtient le score correspondant.\n\n'
        'Si les deux équipes ont remporté au moins un pli, on compte les '
        'points des cartes remportées par chacune. Le dernier pli de la '
        'manche (la "derna") rapporte un bonus de 10 points.\n\n'
        'Litige : si les deux équipes obtiennent le même total, aucun '
        "score de manche n'est attribué.\n\n"
        "Score normal : l'équipe ayant obtenu le plus grand total "
        'remporte le score de la manche.',
      ),
      RuleSubtitle('Split (ToutA mizara)'),
      RuleParagraph(
        'Règle optionnelle : elle consiste à partager les 26 points du '
        'ToutA normal entre les deux équipes, selon les dizaines '
        "obtenues par chacune, si l'équipe adverse dépasse 8 dizaines "
        '(valeur ajustable selon les préférences des joueurs).',
      ),
      RuleExample(
        'Total équipe A = 100 pts (10 dizaines), équipe B = 158 pts. '
        'Score pour A : +10 pts. Score pour B : +16 pts (26 − 10).',
      ),
      RuleParagraph(
        'Répartitions les plus courantes : 8–18, 10–16, 12–14. Certains '
        'joueurs utilisent une variante plus souple à partir de 6–20.',
      ),
    ],
  ),
  const RuleSection(
    number: '12.',
    title: 'Manche suivante et fin de partie',
    blocks: [
      RuleParagraph(
        'À la fin de chaque manche, le rôle de distributeur passe au '
        "joueur suivant, dans le sens des aiguilles d'une montre.\n\n"
        "La partie prend fin dès qu'une équipe atteint l'objectif, sans "
        "qu'une égalité ne prolonge la partie.",
      ),
    ],
  ),
];

/// Les tableaux de référence (section 13), affichés après l'accordéon,
/// hors structure repliable.
final List<RuleTableBlock> ruleReferenceTables = [
  const RuleTableBlock(
    heading: 'Ordre des cartes par jeu',
    rows: [
      RuleRow('SansA', 'As > 10 > R > D > V > 9 > 8 > 7'),
      RuleRow('Couleur — atout', 'V>9>As>10>R>D>8>7'),
      RuleRow('Couleur — autres', 'As>10>R>D>V>9>8>7'),
      RuleRow('ToutA', 'V>9>As>10>R>D>8>7'),
    ],
  ),
  const RuleTableBlock(
    heading: 'Valeur des cartes — SansA',
    rows: [
      RuleRow('As', '11'),
      RuleRow('10', '10'),
      RuleRow('Roi', '4'),
      RuleRow('Dame', '3'),
      RuleRow('Valet', '2'),
      RuleRow('9 / 8 / 7', '0'),
    ],
  ),
  const RuleTableBlock(
    heading: 'Valeur des cartes — ToutA / Atout',
    rows: [
      RuleRow('Valet', '20'),
      RuleRow('9', '14'),
      RuleRow('As', '11'),
      RuleRow('10', '10'),
      RuleRow('Roi', '4'),
      RuleRow('Dame', '3'),
      RuleRow('8 / 7', '0'),
    ],
  ),
  const RuleTableBlock(
    heading: 'Litige parfait selon le jeu',
    rows: [
      RuleRow('Couleur', '81'),
      RuleRow('SansA', '65'),
      RuleRow('ToutA', '129'),
    ],
  ),
  const RuleTableBlock(
    heading: 'Score normal selon le jeu',
    rows: [
      RuleRow('Trèfle', '32 pts'),
      RuleRow('Carreau / Cœur / Pique', '16 pts'),
      RuleRow('SansA', '52 pts'),
      RuleRow('ToutA', '26 pts'),
    ],
  ),
  const RuleTableBlock(
    heading: 'Score capot selon le jeu',
    rows: [
      RuleRow('Couleur', 'Victoire directe'),
      RuleRow('SansA', '70 pts'),
      RuleRow('SansA — Capot Dedans', '90 pts'),
      RuleRow('ToutA', '35 pts'),
      RuleRow('ToutA — Capot Dedans', 'Victoire ou 35 pts*'),
    ],
  ),
  const RuleTableBlock(
    heading: 'Multiplicateurs',
    rows: [RuleRow('Contré', '×2'), RuleRow('Surcontré', '×4')],
  ),
];
