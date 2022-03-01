import 'package:bottom_navigation/bottom_navigation.dart';
import 'package:bottom_navigation/tabs.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedTabIndex = blueIndex; // Set preselected tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: bottomNavigationHeight,
            child: IndexedStack(
              index: selectedTabIndex,
              children: [
                BlueScreen(),
                YellowScreen(),
                RedScreen(),
                GreenScreen(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: BottomNavigation(
              selectedTabIndex: selectedTabIndex,
              onTap: (int index) {
                setState(() {
                  selectedTabIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
