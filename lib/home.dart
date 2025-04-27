import 'package:flutter/material.dart';

class LibraryHomePage extends StatefulWidget {
  @override
  _LibraryHomePageState createState() => _LibraryHomePageState();
}

class _LibraryHomePageState extends State<LibraryHomePage> {
  final Color primaryBrown = Color(0xFF49382A);
  final Color secondaryBeige = Color.fromARGB(255, 196, 180, 167);
  final Color accentBrown = Color.fromARGB(255, 99, 80, 64);

  String activeSidebarItem = 'Home';
  bool isDarkMode = false;
  bool isLoading = false; // For shimmer effect

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  void selectSidebarItem(String title) {
    setState(() {
      activeSidebarItem = title;
    });
  }

  void showBookDetails(String title) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text("Here you could show the author, description, and more details about the book."),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Close'))
        ],
      ),
    );
  }

  void showProfileMenu() {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(1000, 80, 10, 0),
      items: [
        PopupMenuItem(child: Text("Profile")),
        PopupMenuItem(child: Text("Settings")),
        PopupMenuItem(child: Text("Logout")),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isDarkMode ? Colors.black : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 200,
            color: primaryBrown,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("My Biblio",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 40),
                SidebarItem(title: 'Home', isActive: activeSidebarItem == 'Home', onTap: selectSidebarItem),
                SidebarItem(title: 'Search', isActive: activeSidebarItem == 'Search', onTap: selectSidebarItem),
                SidebarItem(title: 'My Shelf', isActive: activeSidebarItem == 'My Shelf', onTap: selectSidebarItem),
                SidebarItem(title: 'Continue', isActive: activeSidebarItem == 'Continue', onTap: selectSidebarItem),
              ],
            ),
          ),

          // Main Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 300,
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: isDarkMode ? Colors.grey[800] : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            style: TextStyle(color: textColor),
                            decoration: InputDecoration(
                              hintText: 'Search books...',
                              hintStyle: TextStyle(color: textColor.withOpacity(0.5)),
                              border: InputBorder.none,
                              icon: Icon(Icons.search, color: textColor),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.notifications, color: textColor),
                              onPressed: () {},
                            ),
                            SizedBox(width: 10),
                            DropdownButton(
                              dropdownColor: backgroundColor,
                              style: TextStyle(color: textColor),
                              items: ['EN', 'FR']
                                  .map((lang) => DropdownMenuItem(
                                      value: lang, child: Text(lang)))
                                  .toList(),
                              onChanged: (_) {},
                              hint: Text("Lang", style: TextStyle(color: textColor)),
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: showProfileMenu,
                              child: CircleAvatar(
                                  backgroundColor: primaryBrown,
                                  child: Icon(Icons.person, color: Colors.white)),
                            ),
                            IconButton(
                              icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
                                  color: textColor),
                              onPressed: toggleTheme,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 30),

                    // Quote
                    Container(
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: secondaryBeige,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '"There is more treasure in books than in all the pirate’s loot on Treasure Island." - Walt Disney',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: 30),

                    // New Arrivals
                    SectionHeader(title: 'New Arrivals'),
                    SizedBox(
                      height: 180,
                      child: isLoading
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (_, i) => ShimmerCard())
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (_, i) => Padding(
                                padding: const EdgeInsets.only(right: 16.0), // Add space between the cards
                                child: GestureDetector(
                                  onTap: () => showBookDetails('New Book $i'),
                                  child: BookCard(title: 'New Book $i'),
                                ),
                              ),
                            ),
                    ),
                    SizedBox(height: 30),

                    // Recommended
                    SectionHeader(title: 'Recommended for You'),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width > 900 ? 3 : 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.6,
                      ),
                      itemBuilder: (_, i) => GestureDetector(
                        onTap: () => showBookDetails('Book $i'),
                        child: BookCard(title: 'Book $i'),
                      ),
                    ),
                    SizedBox(height: 30),

                    // Recent Readings
                    SectionHeader(title: 'Recent Readings'),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width > 900 ? 3 : 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.6,
                      ),
                      itemBuilder: (_, i) => GestureDetector(
                        onTap: () => showBookDetails('Reading $i'),
                        child: BookCard(title: 'Reading $i'),
                      ),
                    ),

                    // Footer
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(
                        child: Text(
                          '© 2025 My Biblio',
                          style: TextStyle(color: textColor.withOpacity(0.6)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function(String) onTap;
  const SidebarItem({required this.title, this.isActive = false, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(title),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        decoration: isActive
            ? BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(8),
              )
            : null,
        child: Text(
          title,
          style: TextStyle(color: Colors.white70, fontSize: 18, fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String title;
  const BookCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black12, blurRadius: 4, offset: Offset(2, 2)),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.brown[100],
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Center(
                child: Icon(Icons.book, size: 40, color: Colors.brown[400])),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}

class ShimmerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
