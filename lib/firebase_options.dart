// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyChS9t2ICFqnjRURhAsv3sWNDMRCU-GfCU',
    appId: '1:169737066289:web:3f484e2e75940afa8cc210',
    messagingSenderId: '169737066289',
    projectId: 'ar-model-f0cfa',
    authDomain: 'ar-model-f0cfa.firebaseapp.com',
    storageBucket: 'ar-model-f0cfa.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBeHSRFpER0Y3WWSX_Xq2FKxXK0myVsQyo',
    appId: '1:169737066289:android:f76f7fc277afc33e8cc210',
    messagingSenderId: '169737066289',
    projectId: 'ar-model-f0cfa',
    storageBucket: 'ar-model-f0cfa.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA7p9DyyZN3WymHa9HoqOtDn16itmU_QTI',
    appId: '1:169737066289:ios:71bd68c9e70a630b8cc210',
    messagingSenderId: '169737066289',
    projectId: 'ar-model-f0cfa',
    storageBucket: 'ar-model-f0cfa.firebasestorage.app',
    iosBundleId: 'com.example.playIq',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA7p9DyyZN3WymHa9HoqOtDn16itmU_QTI',
    appId: '1:169737066289:ios:71bd68c9e70a630b8cc210',
    messagingSenderId: '169737066289',
    projectId: 'ar-model-f0cfa',
    storageBucket: 'ar-model-f0cfa.firebasestorage.app',
    iosBundleId: 'com.example.playIq',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyChS9t2ICFqnjRURhAsv3sWNDMRCU-GfCU',
    appId: '1:169737066289:web:fd796ea88c19a88b8cc210',
    messagingSenderId: '169737066289',
    projectId: 'ar-model-f0cfa',
    authDomain: 'ar-model-f0cfa.firebaseapp.com',
    storageBucket: 'ar-model-f0cfa.firebasestorage.app',
  );
}
