import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fully_authotication_app/providers/firebase_Provider.dart';
import 'package:fully_authotication_app/screens/home_screen.dart';
import 'package:fully_authotication_app/screens/register.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fully Authentication App"),
      ),
      body: Center(
        child: Container(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const Text("Login",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                            label: const Text("User Name"),
                            hintText: "Enter Your UserName",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Email is Required";
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            label: const Text("Password"),
                            hintText: "Enter Your Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        keyboardType: TextInputType.text,
                        controller: password,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Password is Required";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              final res = await context
                                  .read<FirebaseProvider>()
                                  .loginUser(email.text, password.text);
                              if (res) {
                                print("User Logged in");
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              } else {
                                print("User does not Exists");
                              }
                            }
                          },
                          child: const Text(
                            " Login",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Don't have an account ? ",
                            style: const TextStyle(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Register()));
                                    },
                                  text: "Register",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey,
                                      fontSize: 18))
                            ]),
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
