import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import "api/api.dart";

// AppState represents the global application state
class AppState extends Model {
  static const _storage = FlutterSecureStorage();

  User? _user;

  User? get user => _user;

  Future<bool> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userName = prefs.getString('user.name');
    var userEmail = prefs.getString('user.email');
    var userAPIToken = await _storage.read(key: 'user.apiToken');

    if (userName == null || userEmail == null || userAPIToken == null) {
      return false;
    }

    var user = User(
      userName,
      userEmail,
      userAPIToken,
    );
    setUser(user);
    return true;
  }

  void setUser(User? user) async {
    _user = user;
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (user != null) {
      await prefs.setString('user.name', user.name);
      await prefs.setString('user.email', user.email);
      await _storage.write(key: 'user.apiToken', value: user.apiToken);
    } else {
      await prefs.remove('user.name');
      await prefs.remove('user.email');
      await _storage.delete(key: 'user.apiToken');
    }
  }

  static AppState of(BuildContext context) => ScopedModel.of<AppState>(context);
}
