import 'package:dog_breeds/lib/lib/network/NetworkClient.dart';
import 'package:get_it/get_it.dart';

import 'AppRoute.dart';

GetIt? locator;

class ServiceLocator {
  static GetIt? getInstance() {
    if (locator == null) {
      locator = GetIt.instance;
      setupLocator();
    }
    return locator;
  }

  static setupLocator() {
    const baseUrl = 'https://dog.ceo/api';
    locator!.registerLazySingleton(() => AppRoute());
    locator!.registerLazySingleton(() => NetworkClient(baseUrl));
  }
}
