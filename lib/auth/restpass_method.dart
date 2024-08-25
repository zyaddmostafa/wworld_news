import 'package:firebase_auth/firebase_auth.dart';

Future Restpassword({required String email}) async {
  await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
}
