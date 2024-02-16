import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(ref: ref));

class AuthRepository {
  final Ref _ref;
  AuthRepository({required Ref ref}) : _ref = ref;

  //sign in
  // FutureEither<UserModel> signIn(String email, String password) async {
  //   try {
  //     UserCredential userCredential = await _firebaseAuth
  //         .signInWithEmailAndPassword(email: email, password: password);
  //     UserModel user = await getUserData(userCredential.user!.uid).first;
  //     return right(user);
  //   } catch (e) {
  //     return left(Failure(e.toString()));
  //   }
  // }
}
