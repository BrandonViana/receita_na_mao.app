import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  registerUser({required String name, required password, required email}) {
    _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
