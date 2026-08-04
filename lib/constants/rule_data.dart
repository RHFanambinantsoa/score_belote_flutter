import '../models/rule_content.dart';

/// Tout le texte de l'écran "Règles du jeu", séparé de l'affichage.
/// référencer un terme du glossaire avec `{{terme}}` (le texte entre
/// accolades doit correspondre exactement à une clé de [ruleGlossary]).

/// Termes techniques cliquables, affichés en bottom sheet.
final Map<String, RuleGlossaryTerm> ruleGlossary = {
  'cartes françaises': const RuleGlossaryTerm(
    title: 'Cartes françaises',
    icon: '🂡',
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
        'Règle de coupe du paquet : la partie séparée doit contenir au minimum 6 '
        "cartes. Une coupe de moins de 6 cartes n'est pas autorisée.",
      ),
    ],
  ),
  'atout': const RuleGlossaryTerm(
    title: "Qu'est-ce qu'un atout ?",
    body: [
      RuleParagraph(
        'Un atout désigne une couleur spéciale, désignée en début de manche, '
        "qui devient plus forte que toutes les autres pendant une manche. \n"
        "Lorsqu'une couleur est l'atout, toute carte de cette couleur peut "
        "battre une carte d'une autre couleur, même si sa valeur est normalement inférieure. ",
      ),
      RuleParagraph(
        "Exemple : \n"
        "Jeu : Cœur ♥ (atout).\n "
        "Le joueur A joue : As♠\n"
        "Le joueur B ne possède pas de Pique ♠ et joue : 7♥\n"
        "Même si c'est une petite carte, le 7♥ remporte le pli car le "
        "cœur ♥ est l'atout.",
      ),
    ],
  ),
  'Couper un pli': const RuleGlossaryTerm(
    title: 'Que signifie "Couper" lors d\'un jeu de couleur?',
    body: [
      RuleParagraph(
        "Couper consiste à jouer un atout afin de remporter le pli.\n"
        "Lorsqu'un joueur ne possède pas la couleur demandée mais possède au moins un atout, "
        "il est obligatoire de couper.",
      ),
      RuleParagraph(
        "Exemple : \n"
        "Jeu : Pique ♠ (atout)\n"
        "Couleur demandée : Cœur ♥\n"
        "Le joueur ne possède aucun Cœur. Il possède : \n"
        "9♠\n"
        "As♦\n"
        "Il doit obligatoirement jouer le 9♠.(puisque Pique ♠ est l'atout)\n",
      ),
    ],
  ),
  'bonne': const RuleGlossaryTerm(
    title: "Que signifie le terme \"Bonne\" ?",
    body: [
      RuleParagraph(
        "Quand un joueur dit \"bonne\" cela signifie qu'il accepte le type de jeu annoncé "
        "et ne souhaite pas proposer un autre type de jeu supérieur à celui annoncé.",
      ),
    ],
  ),
};

