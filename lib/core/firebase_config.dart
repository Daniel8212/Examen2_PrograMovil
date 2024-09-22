import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return const FirebaseOptions(
        apiKey: 'TU_API_KEY',
        appId: 'TU_APP_ID',
        messagingSenderId: 'TU_MESSAGING_SENDER_ID',
        projectId: 'TU_PROJECT_ID',
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return const FirebaseOptions(
        apiKey: 'TU_API_KEY',
        appId: 'TU_APP_ID',
        messagingSenderId: 'TU_MESSAGING_SENDER_ID',
        projectId: 'TU_PROJECT_ID',
        iosBundleId: 'TU_BUNDLE_ID',
      );
    } else {
      throw UnsupportedError('Plataforma no soportada');
    }
  }
}
