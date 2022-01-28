import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'lib/App.dart';
import 'lib/utils/SharedObjects.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedObjects.prefs = await CachedSharedPreferences.getInstance();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(
    const App(),
  );
}
