import 'package:motshelo_cash/services/auth.dart';
import 'package:motshelo_cash/services/database.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setuplocator() {

   locator.registerLazySingleton(() => FirestoreService());
   
}

