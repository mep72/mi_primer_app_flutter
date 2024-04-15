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
    apiKey: 'AIzaSyCFrd8DYt52KN0KLE4VVcHU4RCNqJQBdAQ',
    appId: '1:514437046472:web:44b68cd4ab10836ec205fd',
    messagingSenderId: '514437046472',
    projectId: 'mi-primer-app-flutter',
    authDomain: 'mi-primer-app-flutter.firebaseapp.com',
    storageBucket: 'mi-primer-app-flutter.appspot.com',
    measurementId: 'G-1W1WXLCYWW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_aYlnYA0x3uHGgNAqFl11NG1YjufELPI',
    appId: '1:514437046472:android:2ceda4f1015416c5c205fd',
    messagingSenderId: '514437046472',
    projectId: 'mi-primer-app-flutter',
    storageBucket: 'mi-primer-app-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDu8r7b9-dA7xAKAorJdIsUi4sy7SChbdA',
    appId: '1:514437046472:ios:3f74d539ef2ca5e6c205fd',
    messagingSenderId: '514437046472',
    projectId: 'mi-primer-app-flutter',
    storageBucket: 'mi-primer-app-flutter.appspot.com',
    iosBundleId: 'com.example.miPrimerAplicacion',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDu8r7b9-dA7xAKAorJdIsUi4sy7SChbdA',
    appId: '1:514437046472:ios:22e0b46d6ddeeb8cc205fd',
    messagingSenderId: '514437046472',
    projectId: 'mi-primer-app-flutter',
    storageBucket: 'mi-primer-app-flutter.appspot.com',
    iosBundleId: 'com.example.miPrimerAplicacion.RunnerTests',
  );
}
