// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAgII7Tapf0CCLjcfRWasQEJSjAFY_xocw',
    appId: '1:129345974079:web:072b47e81f6f85a59cad8a',
    messagingSenderId: '129345974079',
    projectId: 'u-learning-20f14',
    authDomain: 'u-learning-20f14.firebaseapp.com',
    storageBucket: 'u-learning-20f14.appspot.com',
    measurementId: 'G-G2FL1CEHDP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBxGswkFsiOSf3KgQ4uYNbs-AxsTf5_KdI',
    appId: '1:129345974079:android:d1f0a0805c4f12429cad8a',
    messagingSenderId: '129345974079',
    projectId: 'u-learning-20f14',
    storageBucket: 'u-learning-20f14.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAFYhgHb-_b3C5ncKlGfGrtIXrXDv9r96A',
    appId: '1:129345974079:ios:dc4251502abc340b9cad8a',
    messagingSenderId: '129345974079',
    projectId: 'u-learning-20f14',
    storageBucket: 'u-learning-20f14.appspot.com',
    androidClientId: '129345974079-iri53f4t6nf6o95biomfb2118gsiqqqf.apps.googleusercontent.com',
    iosClientId: '129345974079-pdj7ot51cg517adegb14uepsv9v4cii3.apps.googleusercontent.com',
    iosBundleId: 'com.example.learningApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAFYhgHb-_b3C5ncKlGfGrtIXrXDv9r96A',
    appId: '1:129345974079:ios:25a111680c5c2a079cad8a',
    messagingSenderId: '129345974079',
    projectId: 'u-learning-20f14',
    storageBucket: 'u-learning-20f14.appspot.com',
    androidClientId: '129345974079-iri53f4t6nf6o95biomfb2118gsiqqqf.apps.googleusercontent.com',
    iosClientId: '129345974079-ibr2o2t6int8gjetnp168cqnnnk5tfmp.apps.googleusercontent.com',
    iosBundleId: 'com.example.learningApp.RunnerTests',
  );
}