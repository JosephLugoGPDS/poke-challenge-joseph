import 'package:app/core/extension/context.dart';
import 'package:app/core/extension/theme_data_extension.dart';
import 'package:app/core/navigation/router.dart';
import 'package:app/core/util/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late GoRouter _router;

  @override
  void initState() {
    _router = getRouter();
    ScreenUtil.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (context) => context.l10n.appName,
      theme: ThemeDataExtension.darkTheme,
      darkTheme: ThemeDataExtension.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (_, child) {
        child = MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
        return child;
      },
    );
  }
}
