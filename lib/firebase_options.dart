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
    apiKey: 'AIzaSyAR37bk__EtfGWtkbDvMCTnZRTmqHMli88',
    appId: '1:467198558566:web:a5758029b23aea5a77c8a7',
    messagingSenderId: '467198558566',
    projectId: 'niruta-hot-project',
    authDomain: 'niruta-hot-project.firebaseapp.com',
    storageBucket: 'niruta-hot-project.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4hemMQ26GmV6ztA3-C-ZsLowlUJhaBkk',
    appId: '1:467198558566:android:b17f672364bb6bc377c8a7',
    messagingSenderId: '467198558566',
    projectId: 'niruta-hot-project',
    storageBucket: 'niruta-hot-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBg0L3vKS26rNBnEI9pYHgzmsv7Xn1yR0s',
    appId: '1:467198558566:ios:7da6b92ea364cb1277c8a7',
    messagingSenderId: '467198558566',
    projectId: 'niruta-hot-project',
    storageBucket: 'niruta-hot-project.appspot.com',
    iosBundleId: 'com.example.attendu',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBg0L3vKS26rNBnEI9pYHgzmsv7Xn1yR0s',
    appId: '1:467198558566:ios:21657413e9cf78a877c8a7',
    messagingSenderId: '467198558566',
    projectId: 'niruta-hot-project',
    storageBucket: 'niruta-hot-project.appspot.com',
    iosBundleId: 'com.example.attendu.RunnerTests',
  );
}
