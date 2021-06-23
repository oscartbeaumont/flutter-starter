import 'package:flutter/material.dart';
import '../api/api.dart';
import "../state.dart";

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isLoading = false;
  var error;

  void loginBtn() async {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() => isLoading = true);
    if (_formKey.currentState!.validate()) {
      var authenticatedUser = await API.login(
          emailController.value.text, passwordController.value.text);
      if (authenticatedUser != null) {
        AppState.of(context).setUser(authenticatedUser);
        Navigator.popAndPushNamed(context, '/home');
      } else {
        setState(() {
          error = "Your credentials are incorrect.";
          isLoading = false;
        });
      }
    } else {
      setState(() => isLoading = false);
    }
  }

  void removeError() {
    setState(() => error = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: AutofillGroup(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Login", style: TextStyle(fontSize: 25)),
                Text(error != null ? "Error: $error" : "",
                    style: TextStyle(color: Colors.red)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                  child: TextFormField(
                    controller: emailController,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: [AutofillHints.email],
                    textInputAction: TextInputAction.next,
                    onChanged: (_) => removeError(),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "user@example.com"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    autofillHints: [AutofillHints.password],
                    textInputAction: TextInputAction.done,
                    onChanged: (_) => removeError(),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "password"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: isLoading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: loginBtn, child: Text('Login')),
                ),
              ],
            ))));
  }
}
