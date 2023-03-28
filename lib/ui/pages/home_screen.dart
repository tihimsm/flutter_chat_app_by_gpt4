import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../widgets/login_widget.dart';
import '../widgets/register_widget.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          RegisterWidget(),
          LoginWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageController.page?.round() ?? 0,
        onTap: (index) => pageController.animateToPage(index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: 'Register',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
          ),
        ],
      ),
    );
  }
}
