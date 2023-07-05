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
    apiKey: 'AIzaSyByZob-zX64jVKNHIpIm7CiE-YnvsD6_RI',
    appId: '1:150158179856:web:8c922dbe43cce7797f9495',
    messagingSenderId: '150158179856',
    projectId: 'musify-app-b5e87',
    authDomain: 'musify-app-b5e87.firebaseapp.com',
    storageBucket: 'musify-app-b5e87.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2t4Z0nhyaI4-MNK7FjDrsuqIJ_SDENHA',
    appId: '1:150158179856:android:4619aaa47c9cd9eb7f9495',
    messagingSenderId: '150158179856',
    projectId: 'musify-app-b5e87',
    storageBucket: 'musify-app-b5e87.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDTtmE2lKnG06cC3nvToEFrXPcMC6fnFZk',
    appId: '1:150158179856:ios:71b806be9081e6367f9495',
    messagingSenderId: '150158179856',
    projectId: 'musify-app-b5e87',
    storageBucket: 'musify-app-b5e87.appspot.com',
    iosClientId: '150158179856-t8rg3p2hsn5kt7lf091rf8kh7i347upa.apps.googleusercontent.com',
    iosBundleId: 'com.example.musifyApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDTtmE2lKnG06cC3nvToEFrXPcMC6fnFZk',
    appId: '1:150158179856:ios:dfead4c8bf4db5647f9495',
    messagingSenderId: '150158179856',
    projectId: 'musify-app-b5e87',
    storageBucket: 'musify-app-b5e87.appspot.com',
    iosClientId: '150158179856-rcd4sh0grjqm5v39usaor94p8fc7dstr.apps.googleusercontent.com',
    iosBundleId: 'com.example.musifyApp.RunnerTests',
  );
}