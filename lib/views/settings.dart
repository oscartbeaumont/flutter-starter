import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../widgets/layout.dart';
import '../state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  void logoutBtn(BuildContext context) {
    AppState.of(context).setUser(null);
    Navigator.popAndPushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    var state = AppState.of(context);
    if (state.user == null) Navigator.popAndPushNamed(context, "/login");

    return AppLayout(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 20.0, 32.0, 8.0),
              child: Text(
                "Settings",
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            ListTile(
              title: const Text("User Name"),
              subtitle: Text(state.user!.name),
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              title: const Text("User Email"),
              subtitle: Text(state.user!.email),
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              title: const Text("User API Token"),
              subtitle: Text(state.user!.apiToken),
            ),
            const Divider(
              thickness: 1,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => logoutBtn(context),
                child: const Text('Logout'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
              child: FutureBuilder<PackageInfo>(
                future: PackageInfo.fromPlatform(),
                builder: (BuildContext context,
                    AsyncSnapshot<PackageInfo> snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                        "Version: ${snapshot.data!.version} Build: ${snapshot.data!.buildNumber}");
                  } else {
                    return const Text("");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
