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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAdNpmYPKj6WDM7WGYrd63xBxBsYjnFQSw',
    appId: '1:34070893330:web:e5cf11ec42cb4bebb399cb',
    messagingSenderId: '34070893330',
    projectId: 'bookly-app-bb888',
    authDomain: 'bookly-app-bb888.firebaseapp.com',
    storageBucket: 'bookly-app-bb888.appspot.com',
    measurementId: 'G-XY2T21L4J1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCeBFu4p2R_CO0N5buldMAItQelVlr6kVI',
    appId: '1:34070893330:android:e04d4376a15cf2ccb399cb',
    messagingSenderId: '34070893330',
    projectId: 'bookly-app-bb888',
    storageBucket: 'bookly-app-bb888.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA4nle0BH79tXb9sCKoGrFHx7tQPx_VrWA',
    appId: '1:34070893330:ios:f3c6e9d869460e4fb399cb',
    messagingSenderId: '34070893330',
    projectId: 'bookly-app-bb888',
    storageBucket: 'bookly-app-bb888.appspot.com',
    iosBundleId: 'com.example.cleanArchBooklyApp',
  );
}
