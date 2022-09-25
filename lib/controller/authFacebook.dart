import 'package:firebase_auth/firebase_auth.dart';
import 'package:pets/service/abstractRepositoryLogin.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

enum LoginType { Google, Twitter, Facebook }

class AuthFacebook extends AbstractRepositoryLogin {
  @override
  Future login({correo, password}) async {
    try {
      final facebookLoginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();

      final facebookAuthCredential = FacebookAuthProvider.credential(
          facebookLoginResult.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      print(userData["name"]);
    } on FirebaseAuthException catch (e) {
      print("erro");
    }
  }

  @override
  Future logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
