import 'package:flutter/material.dart';

class LibraryHomePage extends StatelessWidget {
  final Color primaryBrown = Color(0xFF49382A);
  final Color secondaryBeige = Color.fromARGB(255, 196, 180, 167);
  final Color accentBrown = Color.fromARGB(255, 99, 80, 64);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                SidebarItem(title: 'Home'),
                SidebarItem(title: 'Search'),
                SidebarItem(title: 'My Shelf'),
                SidebarItem(title: 'Continue'),
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
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search books...',
                              border: InputBorder.none,
                              icon: Icon(Icons.search),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            DropdownButton(
                              items: ['EN', 'FR']
                                  .map((lang) => DropdownMenuItem(
                                      value: lang, child: Text(lang)))
                                  .toList(),
                              onChanged: (_) {},
                              hint: Text("Lang"),
                            ),
                            SizedBox(width: 10),
                            CircleAvatar(
                                backgroundColor: primaryBrown,
                                child: Icon(Icons.person, color: Colors.white))
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
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (_, i) =>
                            BookCard(title: 'New Book $i'),
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
                        crossAxisCount: 3,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.6,
                      ),
                      itemBuilder: (_, i) => BookCard(title: 'Book $i'),
                    ),
                    SizedBox(height: 30),

                    // Recent Readings
                    SectionHeader(title: 'Recent Readings'),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.6,
                      ),
                      itemBuilder: (_, i) => BookCard(title: 'Reading $i'),
                    ),
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
  const SidebarItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(title,
          style: TextStyle(color: Colors.white70, fontSize: 18)),
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
