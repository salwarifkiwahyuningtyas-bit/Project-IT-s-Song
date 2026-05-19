import 'package:flutter/material.dart';
import 'package:flutter_application_2/akun.dart';
import 'package:flutter_application_2/homepage.dart';
import 'package:flutter_application_2/playlist.dart';
import 'package:flutter_application_2/top3.dart';
import 'playsong.dart';

class JenisPlaylist extends StatefulWidget {
  const JenisPlaylist({super.key});

  @override
  State<JenisPlaylist> createState() => _JenisPlaylist();
}

class _JenisPlaylist extends State<JenisPlaylist> {
  int selectedIndex = 1;
  int selectedButton = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFFFEE0),

        appBar: AppBar(
          backgroundColor: const Color(0xFFFFFEE0),
          elevation: 0,
          centerTitle: true,
          toolbarHeight: 80,

          title: const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              "IT's SONG",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: 280,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: const Center(
                  child: Text(
                    "My Playlist",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedButton == 1 ? const Color.fromARGB(255, 148, 52, 45) :const Color(0xFFFFFEE0),
                      foregroundColor: selectedButton == 1 ? Colors.white : Colors.black,
                      side: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),

                    onPressed: () {
                      setState(() {
                        selectedButton = 1;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (_) => TopArtPage()));
                    },
                    child: const Text("IT's Artist"),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedButton == 0 ? const Color.fromARGB(255, 148, 52, 45) : const Color(0xFFFFFEE0),
                      foregroundColor: selectedButton == 0 ? Colors.white : Colors.black,
                      side: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),

                    onPressed: () {
                      setState(() {
                        selectedButton = 0;
                      });
                    },

                    child: const Text("IT's Playlist"),
                  ),
                ],
              ),
            const SizedBox(height: 30),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 1),
                child: Image.asset('assets/love pulse.jpeg',
                width: 100),
              )
            ],
          )
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 148, 52, 45),
          foregroundColor: Colors.white,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) => const IsiPlaylist()));
          }, 
          child: const Icon(Icons.add)
          ),

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
                padding: EdgeInsets.all(
                  selectedIndex == 0 ? 8 : 2),
                decoration: BoxDecoration(
                  color: selectedIndex == 0 ? Colors.black12 : Colors.transparent,

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
                        builder: (_) => const JenisPlaylist(),
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