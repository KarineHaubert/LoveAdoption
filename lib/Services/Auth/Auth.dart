import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loveadoption/models/usuario.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseFirestore _db = FirebaseFirestore.instance;

// final UserService _userService = instance<UserService>();

String nomeCompleto;
String imageUrl;
String email;
User currentUser;
Usuario usuario;
String uid;
String telefone;

Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);

  final User user = authResult.user;

  currentUser = _auth.currentUser;
  assert(user.uid == currentUser.uid);
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);
  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoURL != null);

  nomeCompleto = user.displayName;
  imageUrl = user.photoURL;
  email = user.email;


  print('signInWithGoogle succeeded: $user');

  return '$user';
}


Future <void> createPhoneUser(User user) async {
  DocumentReference ref = _db.collection('Usuarios').doc(user.uid);

  return ref.set(
    {
      'Telefone': telefone,
    },
  );
}

Future<void> signOutGoogle() async {
  await _auth.signOut();
  googleSignIn.signOut();

  print("User Signed Out");
}

//  class FirebaseAuthService extends AuthService {
//    final FirebaseAuth _auth = FirebaseAuth.instance;
//    final GoogleSignIn _googleSignIn = GoogleSignIn();
//    final Firestore _db = Firestore.instance;

//    String nomeCompleto;
//    String email;
//    String imageUrl;

//    Observable<FirebaseUser> user;

//    Future<FirebaseUser> signInWithGoogle() async {
//      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//      if (googleUser == null) {
//        print("Usuario nulo");
//        return null;
//      }

//      final GoogleSignInAuthentication googleAuth =
//          await googleUser.authentication;
//      AuthCredential credential = GoogleAuthProvider.getCredential(
//        accessToken: googleAuth.accessToken,
//        idToken: googleAuth.idToken,
//      );

//      AuthResult result = await _auth.signInWithCredential(credential);
//      FirebaseUser user = result.user;

//      if (user != null) {
//        assert(user.email != null);
//        assert(user.displayName != null);
//        assert(user.photoUrl != null);

//         Store the retrieved data
//        nomeCompleto = user.displayName;
//        email = user.email;
//        imageUrl = user.photoUrl;

//         Only taking the first part of the name, i.e., First Name
//        if (nomeCompleto.contains(" ")) {
//          nomeCompleto = nomeCompleto.substring(0, nomeCompleto.indexOf(" "));
//        }
//      }

//      createUser(user);

//      print("Conectado " + user.displayName);

//      return user;
//    }

//    void createUser(FirebaseUser user) async {
//      DocumentReference ref = _db.collection('Usuarios').document(user.uid);

//      return ref.setData(
//        {
//          'uid': user.uid,
//          'email': user.email,
//          'photoURL': user.photoUrl,
//          'NomeCompleto': user.displayName,
//        },
//        merge: true,
//      );
//    }

//    void signOut() async {
//      await _auth.signOut();
//      _googleSignIn.signOut();
//      print("Usuario desconectado");
//    }

//    @override
//    Future<bool> isUserLoggedIn() async {
//      final currentUser = await _auth.currentUser();
//      currentUserUid = currentUser?.uid;
//      return currentUser != null;
//    }
//  }
