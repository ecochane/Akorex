import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AkorexFirebaseUser {
  AkorexFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

AkorexFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<AkorexFirebaseUser> akorexFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<AkorexFirebaseUser>((user) => currentUser = AkorexFirebaseUser(user));
