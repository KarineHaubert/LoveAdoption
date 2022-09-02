import 'package:get_it/get_it.dart';
import 'package:loveadoption/Services/Uploadfotos/firebase_uploadFotos_service.dart';
import 'package:loveadoption/Services/publicacao/publicacao_service.dart';
import 'package:loveadoption/Services/user/user_service.dart';

final instance = GetIt.instance;

void initServices() {
  instance.registerLazySingleton(() => CadastroPetService());
  instance.registerLazySingleton(() => CloudStorageService());
  instance.registerLazySingleton(() => UserService());
}
