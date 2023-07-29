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
    apiKey: 'AIzaSyAqX92HIxkPU7s0xgLatYWnSL7EDN-1i1U',
    appId: '1:811244696693:web:a77fde299f26175b9bb43c',
    messagingSenderId: '811244696693',
    projectId: 'resimob',
    authDomain: 'resimob.firebaseapp.com',
    storageBucket: 'resimob.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZQ_iAXh95D0uFdxFbj8mtdsieNgbYsAc',
    appId: '1:811244696693:android:6adf94ca067f8aaa9bb43c',
    messagingSenderId: '811244696693',
    projectId: 'resimob',
    storageBucket: 'resimob.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkX6uK8V1IDtJ7EHBGMnwHpO-1m8MeGow',
    appId: '1:811244696693:ios:8683d1e3f1737ac49bb43c',
    messagingSenderId: '811244696693',
    projectId: 'resimob',
    storageBucket: 'resimob.appspot.com',
    iosClientId: '811244696693-aodl8frf3i7ade1jkqkp4ngqkp8cu9hp.apps.googleusercontent.com',
    iosBundleId: 'com.example.resimob',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDkX6uK8V1IDtJ7EHBGMnwHpO-1m8MeGow',
    appId: '1:811244696693:ios:25be2458d53238339bb43c',
    messagingSenderId: '811244696693',
    projectId: 'resimob',
    storageBucket: 'resimob.appspot.com',
    iosClientId: '811244696693-1h95rrvg43bsj9fa4ea1sedmct1fsv4h.apps.googleusercontent.com',
    iosBundleId: 'com.example.resimob.RunnerTests',
  );
}
