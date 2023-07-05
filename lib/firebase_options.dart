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
    apiKey: 'AIzaSyDL7C1ZXboiVDrLqvsy124a0sDPtIAX4Ns',
    appId: '1:533455184556:web:5ad5a6e59dcd181c0d3509',
    messagingSenderId: '533455184556',
    projectId: 'todo-70b34',
    authDomain: 'todo-70b34.firebaseapp.com',
    storageBucket: 'todo-70b34.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-L8fGGHo1LqgQwkBFt1XAmCDp91tabRo',
    appId: '1:533455184556:android:ee62efea4ffc30170d3509',
    messagingSenderId: '533455184556',
    projectId: 'todo-70b34',
    storageBucket: 'todo-70b34.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA38xe8pJcrNYQLb6OvG2E6gUBjpH6V2ls',
    appId: '1:533455184556:ios:2c52e6157cc751620d3509',
    messagingSenderId: '533455184556',
    projectId: 'todo-70b34',
    storageBucket: 'todo-70b34.appspot.com',
    iosClientId: '533455184556-7akdghrroihrkddfsfgpagju4sdjl5eu.apps.googleusercontent.com',
    iosBundleId: 'com.flutter.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA38xe8pJcrNYQLb6OvG2E6gUBjpH6V2ls',
    appId: '1:533455184556:ios:2c52e6157cc751620d3509',
    messagingSenderId: '533455184556',
    projectId: 'todo-70b34',
    storageBucket: 'todo-70b34.appspot.com',
    iosClientId: '533455184556-7akdghrroihrkddfsfgpagju4sdjl5eu.apps.googleusercontent.com',
    iosBundleId: 'com.flutter.todoApp',
  );
}