import 'package:flutter/material.dart';
import 'package:flutter_application_2/daftarplaylist.dart';
import 'package:flutter_application_2/top3.dart';
import 'package:flutter_application_2/homepage.dart';
import 'package:flutter_application_2/akun.dart';
import 'playsong.dart';

class IsiPlaylist extends StatefulWidget {
  const IsiPlaylist({super.key});

  @override
  State<IsiPlaylist> createState() => _IsiPlaylistState();
}

class _IsiPlaylistState extends State<IsiPlaylist> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ITSong',

      home: Scaffold(
        backgroundColor: const Color(0xFFFFFEE0),

        appBar: AppBar(
          backgroundColor: const Color(0xFFFFFEE0),
          toolbarHeight: 45,
          centerTitle: true,

          title: const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'buat galau',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const JenisPlaylist(),
                ),
              );
            },

            icon: const Icon(
              Icons.arrow_left,
              size: 50,
              color: Colors.black,
            ),
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),

              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: const Offset(3, 5),
                      ),
                    ],
                  ),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1),

                    child: Image.asset(
                      'assets/boynextdoor2.jpeg',
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.edit, size: 25, color: const Color.fromARGB(255, 134, 21, 21))),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.shuffle, size: 25, color: const Color.fromARGB(255, 134, 21, 21))),
                    IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => Playsong()));
                    }, icon: const Icon(Icons.play_circle_fill, size: 40, color: const Color.fromARGB(255, 134, 21, 21))),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border_outlined, size: 25, color: const Color.fromARGB(255, 134, 21, 21))),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.download, size: 25, color: const Color.fromARGB(255, 134, 21, 21))),
                  ],
                ),
              )
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 148, 52, 45),
          foregroundColor: Colors.white,

          onPressed: () {},

          child: const Icon(Icons.add),
        ),

        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(16),

          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 8,
          ),

          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),

            borderRadius: BorderRadius.circular(20),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              // HOME
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),

                padding: EdgeInsets.all(
                  selectedIndex == 0 ? 8 : 2,
                ),

                decoration: BoxDecoration(
                  color: selectedIndex == 0
                      ? Colors.black12
                      : Colors.transparent,

                  borderRadius: BorderRadius.circular(12),
                ),

                child: IconButton(
                  onPressed: () {
                    setState(() => selectedIndex = 0);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AlbumPage(),
                      ),
                    );
                  },

                  icon: const Icon(
                    Icons.home_outlined,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),

              // TOP ART ACTIVE
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutBack,

                padding: EdgeInsets.all(
                  selectedIndex == 1 ? 9 : 3,
                ),

                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 148, 52, 45),
                  shape: BoxShape.circle,

                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),

                child: IconButton(
                  onPressed: () {
                    setState(() => selectedIndex = 1);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const TopArtPage(),
                      ),
                    );
                  },

                  icon: const Icon(
                    Icons.group_add_outlined,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),

              // MUSIC
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),

                padding: EdgeInsets.all(
                  selectedIndex == 2 ? 8 : 2,
                ),

                decoration: BoxDecoration(
                  color: selectedIndex == 2
                      ? Colors.black12
                      : Colors.transparent,

                  borderRadius: BorderRadius.circular(12),
                ),

                child: IconButton(
                  onPressed: () {
                    setState(() => selectedIndex = 2);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const Playsong(),
                      ),
                    );
                  },

                  icon: const Icon(
                    Icons.music_note_outlined,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),

              // PROFILE
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),

                padding: EdgeInsets.all(
                  selectedIndex == 3 ? 8 : 2,
                ),

                decoration: BoxDecoration(
                  color: selectedIndex == 3
                      ? Colors.black12
                      : Colors.transparent,

                  borderRadius: BorderRadius.circular(12),
                ),

                child: IconButton(
                  onPressed: () {
                    setState(() => selectedIndex = 3);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ProfilePage(),
                      ),
                    );
                  },

                  icon: const Icon(
                    Icons.account_circle_outlined,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}