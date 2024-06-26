// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
// ignore: depend_on_referenced_packages
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
    apiKey: 'AIzaSyD_E2IHuY_oKo3n-ckB4sa42ElVL7uCN64',
    appId: '1:984482467740:web:acd413011a9b2dbcc88259',
    messagingSenderId: '984482467740',
    projectId: 'flutterapp-f822b',
    authDomain: 'flutterapp-f822b.firebaseapp.com',
    storageBucket: 'flutterapp-f822b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSz-2CrHoHBKZsT5CtJ1HC7u3PSx3GjBw',
    appId: '1:984482467740:android:c97ce9fca68f833fc88259',
    messagingSenderId: '984482467740',
    projectId: 'flutterapp-f822b',
    storageBucket: 'flutterapp-f822b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDeyNuwWq94FJlsnTz8qj66rQcoOfrlLb8',
    appId: '1:984482467740:ios:6b51c5173072733cc88259',
    messagingSenderId: '984482467740',
    projectId: 'flutterapp-f822b',
    storageBucket: 'flutterapp-f822b.appspot.com',
    iosBundleId: 'com.example.flutterApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDeyNuwWq94FJlsnTz8qj66rQcoOfrlLb8',
    appId: '1:984482467740:ios:f3243757c8e85dd5c88259',
    messagingSenderId: '984482467740',
    projectId: 'flutterapp-f822b',
    storageBucket: 'flutterapp-f822b.appspot.com',
    iosBundleId: 'com.example.flutterApp.RunnerTests',
  );
}
