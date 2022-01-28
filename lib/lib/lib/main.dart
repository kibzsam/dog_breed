import 'package:dog_breeds/lib/lib/utils/SharedObjects.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'App.dart';
import 'config/ServiceLocator.dart';

class SimpleBlocObserver extends BlocObserver {
  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = SimpleBlocObserver();
    locator = ServiceLocator.getInstance();
    SharedObjects.prefs = await CachedSharedPreferences.getInstance();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]).then((value) {
      runApp(const App());
    });
  }
}