/// Les sections de l'écran, dans l'ordre d'affichage.
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
        'début de la partie:\n'
        '1. Les cartes sont mélangées une seule fois.\n'
        '2. Une première manche est jouée obligatoirement en ToutA.\n'
        '3. Cette manche sert uniquement de préparation.\n'
        '4. Ses points ne sont pas comptabilisés.\n'
        "5. Ensuite, les cartes ne sont plus mélangées jusqu'à la fin de "
        'la partie.\n'
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
    title: "Appel et choix du jeu",
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
        'montre, par paquets de 3.',
      ),
      RuleNote(
        'Chaque joueur possède alors ses 8 cartes en main. '
        'Le jeu est joué avec le type de jeu validé pendant l\'appel.',
      ),
    ],
  ),
  const RuleSection(
    number: '10.',
    title: "Déroulement d'un pli",
    blocks: [
      RuleSubtitle("Les plis"),
      RuleParagraph("Une manche de Belote est composée de plusieurs plis."),
      RuleExample(
        "Un pli correspond à un tour pendant lequel chaque joueur pose une carte (4 cartes en tout).",
      ),
      RuleParagraph(
        'À 4 joueurs, chaque joueur possède 8 cartes, donc la manche compte 8 plis.',
      ),
      RuleNote(
        'Le but de chaque équipe pendant une manche est de remporter un maximum de plis '
        'afin de totaliser plus de points que l\'équipe adverse grâce aux cartes remportées. ',
      ),
      RuleSubtitle("Début d'un pli"),
      RuleParagraph(
        "Le premier joueur qui joue une carte est appelé le joueur qui entame. (izy no main)",
      ),
      RuleParagraph(
        'Premier pli : C\'est le joueur situé à gauche du distributeur qui commence le premier pli \n'
        'Pli suivant : C\'est au tour du joueur qui a remporté le pli précédent.\n'
        'Et ainsi de suite.',
      ),
      RuleSubtitle("Déroulement d'un tour"),
      RuleParagraph(
        "Le joueur qui entame le pli choisit librement la première carte",
      ),
      RuleParagraph(
        "Les autres joueurs jouent ensuite, l'un après l'autre, dans le sens des aiguilles d'une montre, "
        "tout en respectant les règles de pose des cartes.",
      ),
      RuleSubtitle('Règles principale'),
      RuleWarning("1. Les joueurs doivent fournir la couleur demandée"),
      RuleParagraph(
        "Lorsqu'le joueur qui entame pose une carte, il impose une couleur à suivre.",
      ),
      RuleParagraph(
        "Exemple : \n"
        "Le premier joueur pose :  Roi♥ (Cœur) \n"
        "Les autres joueurs doivent jouer une carte de la même couleur (cœur) s'ils en possèdent."
        "Ils ne peuvent pas jouer une autre couleur.",
      ),
      RuleWarning('2. Obligation de monter au ToutA'),
      RuleParagraph(
        "Lorsque le jeu est ToutA, il est obligatoire de monter si l'on possède une carte "
        "de la couleur demandée supérieure à celle qui est actuellement la plus forte du pli.",
      ),
      RuleParagraph(
        "Exemple : \n"
        "Le joueur A joue le 10♠.\n"
        "Le joueur B possède le 9♠ et le 7♠.\n"
        "Le 9♠ étant une carte supérieure au 10♠ au ToutA, le joueur B est obligé de jouer le 9♠. "
        "Il ne peut pas choisir de jouer le 7♠.",
      ),
      RuleSubtitle("Si un joueur ne possède pas la couleur demandée"),
      RuleParagraph(
        "Lorsqu'un joueur ne possède aucune carte dans la couleur demandée, les règles à appliquer dépendent du type de jeu.",
      ),
      RuleWarning(
        '3. Jeu de ToutA ou SansA : \n Si un joueur ne possède pas la couleur demandée, '
        'il peut jouer n\'importe quelle carte d\'une autre couleur. ',
      ),
      RuleSubtitle("Jeu de couleur (avec atout)"),
      RuleParagraph(
        "Dans un jeu de Couleur, une couleur est désignée comme {{atout}}. "
        "Cette couleur est supérieure à toutes les autres pendant toute la manche.",
      ),
      RuleParagraph("{{Couper un pli}}"),
      RuleWarning(
        "4. Jeu de Couleur : \n"
        "un joueur qui ne possède pas la couleur demandée doit obligatoirement couper avec un atout s'il en possède ;\n"
        "s'il ne possède ni la couleur demandée ni d'atout, il peut jouer n'importe quelle autre carte.",
      ),
      RuleSubtitle("Obligation de monter à l'atout"),
      RuleWarning(
        "5. Jeu de Couleur : \n"
        "Si un joueur doit couper et qu'un atout plus fort a déjà été "
        "posé, il doit jouer un atout supérieur s'il en a un.",
      ),
      RuleParagraph(
        "Exempe : \n"
        "Jeu : Pique ♠.\n"
        "Joueur A joue : As♥ (couleur demandée Cœur ♥)\n"
        "Joueur B joue : 8♠\n"
        "Joueur C, n'a pas de cœur ♥ en main.\n"
        "Il a 9♠ et 7♠ \n"
        "— Il doit obligatoirement jouer 9♠ pour dépasser l'atout déjà posé.",
      ),
      RuleSubtitle('Remporter un pli'),
      RuleParagraph(
        "Une fois que les quatre joueurs ont posé une carte, le pli est attribué selon les règles suivantes :",
      ),
      RuleNote(
        '1. En ToutA et en SansA : le pli est remporté par le joueur ayant joué la carte la plus forte dans la couleur demandée.'
        '2. En jeu de Couleur : si un ou plusieurs atouts ont été joués, le pli est remporté par le joueur ayant joué l\'atout le plus fort. '
        'Dans le cas contraire, c\'est la carte la plus forte de la couleur demandée qui remporte le pli.',
      ),
      RuleParagraph(
        "Le joueur qui remporte le pli : récupère toutes les cartes du pli et commence le pli suivant.",
      ),
    ],
  ),
  const RuleSection(
    number: '11.',
    title: 'Fin de manche et comptage des plis',
    blocks: [
      RuleParagraph(
        "Lorsque tous les joueurs ont joué leurs huit cartes, la manche est terminée. "
        "On procédé alors au comptage des plis remportés par chaque équipe.",
      ),
      RuleSubtitle("Capot"),
      RuleWarning(
        "Une équipe réalise un capot lorsqu'elle remporte tous les plis de la manche.",
      ),
      RuleParagraph(
        "Dans ce cas, elle obtient le score de capot correspondant au type de jeu joué.",
      ),
      RuleSubtitle("Comptage des points des cartes"),
      RuleParagraph(
        "Si les deux équipes ont remporté au moins un pli, "
        "on additionne la valeur des cartes remportées par chacune des équipes.",
      ),
      RuleSubtitle("Derna"),
      RuleWarning(
        "Le dernier pli de la manche, appelé communément \"derna\", "
        "rapporte un bonus de 10 points à l'équipe qui le remporte.",
      ),
      RuleSubtitle("Litige"),
      RuleParagraph(
        "Il y a litige lorsque, après le comptage des cartes (bonus de la derna inclus), "
        "les deux équipes obtiennent exactement le même total de points.",
      ),
      RuleParagraph(
        "Exemple : \n"
        "Jeu : SansA \n"
        "Équipe A : 65 pts. \n"
        "Équipe B : 65 pts.",
      ),
      RuleWarning(
        "En cas de litige, aucun score de manche n'est attribué à aucune des deux équipes.",
      ),
      RuleSubtitle("Équipe gagnante"),
      RuleWarning(
        "Si les deux équipes n'ont pas le même total, l'équipe ayant obtenu le plus de points "
        "grâce à ses plis remporte la manche et marque le score correspondant au type de jeu.",
      ),
      RuleSubtitle("Split (ToutA Mizara)"),
      RuleParagraph(
        "Le Split est une règle optionnelle, très répandue dans certaines parties de Belote Gasy.",
      ),
      RuleParagraph(
        "Au lieu d'attribuer les 26 points du ToutA normal à une seule équipe, ces points sont répartis "
        "entre les deux équipes en fonction du nombre de dizaines obtenues lors du comptage des plis.",
      ),
      RuleSubtitle("Quand appliquer le Split?"),
      RuleParagraph(
        "Le Split s'applique uniquement lorsque :\n"
        "1. la manche est jouée en ToutA normal (sans contre)\n"
        "2. la règle du Split a été convenue avant le début de la partie\n"
        "3. l'équipe qui a appelé ToutA remporte la manche (obtenir plus de points que l'équipe adverse)\n"
        "4. l'équipe adverse atteint le seuil de dizaines défini pour déclencher le partage",
      ),
      RuleNote(
        "Ce seuil est généralement fixé à 8 dizaines, mais il peut être modifié selon les habitudes des joueurs.",
      ),
      RuleParagraph(
        "Exemple :\n"
        "Equipe qui a appelé : Equipe B\n"
        "Total des points après le comptage : \n"
        "Equipe A : 100pts. → 10 dizaines\n"
        "Equipe B : 158pts.\n"
        "On aura : \n"
        "Equipe A +10pts.\n"
        "Equipe B +16pts.",
      ),
      RuleWarning("Les deux scores additionnés donnent toujours 26 points."),
      RuleParagraph(
        "Les répartitions les plus utilisées sont :\n"
        "8 – 18, 10 – 16, 12 – 14",
      ),
      RuleParagraph(
        "Certaines joueurs utilisent une variante plus souple qui autorise le partage, "
        "à partir de 6 dizaines, permettant ainsi d'obtenir des répartitions comme :\n"
        "6 – 20, 7 – 19, 8 – 18, 9 – 17, 10 – 16, 11 – 15, 12 – 14",
      ),
      RuleParagraph(
        "** Allez dans paramètres pour autoriser ou non le Split et "
        "selectionner les répartitions utilisées lors de vos parties **",
      ),
    ],
  ),
  const RuleSection(
    number: '12.',
    title: 'Attribution des points de manche',
    blocks: [
      RuleParagraph(
        "Le résultat de la manche (score normal, capot ou Split) détermine un score de base.",
      ),
      RuleSubtitle("Calcul du score de manche final"),
      RuleParagraph(
        "Le score de base est ensuite :\n"
        " - conservé tel quel si le contrat n'a été ni contré ni surcontré ; \n"
        " - multiplié par 2 si le contrat a été contré ; \n"
        " - multiplié par 4 si le contrat a été surcontré. ",
      ),
      RuleParagraph(
        "Exemples :\n"
        "Score normal : 16 pts.\n"
        "Contré : 32 pts.\n"
        "Surcontré : 64 pts.\n"
        "Capot à 35 pts.\n"
        "Contré : 70 pts.\n"
        "Surcontré : 140 pts.",
      ),
      RuleNote(
        "Le score ainsi obtenu est ajouté au score total de l'équipe ou des équipes concernées "
        "avant le début de la manche suivante.",
      ),
    ],
  ),
  const RuleSection(
    number: '13.',
    title: 'Nouvelle manche',
    blocks: [
      RuleNote(
        "À la fin de chaque manche, le rôle de distributeur passe au joueur suivant, dans le sens des aiguilles d'une montre.",
      ),
      RuleParagraph(
        " Une nouvelle manche commence alors avec :\n"
        " - la distribution des cartes ;\n"
        " - l'appel du jeu ; ;\n"
        " - le déroulement des plis ;\n"
        " - le comptage des points à partir des plis obtenus.",
      ),
      RuleParagraph(
        "Les manches s'enchaînent jusqu'à ce qu'une équipe atteigne l'objectif de score fixé.",
      ),
    ],
  ),
  const RuleSection(
    number: '14.',
    title: 'Fin de partie',
    blocks: [
      RuleNote(
        "La partie prend fin dès qu'une équipe atteint l'objectif, sans "
        "qu'une égalité ne prolonge la partie.",
      ),
    ],
  ),
];

