import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:projeto_piloto/data/auth/models/auth_model.dart';

class AuthServiceImp extends AuthService {
  final _firebaseAuth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  @override
  Future<AuthModel> signUp(String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    return AuthModel(
      email: authResult.user!.email!,
      profileUrl: authResult.user!.photoURL!,
      displayName: authResult.user!.displayName!,
    );
  }

  @override
  Future<AuthModel?> getAuthenticatedUser() async {
    User? currentUser = _firebaseAuth.currentUser!;
    return AuthModel(
        email: currentUser.email!,
        profileUrl: currentUser.photoURL!,
        displayName: currentUser.displayName!);
  }

  @override
  Future<void> signOut() => _firebaseAuth.signOut();

  @override
  Future<UserCredential> signInWithCredentials(
      String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
    }
  }
}

abstract class AuthService {
  Future<AuthModel> signUp(String email, String password);

  Future<void> signInWithGoogle();

  Future<void> signInWithCredentials(String email, String password);

  Future<void> signOut();

  Future<AuthModel?> getAuthenticatedUser();
}
