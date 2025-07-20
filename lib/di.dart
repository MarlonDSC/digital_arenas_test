import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:inmo_mobile/core/constants/api.dart';
import 'package:inmo_mobile/core/errors/bloc/message/message_bloc.dart';
import 'package:inmo_mobile/core/errors/bloc/modal/modal_bloc.dart';
import 'package:inmo_mobile/core/errors/bloc/timer/timer_bloc.dart';
import 'package:inmo_mobile/core/router/config_router.dart';
import 'package:inmo_mobile/core/utils/key_interceptor.dart';

final sl = GetIt.instance;

void setupLocator(String environment, String initialRoute) {
  if (environment == 'prod') {
    sl.registerSingleton(const FlutterSecureStorage());
    var dio = Dio(BaseOptions(baseUrl: kApiUrl));
    dio.interceptors.add(KeyInterceptor(kApiKey));

    // Ds
    // Repos

    // UseCases
  }

  // Blocs
  sl.registerFactory<MessageBloc>(() => MessageBloc());
  sl.registerFactory<ModalBloc>(() => ModalBloc());
  sl.registerFactory<TimerBloc>(() => TimerBloc());
  // Router
  sl.registerSingleton<ConfigRouter>(
    ConfigRouter(initialLocation: initialRoute),
  );
}
