import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:farmer_assistance/domain/failures/failures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/user_model.dart';
import '../../domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoriesIml extends AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  final GoogleSignIn _googleSignIn;
  AuthRepositoriesIml(this._firebaseAuth, this._firestore, this._googleSignIn);

  @override
  Future<Either<Failures, void>> logOut() async {
    final user = _firebaseAuth.currentUser;

    if (user != null && _isGoogleUser(user)) {
      try {
        // Google Sign-Out & Disconnect
        await _googleSignIn.signOut();
        await _googleSignIn.disconnect(); // 🔒 Optional: Revoke access
      } catch (e) {
        print("Google Sign-Out Error: $e");
      }
    }

    // Firebase sign out (common for all)
    await _firebaseAuth.signOut();
    return right(null);
  }

  bool _isGoogleUser(User user) {
    for (final info in user.providerData) {
      if (info.providerId == 'google.com') return true;
    }
    return false;
  }

  @override
  Future<Either<Failures, void>> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential? userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left(UserNotFoundFailure());
      } else if (e.code == 'wrong-password') {
        return left(WrongPasswordFailure());
      } else if (e.code == 'invalid-credential') {
        return left(InvalidCredentialFailure());
      } else if (e.code == 'user-disabled') {
        return left(UserDisabledFailure());
      } else if (e.code == 'too-many-requests') {
        return left(
          GeneralFailure("Too many attempts. Please try again later."),
        );
      } else {
        return left(GeneralFailure(e.code.toString()));
      }
    } catch (e) {
      return left(GeneralFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> loginWithGoogle() async {
    try {
      await _googleSignIn.initialize();
      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google [UserCredential]
      final UserCredential userCredential = await _firebaseAuth
          .signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        final uid = user.uid;
        final email = user.email;
        final name = user.displayName;
        final photoUrl = user.photoURL;
        final phoneNumber = user.phoneNumber;

        final userModel = UserModel(
          uid: uid,
          name: name!,
          email: email!,
          photoUrl: photoUrl ?? '',
          phoneNumber: phoneNumber ?? '',
        );
        await _firestore
            .collection('users')
            .doc(uid)
            .set(userModel.toMap(), SetOptions(merge: true));
      }

      return Right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'operation-not-allowed') {
        return left(
          GeneralFailure(
            "Google sign-in is not enabled. Please contact support.",
          ),
        );
      } else if (e.code == 'user-disabled') {
        return left(UserDisabledFailure());
      } else if (e.code == 'network-request-failed') {
        return left(
          GeneralFailure(
            "Network request failed. Please check your internet connection.",
          ),
        );
      } else if (e.code == 'invalid-credential') {
        return left(InvalidCredentialFailure());
      } else if (e.code == 'too-many-requests') {
        return left(
          GeneralFailure("Too many attempts. Please try again later."),
        );
      } else {
        return left(GeneralFailure(e.code.toString()));
      }
    } catch (e) {
      print("Error during Google sign-in: $e");
      return left(GeneralFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> registerWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      // Step 1: Create user with Firebase Auth
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      final User? user = userCredential.user;

      if (user == null) {
        return left(GeneralFailure(""));
      }

      // Step 2: Update the user's display name
      await user.updateDisplayName(name);

      // Step 3: Save user info to Firestore
      // Build user model
      final userModel = UserModel(
        uid: user.uid,
        name: name,
        email: email,
        photoUrl: '',
        phoneNumber: '',
      );
      await _firestore.collection('users').doc(user.uid).set(userModel.toMap());

      return right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(EmailAlreadyInUseFailure());
      } else if (e.code == 'weak-password') {
        return left(WeakPasswordFailure());
      } else if (e.code == 'too-many-requests') {
        return left(
          GeneralFailure("Too many attempts. Please try again later."),
        );
      } else {
        return left(UnknownAuthFailure());
      }
    } catch (e) {
      return left(GeneralFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> forgotPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left(UserNotFoundFailure());
      } else if (e.code == 'too-many-requests') {
        return left(
          GeneralFailure("Too many attempts. Please try again later."),
        );
      } else if (e.code == 'invalid-email') {
        return left(InvalidEmailFailure());
      } else if (e.code == 'user-disabled') {
        return left(UserDisabledFailure());
      } else if (e.code == 'invalid-credential') {
        return left(InvalidCredentialFailure());
      } else {
        return left(GeneralFailure(e.code.toString()));
      }
    } catch (e) {
      return left(GeneralFailure(e.toString()));
    }
  }
}
