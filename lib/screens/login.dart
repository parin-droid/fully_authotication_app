import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
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
                      controller: userName,
                      validator: (val) {},
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
                      validator: (val) {},
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          " Login",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Don't have an account ? ",
                          children: <TextSpan>[
                            TextSpan(
                                text: "Register",
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ]),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
