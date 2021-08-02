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

## Testing on IOS without MacOS

This is can be done using [Sideloadly](https://iosgods.com/topic/130167-windowsmacosm1ios-15-introducing-sideloadly-working-cydia-impactor-alternative) and [Codemagic](https://codemagic.io).

First create a Codemagic account and add the repository which contains the source code for your Flutter application. Next disable Android builds (as you can do them locally and this will save you build minutes). Under the *Test* step disable *Stop build if tests fail* and under the *Build* step change the *Mode* to *Release*. After saving these changes select *Start new build*. When the build is complete download the *Runner.app.zip* *Artifact* and put it in the same folder as the `runner-to-ipa.ps1` script. Execute the script and it will create a `Payload.ipa` file which can be installed to the device.

To install the IPA to your device download [Sideloadly](https://iosgods.com/topic/130167-windowsmacosm1ios-15-introducing-sideloadly-working-cydia-impactor-alternative). Connect your iPhone, select the IPA file from the previous step and connect it with an Apple ID. **Please use a disposable Apple ID for security!** Then the app will be installed to your device. You device will prompt you to trust the developer of the application which is done through Settings.

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
