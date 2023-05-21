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
    apiKey: 'AIzaSyAETLKbzhVAtJWLIdKfes4qrcBmL7U1xkU',
    appId: '1:886471264089:web:7afc431db4cbd649a52e48',
    messagingSenderId: '886471264089',
    projectId: 'sideboard-mtg',
    authDomain: 'sideboard-mtg.firebaseapp.com',
    storageBucket: 'sideboard-mtg.appspot.com',
    measurementId: 'G-0MK8YXSRQF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAzpjyQhSdhGh8d2t3JJpTPP1oTdNe-mKY',
    appId: '1:886471264089:android:d2c8ad6d78b1bec2a52e48',
    messagingSenderId: '886471264089',
    projectId: 'sideboard-mtg',
    storageBucket: 'sideboard-mtg.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDB7Oa5DK7yNqHDyuIcMpjKS8xcLSGDHKI',
    appId: '1:886471264089:ios:a4028abb9e041ee4a52e48',
    messagingSenderId: '886471264089',
    projectId: 'sideboard-mtg',
    storageBucket: 'sideboard-mtg.appspot.com',
    iosClientId: '886471264089-f20p9rah0t01d2n1t009hmt7jndli63p.apps.googleusercontent.com',
    iosBundleId: 'com.patrickwulfe.sideboard',
  );
}
