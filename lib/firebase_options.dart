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
    apiKey: 'AIzaSyDaq-RfhIumb-78d8ASuHW6fWayITXDPNU',
    appId: '1:534775841991:web:3c72a923965a454fdeeae2',
    messagingSenderId: '534775841991',
    projectId: 'exploring-382816',
    authDomain: 'exploring-382816.firebaseapp.com',
    databaseURL: 'https://exploring-382816-default-rtdb.firebaseio.com',
    storageBucket: 'exploring-382816.appspot.com',
    measurementId: 'G-R78KKN8Y4B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBUz9fYfGDCifnW-hnnpsegJxxrPzZZZgg',
    appId: '1:534775841991:android:ec0587f5674caff2deeae2',
    messagingSenderId: '534775841991',
    projectId: 'exploring-382816',
    databaseURL: 'https://exploring-382816-default-rtdb.firebaseio.com',
    storageBucket: 'exploring-382816.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAy_Y-cWO1FWsmtrFhV1PEw-n4bLDM0Xxk',
    appId: '1:534775841991:ios:67a7108a28fcad13deeae2',
    messagingSenderId: '534775841991',
    projectId: 'exploring-382816',
    databaseURL: 'https://exploring-382816-default-rtdb.firebaseio.com',
    storageBucket: 'exploring-382816.appspot.com',
    androidClientId: '534775841991-nvdvf14cn19476bkvir3hh6l35o9egjb.apps.googleusercontent.com',
    iosClientId: '534775841991-8p6su5m4q8pbfmrek9loom9uau8ktgsr.apps.googleusercontent.com',
    iosBundleId: 'com.example.frontEnd',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAy_Y-cWO1FWsmtrFhV1PEw-n4bLDM0Xxk',
    appId: '1:534775841991:ios:83800b83d4dd23a7deeae2',
    messagingSenderId: '534775841991',
    projectId: 'exploring-382816',
    databaseURL: 'https://exploring-382816-default-rtdb.firebaseio.com',
    storageBucket: 'exploring-382816.appspot.com',
    androidClientId: '534775841991-nvdvf14cn19476bkvir3hh6l35o9egjb.apps.googleusercontent.com',
    iosClientId: '534775841991-m6so81hf73c47gomnseem60a1htfj2cm.apps.googleusercontent.com',
    iosBundleId: 'com.example.frontEnd.RunnerTests',
  );
}