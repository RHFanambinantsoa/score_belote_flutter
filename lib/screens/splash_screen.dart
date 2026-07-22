import 'package:flutter/material.dart';
import 'package:score_belote/widgets/splash_background.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  // C'est le constructeur de notre widget.

  @override
  State<SplashScreen> createState() => _SplashScreenState();
  // Cette ligne dit : "Mon état sera géré par la classe _SplashScreenState."
  // En Dart, un nom qui commence par _ signifie : privé à ce fichier.
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // Le mixin fournit une horloge à Flutter.
  // Il dit :
  // "Je peux fournir un ticker pour une animation."
  // Pourquoi "Single" ?
  // Parce qu'ici on a une seule animation :
  // apparition du logo
  // Si on avait 10 animations complexes, on utiliserait autre chose.

  late AnimationController _controller;
  // On crée une variable qui va contrôler notre animation.
  // late veut dire : "Je vais l'initialiser plus tard, mais je promets qu'elle sera initialisée avant de l'utiliser."
  late Animation<double> _fadeAnimation;
  //animation<double> est un type générique qui va produire des valeurs de type double.
  //c'est a dire des nombres à virgule flottante.
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    // initState est une méthode spéciale qui est appelée quand le widget est inséré dans l'arbre des widgets.

    super.initState();
    // On appelle d'abord la méthode initState de la classe parente (State).
    // on dit : "Hé, fais ce que tu as à faire, puis je vais faire le reste."

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
      // vsync est l'horloge qui va synchroniser l'animation avec le rafraîchissement de l'écran.
      //c'est à dire : "Ne pas gaspiller de ressources quand l'écran n'est pas visible."
    );

    _fadeAnimation = Tween<double>(
      // Tween est un objet qui va "interpoler" entre deux valeurs.
      //on crée une transition entre deux nombres.
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
    // animate() dit : "Utilise cet AnimationController pour produire les valeurs de l'animation."

    _scaleAnimation =
        Tween<double>(
          begin: 2.5, // On commence à 250% de la taille originale
          end: 1.0, // On finit à 100% de la taille originale
        ).animate(
          CurvedAnimation(
            // CurvedAnimation est un objet qui va appliquer une courbe à l'animation.
            parent: _controller,
            curve: Curves.easeOutBack,
            // Curves.easeOutBack est une courbe qui commence vite, puis ralentit et fait un petit "rebond" à la fin.
          ),
        );

    _controller.forward();
    // forward() lance l'animation de 0 à 1.

    Future.delayed(
      // Future.delayed est une fonction qui exécute du code après un certain délai. comme setTimeout en JavaScript.
      const Duration(seconds: 4),
      () {
        if (!mounted) return;
        Navigator.pushReplacement(
          //Le Navigator ne reçoit pas directement un écran. Il reçoit une fonction capable de créer l'écran.
          //pushReplacement remplace l'écran actuel par un nouvel écran.
          //si on fait retour arrière, on ne revient pas à l'écran de splash.
          //contrairement à push() qui empile les écrans les uns sur les autres.
          context,
          // context est un objet qui contient des informations sur l'endroit où le widget est dans l'arbre des widgets.
          MaterialPageRoute(
            // MaterialPageRoute est un objet qui décrit une transition entre deux écrans.
            //quel ecran afficher, comment l'afficher, etc.
            builder: (context) => const WelcomeScreen(),
            //Le => signifie : "Quand Flutter aura besoin de construire cet écran, exécute cette fonction et retourne WelcomeScreen."
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // dispose est une méthode spéciale qui est appelée quand le widget est retiré de l'arbre des widgets.
    // C'est le moment de nettoyer les ressources utilisées par le widget. (quand on quitte l'écran par exemple)
    _controller.dispose();
    // On appelle dispose() sur notre AnimationController pour libérer les ressources qu'il utilise.
    super.dispose();
    // On appelle ensuite la méthode dispose de la classe parente (State).
  }

  // @override
  // Widget build(BuildContext context) {
  //   // build est une méthode spéciale qui est appelée à chaque fois que le widget doit être redessiné.
  //   //appelle cette methode pour savoir comment il doit s'afficher à l'écran.
  //   return Scaffold(
  //     // Scaffold est un widget qui fournit une structure de base pour l'application (barre d'applications, corps, etc.)
  //     body: Container(
  //       // Container est un widget qui permet de créer une boîte avec des dimensions, des marges, des couleurs, etc.
  //       decoration: const BoxDecoration(
  //         // BoxDecoration est un objet qui permet de décorer un Container avec des couleurs, des images, des bordures, etc.
  //         gradient: LinearGradient(
  //           // LinearGradient est un objet qui permet de créer un dégradé de couleurs.
  //           colors: [
  //             Color.fromARGB(255, 202, 49, 22),
  //             Color.fromARGB(255, 231, 226, 228),
  //             Color.fromARGB(255, 15, 4, 2),
  //           ],
  //           begin: Alignment.topLeft,
  //           end: Alignment.bottomRight,
  //         ),
  //       ),

  //       child: Center(
  //         child: FadeTransition(
  //           opacity: _fadeAnimation,

  //           child: ScaleTransition(
  //             scale: _scaleAnimation,

  //             child: Image.asset("assets/images/logo.png", width: 150),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashBackground(
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,

            child: ScaleTransition(
              scale: _scaleAnimation,

              child: Image.asset("assets/images/logo.png", width: 150),
            ),
          ),
        ),
      ),
    );
  }
}
