import 'package:dog_breeds/lib/lib/App.dart';
import 'package:dog_breeds/lib/lib/config/ServiceLocator.dart';
import 'package:dog_breeds/lib/lib/utils/SharedObjects.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  locator = ServiceLocator.getInstance();
  SharedObjects.prefs = await CachedSharedPreferences.getInstance();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(const App());
}
