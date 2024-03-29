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
    apiKey: 'AIzaSyCxEgKjSNV5h9xCfvIs7CmcSoyPZj_Ls2k',
    appId: '1:387723902219:web:abe7e2880320880956f60e',
    messagingSenderId: '387723902219',
    projectId: 'koiot-7ef13',
    authDomain: 'koiot-7ef13.firebaseapp.com',
    databaseURL: 'https://koiot-7ef13-default-rtdb.firebaseio.com',
    storageBucket: 'koiot-7ef13.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBk6r15Sh-HiOADJqviGvlQgY3qyUOvMJ4',
    appId: '1:387723902219:android:a797bd8255cced7b56f60e',
    messagingSenderId: '387723902219',
    projectId: 'koiot-7ef13',
    databaseURL: 'https://koiot-7ef13-default-rtdb.firebaseio.com',
    storageBucket: 'koiot-7ef13.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDMOsARBxU57eKGSXgeQ1DLGyaBULfTEnY',
    appId: '1:387723902219:ios:b0e32291cfb0475a56f60e',
    messagingSenderId: '387723902219',
    projectId: 'koiot-7ef13',
    databaseURL: 'https://koiot-7ef13-default-rtdb.firebaseio.com',
    storageBucket: 'koiot-7ef13.appspot.com',
    iosBundleId: 'com.example.aplikasikoi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDMOsARBxU57eKGSXgeQ1DLGyaBULfTEnY',
    appId: '1:387723902219:ios:80ac73348cc8824756f60e',
    messagingSenderId: '387723902219',
    projectId: 'koiot-7ef13',
    databaseURL: 'https://koiot-7ef13-default-rtdb.firebaseio.com',
    storageBucket: 'koiot-7ef13.appspot.com',
    iosBundleId: 'com.example.aplikasikoi.RunnerTests',
  );
}
