import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:siakad_itts/src/halaman/biodata.dart';
import 'package:siakad_itts/src/halaman/login_page.dart';
import 'package:siakad_itts/src/settings/settings_controller.dart';
import 'package:siakad_itts/src/settings/settings_view.dart';

import 'halaman/sample_item_details_view.dart';
import 'halaman/halaman_utama.dart';
import 'halaman/splash.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: settingsController,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            restorationScopeId: 'app',
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'), // English, no country code
            ],
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,
            theme: ThemeData(),
            darkTheme: ThemeData.dark(),
            themeMode: settingsController.themeMode,
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case SettingsView.routeName:
                      return SettingsView(controller: settingsController);
                    case SampleItemDetailsView.routeName:
                      return SampleItemDetailsView();
                    case HalamanUtama.routeName:
                      return HalamanUtama();
                    case LoginPage.routeName:
                      return LoginPage();
                    case Biodata.routeName:
                      return Biodata();
                    default:
                      return Splash();
                  }
                },
              );
            },
          );
        });
  }
}
