
import 'package:get_it/get_it.dart';

import 'model/app_db.dart';

GetIt locator = GetIt.instance;
void setup() {
  locator.registerLazySingleton(() => AppDb());
}
