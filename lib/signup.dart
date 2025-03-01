import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController name = TextEditingController();
  TextEditingController motdepass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(197, 225, 165, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Center(
              child: Container(
                height: 550,
                width: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Center(child: Image.asset("image/1.png")),
                    Text("Bienvenue !", style: TextStyle(fontSize: 20)),
                    SizedBox(height: 20),
                    Container(
                      height: 40,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1),
                      ),
                      child: TextField(
                        controller: name,
                        decoration: InputDecoration(
                          hintText: "  entrer votre e-mail",
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 40,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1),
                      ),
                      child: TextField(
                        controller: motdepass,
                        decoration: InputDecoration(
                          hintText: "  entrer votre mot de passe",
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 50),
                        Text("Vous n'avez pas de compte ? "),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Inscrivez-vous ici !",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Se connecter"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
