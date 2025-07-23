import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/mainscreen_provider.dart';
import '../shared/widgets.dart';
import 'widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pageList = const [
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (BuildContext context, mainScreenNotifier, Widget? child) {
        return _buildMainScreen(mainScreenNotifier);
      },
    );
  }

  Scaffold _buildMainScreen(MainScreenNotifier mainScreenNotifier) {
    return Scaffold(
      body: Center(child: pageList[mainScreenNotifier.pageIndex]),
      bottomNavigationBar: BottomNavBar(mainScreenNotifier: mainScreenNotifier),
    );
  }
}
