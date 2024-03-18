import 'package:flutter/material.dart';
import 'home.dart';
import 'ai.dart'; // Yapay zeka dosyasını import ediyoruz
import 'profile.dart'; // Profil dosyasını import ediyoruz
import 'Chat.dart'; // Sohbet dosyasını import ediyoruz

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Anasayfa(firstName: '', lastName: '', password: ''),
    );
  }
}

class Anasayfa extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String password;

  const Anasayfa({Key? key, required this.firstName, required this.lastName, required this.password}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    MyHomePage(), // home.dart'tan PageOne widget'ını kullanıyoruz
    Chatscreen(), // Yapay zeka sayfasını burada kullanıyoruz
    FriendAddScreen(), // Sohbet sayfasını burada kullanıyoruz
    ProfileScreen(), // Profil sayfasını burada kullanıyoruz
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Bar Örneği'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50,
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '1',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '2',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Sohbet', // Sohbet sayfasını buraya ekledik
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '4',
              ),
            ],
            selectedLabelStyle: TextStyle(fontSize: 10), // Seçili öğe yazı boyutu
            unselectedLabelStyle: TextStyle(fontSize: 10), // Seçilmemiş öğe yazı boyutu
            selectedItemColor: Colors.black, // Seçili öğe rengi
            unselectedItemColor: Colors.black.withOpacity(0.6), // Seçilmemiş öğe rengi
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
