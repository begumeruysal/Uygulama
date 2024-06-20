import 'package:flutter/material.dart';
import 'order_screen.dart';
import 'track_screen.dart';
import 'menu_screen.dart';

class MainScreen extends StatefulWidget {
  final String name;
  final String email;

  MainScreen({required this.name, required this.email});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    OrderScreen(),
    TrackScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geri Dönüşüm Uygulaması'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: MenuScreen(name: widget.name, email: widget.email),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Sipariş',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: 'Çöp Takip',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            RecycleCard(
              title: 'Neden geridönüşüm',
              content:
              'Quidam alii sunt, et non est in nostra potestate. Quae omnia in nostra sententia, pursuit, cupiditatem, aversatio, ex quibus in',
              color: Colors.teal.shade100,
            ),
            RecycleCard(
              title: 'Neden geridönüşüm',
              content:
              'Quidam alii sunt, et non est in nostra potestate. Quae omnia in nostra sententia, pursuit, cupiditatem, aversatio, ex quibus in',
              color: Colors.teal.shade200,
            ),
            RecycleCard(
              title: 'Neden geridönüşüm',
              content:
              'Quidam alii sunt, et non est in nostra potestate. Quae omnia in nostra sententia, pursuit, cupiditatem, aversatio, ex quibus in',
              color: Colors.teal.shade300,
            ),
            // Add more RecycleCard widgets here for more content
          ],
        ),
      ),
    );
  }
}

class RecycleCard extends StatelessWidget {
  final String title;
  final String content;
  final Color color;

  const RecycleCard({
    Key? key,
    required this.title,
    required this.content,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(content),
          ],
        ),
      ),
    );
  }
}
