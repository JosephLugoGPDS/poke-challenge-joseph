import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/app/di.dart' as di;

String cutLogLength(String log) {
  if (log.length > 500) {
    return log.substring(0, 500);
  }
  return log;
}

/// The `bootstrap` function is called in the `main.dart` file to initialize the app.
/// The `bootstrap` function is responsible for initializing the app and setting up the environment.
///
/// Is responsible load env (development, staging, production), initialize Firebase, initialize the client http, initialize user credentials, initialize the app, initialize the settlement days chart, initialize the feature categories, and setup the config.
///
///
/// `bootstrap` es una función que se llama en el archivo `main.dart` para inicializar la aplicación.
/// `bootstrap` es responsable de inicializar la aplicación y configurar el entorno.
///
/// Es responsable de cargar el entorno (desarrollo, preparación, producción), inicializar Firebase, inicializar el cliente http, inicializar las credenciales del usuario, inicializar la aplicación, inicializar el gráfico de días de liquidación, inicializar las categorías de características y configurar la configuración.

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('>>>>>${bloc.runtimeType} ${cutLogLength(change.toString())}',
        name: 'on change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('#### ${bloc.runtimeType} $error $stackTrace ####', name: 'on error');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Run Zoned guard
    await di.init();
    await dotenv.load();
    _initializeGoogleFonts();
    runApp(await builder());
    Bloc.observer = AppBlocObserver();
  }, (error, StackTrace stack) => FlutterError(error.toString()));
}

void _initializeGoogleFonts() {
  GoogleFonts.config.allowRuntimeFetching = false;

  LicenseRegistry.addLicense(
    () async* {
      final license = await rootBundle.loadString('google_fonts/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    },
  );
}
