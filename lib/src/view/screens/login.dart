
import 'package:august/src/view/screens/register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


import '../utilis/reg_ex.dart';
import 'home.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _inputController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("appName"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _inputController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field is required";
                        } else if (emailvalidation.hasMatch(value)) {
                          return "Please enter a valid email";
                        } else {
                          return null;
                        }
                      },
                      obscureText: hidePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          suffixIcon: IconButton(
                              onPressed: () {
                                hidePassword = !hidePassword;
                                setState(() {});
                              },
                              icon: Icon(hidePassword
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined)),
                          hintText: "Please enter your email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomeScreen(
                              title: _inputController.text,
                            )));
                  }
                },
                child: Text("Login")),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Not registered ? ",
                  style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: "Register",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
                    },
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold)),
            ])),
          ],
        ),
      ),
    );
  }
}