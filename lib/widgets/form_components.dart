import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function()? onSuffixPressed;
  final String? Function(String?)? validator;
  final bool? enabled;
  final bool? obsecureText;
  final bool? autocorrect;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;

  const TextFieldWidget({
    Key? key,
    this.hintText,
    this.icon,
    this.suffixIcon,
    this.controller,
    this.onChanged,
    this.onEditingComplete,
    this.onSuffixPressed,
    this.validator,
    this.enabled,
    this.obsecureText,
    this.autocorrect,
    this.keyboardType,
    this.autofillHints,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      onEditingComplete: onEditingComplete,
      enabled: enabled ?? true,
      obscureText: obsecureText ?? false,
      autocorrect: autocorrect ?? true,
      enableSuggestions: autocorrect ?? true,
      keyboardType: keyboardType,
      autofillHints: enabled ?? true ? autofillHints : null,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: Icon(
          icon,
          size: 18,
          color: Colors.blue,
        ),
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        suffixIcon: GestureDetector(
          onTap: onSuffixPressed,
          child: Icon(
            suffixIcon,
            size: 18,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String? title;
  final bool? loading;
  final void Function()? onPressed;

  const ButtonWidget({Key? key, this.title, this.loading, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.blue, width: 1.0),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 60.0,
            child: Center(
              child: loading ?? false
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      title ?? "",
                      style: const TextStyle(color: Colors.white),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
