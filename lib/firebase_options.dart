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
    apiKey: 'AIzaSyDko0L1P_UXLGiPUHqQQxQdm7q900aittU',
    appId: '1:743441048175:web:1c0fd9324875c0690f639a',
    messagingSenderId: '743441048175',
    projectId: 'application10-e77b0',
    authDomain: 'application10-e77b0.firebaseapp.com',
    storageBucket: 'application10-e77b0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAl6v6PduQELh-Jl4uxIe4ATudS5RxxDQQ',
    appId: '1:743441048175:android:e8a2058a31576a560f639a',
    messagingSenderId: '743441048175',
    projectId: 'application10-e77b0',
    storageBucket: 'application10-e77b0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBT3OU3g_zMgJq1EzgmGwLkmPAX0ie5Wpk',
    appId: '1:743441048175:ios:0ad3caf51959db8a0f639a',
    messagingSenderId: '743441048175',
    projectId: 'application10-e77b0',
    storageBucket: 'application10-e77b0.appspot.com',
    iosBundleId: 'com.example.app10',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBT3OU3g_zMgJq1EzgmGwLkmPAX0ie5Wpk',
    appId: '1:743441048175:ios:c6b85beb8fbad5050f639a',
    messagingSenderId: '743441048175',
    projectId: 'application10-e77b0',
    storageBucket: 'application10-e77b0.appspot.com',
    iosBundleId: 'com.example.app10.RunnerTests',
  );
}
