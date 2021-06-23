// User represents the authenticated user
class User {
  String name;
  String email;
  String apiToken;

  User(this.name, this.email, this.apiToken);
}

// API represents the apps backend API
class API {
  // login authenticates the user with the API
  static Future<User?> login(String email, String password) async {
    print("Login Request $email  $password");
    await Future.delayed(Duration(seconds: 2));
    if (email == "wrong") {
      return null;
    }
    return User("Test Mctestface", email, "mySecureAccessToken");
  }
}
