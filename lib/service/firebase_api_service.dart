import 'package:firebase_auth/firebase_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseApiService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 🔐 Sign up with email, password, and full name
  Future<User?> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      // Create user in Firebase Auth
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = result.user;

      // Save additional info to Firestore
      if (user != null) {
        await _firestore.collection('USERS').doc(user.uid).set({
          'fullName': fullName,
          'email': email,
          'password': password,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('Error: Email is already in use.');
        Get.snackbar("Error", "Email is already in use.",
            snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'invalid-email') {
        print('Error: Invalid email address.');
        Get.snackbar("Error", "Invalid email address.",
            snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'weak-password') {
        print('Error: The password is too weak.');
        Get.snackbar("Error", "The password is too weak.",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        print('FirebaseAuth Error: ${e.message}');
        Get.snackbar("Error", e.message.toString(),
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print("Sign Up Error: $e");
      return null;
    }
  }

  // 🔐 Login with email and password
  Future<User?> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          print('No user found for that email.');
          Get.snackbar("Error", 'No user found for that email.',
              snackPosition: SnackPosition.BOTTOM);
          break;
        case 'invalid-credential':
          print('Wrong password provided.');
          Get.snackbar("Error", 'Wrong password provided.',
              snackPosition: SnackPosition.BOTTOM);
          break;
        case 'invalid-email':
          print('Invalid email address.');
          Get.snackbar("Error", 'Invalid email address.',
              snackPosition: SnackPosition.BOTTOM);
          break;
        case 'user-disabled':
          print('This user account has been disabled.');
          Get.snackbar("Error", 'This user account has been disabled.',
              snackPosition: SnackPosition.BOTTOM);
          break;
        case 'too-many-requests':
          print('Too many login attempts. Try again later.');
          Get.snackbar("Error", "Too many login attempts. Try again later.",
              snackPosition: SnackPosition.BOTTOM);
          break;
        default:
          print('Login Error: ${e.message}');
          Get.snackbar("Error", e.message.toString(),
              snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print("Login Error: $e");
      return null;
    }
    return null;
  }

  // 🔓 Logout user
  Future<void> logout() async {
    await _auth.signOut();
  }

  // 🔍 Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
