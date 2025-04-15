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
    apiKey: 'AIzaSyDIHTVA4BHzDnoZG_NxUapcaRTG49uFjgQ',
    appId: '1:362792071953:web:afb3e5e695c0d5a30f52b0',
    messagingSenderId: '362792071953',
    projectId: 'e-shop-ddd35',
    authDomain: 'e-shop-ddd35.firebaseapp.com',
    storageBucket: 'e-shop-ddd35.firebasestorage.app',
    measurementId: 'G-HFHCPK1J4K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAcozhgE6lAKXTMmEG5G9tvS4xSnSlEq78',
    appId: '1:362792071953:android:114f33e58ffa7ac40f52b0',
    messagingSenderId: '362792071953',
    projectId: 'e-shop-ddd35',
    storageBucket: 'e-shop-ddd35.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC09stBraDAGd6qiwSrAuLX0qRp35Rnhj0',
    appId: '1:362792071953:ios:8bf7d35f6caae2cc0f52b0',
    messagingSenderId: '362792071953',
    projectId: 'e-shop-ddd35',
    storageBucket: 'e-shop-ddd35.firebasestorage.app',
    iosBundleId: 'com.example.eshop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC09stBraDAGd6qiwSrAuLX0qRp35Rnhj0',
    appId: '1:362792071953:ios:8bf7d35f6caae2cc0f52b0',
    messagingSenderId: '362792071953',
    projectId: 'e-shop-ddd35',
    storageBucket: 'e-shop-ddd35.firebasestorage.app',
    iosBundleId: 'com.example.eshop',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDIHTVA4BHzDnoZG_NxUapcaRTG49uFjgQ',
    appId: '1:362792071953:web:225862bfe15e32b70f52b0',
    messagingSenderId: '362792071953',
    projectId: 'e-shop-ddd35',
    authDomain: 'e-shop-ddd35.firebaseapp.com',
    storageBucket: 'e-shop-ddd35.firebasestorage.app',
    measurementId: 'G-QH4DW2D8Z0',
  );
}
