import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  final bool isDarkMode;
  const AccountPage({required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isDarkMode ? Colors.black : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final cardColor = isDarkMode ? Colors.grey[800] : Colors.grey[200];

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor),
        title: Text('Mon Compte', style: TextStyle(color: textColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Picture with Border
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.brown[200],
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
              SizedBox(height: 20),

              // Name and Email with Styling
              Text('Jean Dupont', style: TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('jean.dupont@example.com', style: TextStyle(color: textColor.withOpacity(0.7))),
              SizedBox(height: 20),

              // Buttons for Editing Profile or Changing Password
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                    label: Text('Modifier Profil'),
                  ),
                  SizedBox(width: 10),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.brown,
                      side: BorderSide(color: Colors.brown),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.lock),
                    label: Text('Mot de Passe'),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Stats with Card Styling
              Card(
                color: cardColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StatItem(label: 'Emprunts', value: '12', color: textColor),
                      StatItem(label: 'Lus', value: '8', color: textColor),
                      StatItem(label: 'Favoris', value: '5', color: textColor),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),

              // Settings & Logout Section
              ListTile(
                leading: Icon(Icons.settings, color: textColor),
                title: Text('Paramètres', style: TextStyle(color: textColor)),
                trailing: Icon(Icons.chevron_right, color: textColor),
                onTap: () {},
              ),
              Divider(color: textColor.withOpacity(0.2)),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.redAccent),
                title: Text('Se Déconnecter', style: TextStyle(color: Colors.redAccent)),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const StatItem({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
        SizedBox(height: 4),
        Text(label, style: TextStyle(color: color.withOpacity(0.7))),
      ],
    );
  }
}
