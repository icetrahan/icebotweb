import 'package:flutter/material.dart';
import 'package:icebotweb/home.dart';
import 'package:icebotweb/login.dart';
import "package:icebotweb/globals.dart" as globals;
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'firebase_options.dart';

void main() async {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  globals.getStatsContent();
  globals.getWarnsContent();
  setPathUrlStrategy();

  runApp(
    MaterialApp.router(
      routerConfig: globals.router,
    ),
  );
}
