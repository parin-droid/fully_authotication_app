import 'package:firebase_auth/firebase_auth.dart';

class Repository {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  Future<bool> createUser(String email, String password, String name) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    user = userCredential.user;
    await user!.updateDisplayName(name);
    print(user);

    return true;
  }

  Future<bool> loginUser(String email, String password) async {
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    user = userCredential.user;
    print(user);

    return true;
  }
}
