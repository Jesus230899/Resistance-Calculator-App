import 'package:resistance_calculator_app/theme/theme.dart';

import 'core/locator.dart';
import 'core/providers.dart';
import 'core/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/home/home_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// This project is maked with Flutter 2.5.3 in stable channel
// The architecture is MVVM;
// Created by Jesus Alberto Aguilar Martinez

void main() async {
  await LocatorInjector.setupLocator();
  runApp(const MainApplication());
}

// ignore: must_be_immutable
class MainApplication extends StatelessWidget {
  const MainApplication({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderInjector.providers,
      child: MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('es', ''), // Spanish, no country code
        ],
        debugShowCheckedModeBanner: false,
        theme: theme,
        navigatorKey: locator<NavigatorService>().navigatorKey,
        home: HomeView(),
      ),
    );
  }
}
