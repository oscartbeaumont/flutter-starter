import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final Widget body;
  final Widget? floatingActionButton;

  AppLayout({Key? key, required this.body, this.floatingActionButton})
      : super(key: key);

  // buttons defines the menu buttons and their respective route
  final buttons = {
    '/home':
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    '/settings': const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: "Settings"),
  };

  // currentIndex returns the index of the currently active route
  int currentIndex(BuildContext context) {
    return buttons.keys
        .toList()
        .indexOf(ModalRoute.of(context)!.settings.name!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Starter"),
        centerTitle: true,
      ),
      body: body,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: BottomNavigationBar(
        items: buttons.values.toList(),
        currentIndex: currentIndex(context),
        onTap: (itemIndex) {
          if (itemIndex != currentIndex(context)) {
            Navigator.popAndPushNamed(
                context, buttons.keys.elementAt(itemIndex));
          }
        },
      ),
    );
  }
}
