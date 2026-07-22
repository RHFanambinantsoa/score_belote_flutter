import 'package:flutter/material.dart';

/// Reproduit le fond de l'écran splash : dégradé radial "coucher de
/// soleil" (crème → or → bordeaux), symboles de cartes dispersés en
/// filigrane, et une lueur claire derrière le logo pour qu'il ressorte
/// bien malgré ses propres tons bordeaux/brun.
///
/// Utilisation : place ce widget en fond (dans un Stack) et pose le
/// logo par-dessus, centré.
class SplashBackground extends StatelessWidget {
  final Widget child;
  const SplashBackground({super.key, required this.child});

  static const _symbols = <_SuitMark>[
    _SuitMark('♠', top: 0.06, left: 0.10, angle: -0.21, size: 54),
    _SuitMark('♦', top: 0.14, left: 0.68, angle: 0.17, size: 38),
    _SuitMark('♣', top: 0.38, left: 0.82, angle: -0.14, size: 54),
    _SuitMark('♥', top: 0.60, left: 0.04, angle: 0.24, size: 44),
    _SuitMark('♠', top: 0.78, left: 0.70, angle: -0.28, size: 54),
    _SuitMark('♦', top: 0.82, left: 0.30, angle: 0.10, size: 34),
    _SuitMark('♣', top: 0.04, left: 0.38, angle: 0.35, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, -0.24), // ~38% depuis le haut
          radius: 1.1,
          colors: [
            Color(0xFFFBF5E7),
            Color(0xFFF6E4B8),
            Color(0xFFE3A93E),
            Color(0xFF7C2A45),
            Color(0xFF3E1120),
          ],
          stops: [0.0, 0.32, 0.62, 0.88, 1.0],
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        //fit: StackFit.expand : le Stack prend tout l'écran width 100%, height 100%
        children: [
          // Symboles de cartes en filigrane
          LayoutBuilder(
            // Il dit : "Avant de construire les widgets, donne-moi la taille disponible."
            // Flutter fournit : constraints.maxWidth,constraints.maxHeight
            builder: (context, constraints) {
              return Stack(
                children: _symbols.map((s) {
                  return Positioned(
                    top: constraints.maxHeight * s.top,
                    //si hauteur = 800 et top = 0.25 ça donne 200 px
                    // Donc les cartes restent proportionnelles
                    // quelque soit le téléphone.
                    left: constraints.maxWidth * s.left,
                    child: Transform.rotate(
                      angle: s.angle,
                      child: Text(
                        s.symbol,
                        style: TextStyle(
                          fontSize: s.size,
                          color: const Color(0x1A3B2313),
                        ),
                      ),
                    ),
                  );
                }).toList(),
                //.toList() donne List<Widget>
              );
            },
          ),
          // Lueur claire derrière le logo
          Center(
            child: Container(
              width: 280,
              height: 280,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Color(0xBFFFFBF0), Color(0x00FFFBF0)],
                  stops: [0.0, 0.68],
                ),
              ),
            ),
          ),
          Center(child: child),
        ],
      ),
    );
  }
}

class _SuitMark {
  final String symbol;
  final double top; // fraction 0..1 de la hauteur
  final double left; // fraction 0..1 de la largeur
  final double angle; // radians
  final double size;
  const _SuitMark(
    this.symbol, {
    required this.top,
    required this.left,
    required this.angle,
    required this.size,
  });
}
