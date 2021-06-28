import 'package:flutter/material.dart';
import '../widgets/layout.dart';
import '../state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = AppState.of(context);
    if (state.user == null) Navigator.popAndPushNamed(context, "/login");

    return AppLayout(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 20.0, 32.0, 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome ${state.user!.name}!",
              style: const TextStyle(fontSize: 25.0),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text("Home Page!"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
