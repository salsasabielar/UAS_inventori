import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
String name;
String email;
String imageUrl;

Future<void> signOutEmail() async {
  FirebaseAuth.instance.signOut();
  print("User Signed Out");
}

Future<User> signIn(String email, String password) async {
  await Firebase.initializeApp();

  UserCredential authResult =
      await _auth.signInWithEmailAndPassword(email: email, password: password);
  User user = authResult.user;

  if (user != null) {
// Checking if email and name is null
    assert(user.email != null);
    email = user.email;
    return user;
  }
  return null;
}

Future<String> signUp(String emailInput, String password) async {
  await Firebase.initializeApp();
  try {
    // UserCredential userCredential = await FirebaseAuth.instance
    //     .signInWithEmailAndPassword(email: emailInput, password: password);

    // final User user = userCredential.user;

    // if (user != null) {
    //   assert(user.email != null);
    //   email = user.email;
    //   assert(!user.isAnonymous);
    //   assert(await user.getIdToken() != null);
    //   final User currentUser = _auth.currentUser;
    //   assert(user.uid == currentUser.uid);
    //   print('signInWithGoogle succeeded: $user');
    //   return '$user';
    // }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailInput, password: password);
      return await signUp(emailInput, password);
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      return null;
    }
  }
  return null;
}
