import 'package:flutter/material.dart';
import "../widgets/form_components.dart";
import '../api/api.dart';
import "../state.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  bool passwordVisible = false;
  String? error;

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    print(keyboardOpen);

    return Scaffold(
      body: Form(
        key: _formKey,
        child: AutofillGroup(
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutQuad,
                width: size.width,
                height: size.height / 3.0,
                top: keyboardOpen ? -size.height : 0.0,
                child: Container(
                  color: Colors.blue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedDefaultTextStyle(
                      child: const Text("Login"),
                      style: !keyboardOpen
                          ? const TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                            )
                          : const TextStyle(
                              color: Colors.black,
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                            ),
                      duration: const Duration(milliseconds: 200),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      error ?? "",
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 10.0),
                    TextFieldWidget(
                      controller: emailController,
                      hintText: "Email",
                      icon: Icons.mail_outline,
                      enabled: !isLoading,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [AutofillHints.email],
                      textInputAction: TextInputAction.next,
                      onChanged: (_) => setState(() => error = null),
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter your email'
                          : null,
                    ),
                    const SizedBox(height: 10.0),
                    TextFieldWidget(
                      controller: passwordController,
                      hintText: "Password",
                      icon: Icons.lock_outline,
                      suffixIcon: passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      enabled: !isLoading,
                      obsecureText: !passwordVisible,
                      autocorrect: false,
                      autofillHints: const [AutofillHints.password],
                      textInputAction: TextInputAction.done,
                      onSuffixPressed: () =>
                          setState(() => passwordVisible = !passwordVisible),
                      onChanged: (_) => setState(() => error = null),
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter your password'
                          : null,
                    ),
                    const SizedBox(height: 30.0),
                    ButtonWidget(
                        title: "Login",
                        loading: isLoading,
                        onPressed: loginBtn),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
