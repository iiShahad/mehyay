import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mehyay/auth/models/user_model.dart';
import 'package:mehyay/core/constants/firebase_constants.dart';
import 'package:mehyay/core/providers/firebase_providers.dart';
import 'package:mehyay/core/types/failure.dart';
import 'package:mehyay/core/types/fpdart_types.dart';

final authRepositoryProvider = Provider(
    (ref) => AuthRepository(ref: ref, firebaseAuth: ref.read(authProvider)));

class AuthRepository {
  final Ref _ref;
  final _firebaseAuth;
  AuthRepository({required Ref ref, required FirebaseAuth firebaseAuth})
      : _ref = ref,
        _firebaseAuth = firebaseAuth;

  //auth state changes
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  //sign in
  FutureEither<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      UserModel user = await getUserData(userCredential.user!.uid);
      return right(user);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //sign up
  FutureEither<UserModel> signUp(
      {required String email,
      required String password,
      required String phoneNumber,
      required String name}) async {
    try {
      print("$email, $password, $phoneNumber, $name");
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel user = UserModel(
        id: userCredential.user!.uid,
        email: userCredential.user!.email!,
        phoneNumber: phoneNumber,
        name: name,
        isParamedic: true,
      );
      await _ref
          .read(firestoreProvider)
          .collection(FirebaseConstants.users)
          .doc(user.id)
          .set(user.toJson());
      return right(user);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //get user data
  Future<UserModel> getUserData(String uid) {
    final data = _ref
        .read(firestoreProvider)
        .collection(FirebaseConstants.users)
        .doc(uid)
        .get();
    return data.then((value) => UserModel.fromJson(value.data()!));
  }

  //sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
