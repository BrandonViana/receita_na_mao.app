import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String?> logUser({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // login bem-sucedido
    } on FirebaseAuthException catch (_) {
      return 'Erro ao entrar. Verifique seu email e senha.';
    } catch (_) {
      return 'Erro inesperado. Tente novamente mais tarde.';
    }
  }
}
