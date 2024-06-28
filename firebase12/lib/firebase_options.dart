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
    apiKey: 'AIzaSyAwgpW2FGlrxWMwegXdfoBF-pyq2g1NG0Y',
    appId: '1:90268331681:web:e968c0297d36bf48c90ae0',
    messagingSenderId: '90268331681',
    projectId: 'deneme12-594d6',
    authDomain: 'deneme12-594d6.firebaseapp.com',
    storageBucket: 'deneme12-594d6.appspot.com',
    measurementId: 'G-ZTFFLDBCPC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASICMljI16p4rJE6mn0FUxRVNg8iWP8AM',
    appId: '1:90268331681:android:aab333784a391310c90ae0',
    messagingSenderId: '90268331681',
    projectId: 'deneme12-594d6',
    storageBucket: 'deneme12-594d6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAHKWQGOa56rDv9ahYFHxZBhibymlqLvdA',
    appId: '1:90268331681:ios:a24b049eb2f3b78bc90ae0',
    messagingSenderId: '90268331681',
    projectId: 'deneme12-594d6',
    storageBucket: 'deneme12-594d6.appspot.com',
    iosBundleId: 'com.example.firebase12',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAHKWQGOa56rDv9ahYFHxZBhibymlqLvdA',
    appId: '1:90268331681:ios:a24b049eb2f3b78bc90ae0',
    messagingSenderId: '90268331681',
    projectId: 'deneme12-594d6',
    storageBucket: 'deneme12-594d6.appspot.com',
    iosBundleId: 'com.example.firebase12',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAwgpW2FGlrxWMwegXdfoBF-pyq2g1NG0Y',
    appId: '1:90268331681:web:7e8968bab1a92b81c90ae0',
    messagingSenderId: '90268331681',
    projectId: 'deneme12-594d6',
    authDomain: 'deneme12-594d6.firebaseapp.com',
    storageBucket: 'deneme12-594d6.appspot.com',
    measurementId: 'G-V23NKVCTMG',
  );
}