import 'package:flutter/material.dart';

import 'pages/my_wallet.dart';
import 'pages/pomodoros.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xFFE7626C),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: const Color(0xFFF4EDDB),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            // selectedIcon: Icon(Icons.wallet),
            icon: Icon(Icons.wallet),
            label: 'My Wallet',
          ),
          NavigationDestination(
            icon: Icon(Icons.play_circle_outlined),
            label: 'Pomodoro',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.laptop_windows)),
            label: 'WEBTOON',
          ),
        ],
      ),
      body: <Widget>[
        const MyWallet(),
        const Pomodoros(),
      ][currentPageIndex],
    );
  }
}
