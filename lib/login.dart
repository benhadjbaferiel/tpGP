import 'package:flutter/material.dart';
import 'package:library_app/home.dart';
import 'package:library_app/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Dégradé en arrière-plan
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 99, 80, 64),
                  Color.fromARGB(255, 196, 180, 167)
                ],
                begin: Alignment.topCenter,
                end: Alignment.center,
              ),
            ),
          ),

          // Formulaire de connexion
          Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: 550,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Titre
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(text: "My "),
                            TextSpan(
                              text: "Biblio",
                              style: TextStyle(color: Color.fromARGB(255, 116, 92, 73)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Bienvenue !",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 60),

                      // Champ Email
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: "Enter your email",
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "L'e-mail est requis";
                          }
                          if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                              .hasMatch(value)) {
                            return "Entrez un e-mail valide";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 30),

                      // Champ Mot de passe
                      TextFormField(
                        controller: passwordController,
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          labelText: "Enter your password",
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Le mot de passe est requis";
                          }
                          if (value.length < 6) {
                            return "Le mot de passe doit contenir au moins 6 caractères";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 30),

                      // Lien vers l'inscription
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Nouvel utilisateur ? "),
                          TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SignupPage()),
                            ),
                            child: const Text(
                              "Inscrivez-vous ici",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      // Bouton de connexion
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Connexion réussie"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>  LibraryHomePage(),
                                  ),
                                );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF49382A),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "Se connecter",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
