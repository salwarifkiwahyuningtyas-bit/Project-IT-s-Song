import 'package:flutter/material.dart';
import 'package:flutter_application_2/playsong.dart';
import 'package:flutter_application_2/akun.dart';
import 'package:flutter_application_2/top3.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const SizedBox(), // HOME content di dalam body (bukan ganti page)
    const Center(child: Text("Library Page")),
    const Center(child: Text("Profile Page")),
    const Center(child: Text("Settings Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFFFEE0),

        // ⭐ SAMA STRUKTURNYA DENGAN PLAYSONG
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFFEE0),
          elevation: 0,
          toolbarHeight: 50,
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'REKOMENDASI ALBUM',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),

              // search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3E3E3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search...",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        height: 45,
                        width: 50,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.search, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // LIST ALBUM
              Column(
                children: [
                  albumItem("NIKI", 'assets/Nicole_(Album)_cover.png'),
                  albumItem("KESHI", 'assets/keshi.png'),
                  albumItem("BOYNEXTDOOR", 'assets/boynextdoor2.jpeg'),
                  albumItem("TREASURE", 'assets/treasure2.jpeg'),
                  albumItem("TAYLOR SWIFT", 'assets/taylorswift.jpg'),
                  albumItem("LNGSHOT", 'assets/lngshot.jpeg')
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),

        // ⭐ NAVBAR PERSIS SAMA PLAYSONG
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // HOME
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: EdgeInsets.all(selectedIndex == 0 ? 9 : 3),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 148, 52, 45),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black,width: 1),
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() => selectedIndex = 0);
                    // halaman ini sendiri
                  },
                  icon: const Icon(Icons.home_outlined, size: 20, color: Colors.black),
                ),
              ),

              // GROUP
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: EdgeInsets.all(selectedIndex == 1 ? 8 : 2),
                decoration: BoxDecoration(
                  color: selectedIndex == 1 ? Colors.black12 : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() => selectedIndex = 1);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => TopArtPage()));
                  },
                  icon: const Icon(Icons.group_add_outlined,
                      size: 20, color: Colors.black),
                ),
              ),

              // MUSIC
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutBack,
                padding: EdgeInsets.all(selectedIndex == 2 ? 8 : 2),
                decoration: BoxDecoration(
                  color: selectedIndex == 2 ? Colors.black12 : Colors.transparent,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() => selectedIndex = 2);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Playsong()));
                  },
                  icon: const Icon(Icons.music_note_outlined,
                      size: 20, color: Colors.black),
                ),
              ),

              // PROFILE
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: EdgeInsets.all(selectedIndex == 3 ? 8 : 2),
                decoration: BoxDecoration(
                  color: selectedIndex == 3 ? Colors.black12 : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() => selectedIndex = 3);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ProfilePage()));
                  },
                  icon: const Icon(Icons.account_circle_outlined,
                      size: 20, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget albumItem(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(imagePath, width: 70, height: 70, fit: BoxFit.cover),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF9A3B3B), Color(0xFFB96D6D)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
