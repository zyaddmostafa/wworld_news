import 'package:firebase_auth/firebase_auth.dart';

Future<void> loginuser(
    {required String email, required String password}) async {
  await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);
}
