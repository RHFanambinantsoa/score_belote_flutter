import 'package:flutter/material.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  // const Color primaryColor = Color(0xFF5C1020);
  // const Color goldColor = Color(0xFFFFD54F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 155, 201, 240),
              Color.fromARGB(255, 6, 25, 41),
            ],

            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),

            //edgeInsets.all permet de mettre un padding de 24 pixels sur tous les côtés du widget enfant
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              //mainAxisAlignment.center permet de centrer les widgets enfants sur l'axe principal (vertical dans ce cas)
              children: [
                Image.asset("assets/images/logo.png", width: 120),

                const SizedBox(height: 30),

                const Text(
                  "Bienvenue 👋",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  "Cette application est née d'une idée simple : "
                  "arrêter les débats interminables autour du score pendant les parties de belote. "
                  "Conçue pour rendre vos parties plus simples et agréables, "
                  "elle vous permet de suivre le score sans avoir à vous soucier des calculs complexes.",

                  textAlign: TextAlign.center,

                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Les règles utilisées ici sont celles de la belote "Gasy", '
                  "qui peuvent différer de la belote classique.",

                  textAlign: TextAlign.center,

                  style: TextStyle(color: Color(0xFFFFD54F), fontSize: 16),
                ),
                const SizedBox(height: 40),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Commencer",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 6, 25, 41),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
