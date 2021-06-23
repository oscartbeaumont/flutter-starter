import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CircularProgressIndicator(),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                "Loading...",
                style: TextStyle(fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
  }
}
