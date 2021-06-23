# Flutter Starter

A basic Flutter project to use as a starting place for other applications.

## Features:

- Basic App Scaffold
- Global State Management using [scoped_model](https://pub.dev/packages/scoped_model)
- Storing information using [shared_preferences](https://pub.dev/packages/shared_preferences)
- Storing secure information (such as API key) using [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage)
- Mocked API

## Usage

Open this project in Flutter editor and run on device. For example using [Vscode Flutter](https://flutter.dev/docs/development/tools/vs-code) open the project and press `F5` then select `Dart & Flutter`.

## How it was created

1. Create new Flutter project using IDE
2. `flutter pub add scoped_model`
3. `flutter pub add shared_preferences`
4. `flutter pub add flutter_secure_storage`
5. `flutter pub add package_info_plus`
6. Build out basic application scaffold which in located in the `lib/` folder.

## Future Goals:

- File structure in regards to state and API
- Fix [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) bug with Android Google Drive backup
- Unit Testing
- Native OS Splash Screen's
- Analytics + Crashing Reporting
- CI/CD using GitHub Actions
