// lib/firebase_options.dart
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'No Web options have been provided.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'MacOS is not supported.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'Windows is not supported.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'Linux is not supported.',
        );
      default:
        throw UnsupportedError(
          'Unknown platform $defaultTargetPlatform',
        );
    }
  }

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AlzaSyBzZWm8n4JCt23UMBnh5SxdGD8ypnXwooA',
    appId: '1:531198784623:ios:c309bc35794f3406ef499a',
    messagingSenderId: '531198784623',
    projectId: 'orangepotion-89085',
    storageBucket: 'orangepotion-89085.firebasestorage.app',
    iosBundleId: 'com.example.orangePotion',
    // GoogleService-Info.plist에서 가져온 값들 사용
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AlzaSyBzZWm8n4JCt23UMBnh5SxdGD8ypnXwooA',
    appId: '1:531198784623:ios:c309bc35794f3406ef499a',
    messagingSenderId: '531198784623',
    projectId: 'orangepotion-89085',
    storageBucket: 'orangepotion-89085.firebasestorage.app',
  );
}