import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'views/loading.dart';
import 'views/login.dart';
import 'views/home.dart';
import 'views/settings.dart';
import 'state.dart';

// main is the entrypoint of the application
void main() {
  runApp(Application());
}

// Application is the root widget. It primarily contains the router.
class Application extends StatelessWidget {
  Application({Key? key}) : super(key: key);

  final routes = {
    '/loading': (context) => const LoadingPage(),
    '/login': (context) => const LoginPage(),
    '/home': (context) => const HomePage(),
    '/settings': (context) => const SettingsPage(),
  };

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppState>(
      model: AppState(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
          title: 'Starter',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const ApplicationLauncher(),
          onGenerateRoute: (settings) {
            return PageRouteBuilder(
              settings: settings,
              pageBuilder: (context, _, __) => routes[settings.name]!(context),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) => child,
            );
          },
        ),
      ),
    );
  }
}

// ApplicationLauncher is the intial page shown to the user. It shows the loading page until the user's authentication state is known then redirects to the correct page.
class ApplicationLauncher extends StatefulWidget {
  const ApplicationLauncher({Key? key}) : super(key: key);

  @override
  _ApplicationLauncherState createState() => _ApplicationLauncherState();
}

class _ApplicationLauncherState extends State<ApplicationLauncher> {
  @override
  void initState() {
    super.initState();
    initStateAsync();
  }

  void initStateAsync() async {
    var state = AppState.of(context);
    var isAuthenticated = await state.loadUser();
    if (isAuthenticated) {
      Navigator.popAndPushNamed(context, '/home');
    } else {
      Navigator.popAndPushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const LoadingPage();
  }
}
