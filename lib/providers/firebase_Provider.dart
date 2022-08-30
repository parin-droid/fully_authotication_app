import 'package:flutter/material.dart';
import 'package:fully_authotication_app/repositry/login_repositry.dart';

class FirebaseProvider extends ChangeNotifier {
  final Repository repository;
  int currentIndex = 0;

  FirebaseProvider(this.repository);

  Future<bool> createUser(String email, String password, String name) async {
    final res = await repository.createUser(email, password, name);
    if (res) {
      return true;
    }
    return false;
  }

  Future<bool> loginUser(String email, String password) async {
    final res = await repository.loginUser(email, password);
    if (res) {
      return true;
    }
    return false;
  }
}
