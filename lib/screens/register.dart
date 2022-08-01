import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fully_authotication_app/providers/firebase_Provider.dart';
import 'package:fully_authotication_app/screens/login.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isActive = true;
  bool autoValidate = false;

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (email.text.isEmpty &&
          name.text.isEmpty &&
          number.text.isEmpty &&
          password.text.isEmpty) {
        setState(() {
          isActive = false;
        });
      } else {
        setState(() {
          isActive = true;
        });
      }
    });
    return Scaffold(
      body: Center(
        child: Container(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const Text("Register",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                            label: const Text("Email"),
                            hintText: "Enter Your Email",
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
                        decoration: InputDecoration(
                            label: const Text("Name"),
                            hintText: "Enter Your Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        keyboardType: TextInputType.text,
                        controller: name,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Email is Required";
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                            label: const Text("Number"),
                            hintText: "Enter Your Number",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        keyboardType: TextInputType.number,
                        controller: number,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Email is Required";
                          }
                        },
                      ),
                      SizedBox(height: 20),
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
                            return "Email is Required";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary:
                                  isActive == true ? Colors.blue : Colors.grey),
                          onPressed: isActive == true
                              ? () async {
                                  if (formKey.currentState!.validate()) {
                                    print("hello");
                                    final res = await context
                                        .read<FirebaseProvider>()
                                        .createUser(email.text, password.text,
                                            name.text);
                                    if (res) {
                                      print("user Created");
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    } else {
                                      print("User not Created");
                                    }
                                  }
                                }
                              : null,
                          child: const Text(
                            " Register",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