const quickAccessCategories = [
  RuleTableReferenceCategory(
    label: "Cartes",
    icon: "🎴",
    blocks: [
      RuleSubtitle("Ordre des cartes"),
      RuleNote(
        "L'ordre des cartes est important pour déterminer quelle carte remporte un pli.",
      ),
      RuleParagraph(
        "L'ordre des cartes en belote varie selon le type de jeu joué dans chaque manche",
      ),
      RuleSubtitle("SansA"),
      RuleNote("As > 10 > Roi > Dame > Valet > 9 > 8 > 7 "),
      RuleSubtitle("ToutA"),
      RuleNote("Valet > 9 > As > 10 > Roi > Dame > 8 > 7 "),
      RuleSubtitle("Couleur"),
      RuleParagraph(
        "L'ordre des cartes est le même que celui du ToutA pour la couleur d'atout, "
        "et le même que celui du SansA pour les autres couleurs.",
      ),
      RuleParagraph(
        "Exemple : \n"
        "Jeu : Cœur ♥ (atout)\n"
        "Ordre des cartes de Cœur ♥ :\n"
        "Valet♥ >9♥ > As♥ > 10♥ > Roi♥ > Dame♥ > 8♥ > 7 > "
        "Ordre des cartes de Trèfle ♣, Carreau ♦ et Pique ♠ : \n"
        "As > 10 > Roi > Dame > Valet > 9 > 8 > 7  ",
      ),
    ],
  ),

  RuleTableReferenceCategory(
    label: "Comptage des plis",
    icon: "🧮",
    blocks: [
      RuleSubtitle("Comptage des plis"),
      RuleNote(
        "Le comptage des plis est important pour déterminer quelle équipe obtient le score de la manche.",
      ),
      RuleParagraph(
        "Lors du comptage des plis, chaque carte a une valeur bien définie en fonction du type de jeu joué dans la manche.",
      ),
      RuleSubtitle("Valeur des cartes"),
      RuleTableBlock(
        heading: 'SansA | Non Atout (en couleur)',
        rows: [
          RuleRow('As', '11'),
          RuleRow('10', '10'),
          RuleRow('Roi', '4'),
          RuleRow('Dame', '3'),
          RuleRow('Valet', '2'),
          RuleRow('9 / 8 / 7', '0'),
        ],
      ),
      RuleTableBlock(
        heading: 'ToutA | Atout (en couleur)',
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
      RuleSubtitle("Capot"),
      RuleNote(
        "Une équipe réalise un capot lorsqu'elle remporte tous les plis de la manche.",
      ),
      RuleSubtitle("Dedans"),
      RuleNote(
        "Une équipe est considérée comme \"dedans\" lorsque c'est elle qui a fait l'appel "
        "mais qu'après le comptage des plis le total de ses points est inférieur à celui de l'équipe adverse.",
      ),
      RuleSubtitle("Litige"),
      RuleParagraph(
        'Il y a litige lorsque les deux équipes obtiennent exactement '
        'le même total de points après le comptage des plis.',
      ),
      RuleTableBlock(
        heading: 'Litige parfait selon le jeu',
        rows: [
          RuleRow('Couleur', '81'),
          RuleRow('SansA', '65'),
          RuleRow('ToutA', '129'),
        ],
      ),
      RuleWarning(
        "Pour le jeu de toutA, un total compris entre 124 et 134 est considéré comme un litige. "
        "Mais encore une fois, celà dépend des habitudes des joueurs.\n"
        "Il est donc préférable de se mettre d'accord avant la partie sur la valeur exacte du litige pour le jeu de ToutA.",
      ),
    ],
  ),

  RuleTableReferenceCategory(
    label: "Score",
    icon: "🏆",
    blocks: [
      RuleSubtitle("Scores"),
      RuleParagraph(
        "Le score d'une manche est calculé en fonction du type de jeu joué "
        "et de quelques autres facteurs tels que le Capot, le Contré et le Surcontré.",
      ),
      RuleTableBlock(
        heading: 'Score normal',
        rows: [
          RuleRow('Trèfle', '32 pts'),
          RuleRow('Carreau / Cœur / Pique ♠', '16 pts'),
          RuleRow('SansA', '52 pts'),
          RuleRow('ToutA', '26 pts'),
        ],
      ),
      RuleTableBlock(
        heading: 'Score capot',
        rows: [
          RuleRow('Couleur', 'Victoire'),
          RuleRow('SansA', '70 pts'),
          RuleRow('SansA — Dedans', '90 pts'),
          RuleRow('ToutA', '35 pts'),
          RuleRow('ToutA — Dedans', 'Victoire ou 35 pts*'),
        ],
        footnote:
            '* Réglable dans les paramètres selon la préférence des joueurs.',
      ),
      RuleWarning(
        "Quand une équipe réalise un Capot Dedans toutA, "
        "il peut y avoir une victoire directe, selon les habitudes des joueurs et les accords avant la partie.",
      ),
      RuleTableBlock(
        heading: 'Multiplicateurs',
        rows: [RuleRow('Contré', '×2'), RuleRow('Surcontré', '×4')],
      ),
    ],
  ),
];
