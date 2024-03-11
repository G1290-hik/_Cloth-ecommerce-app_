//flutter/external packages
import 'package:cloth_ecommerce_app/src/Theme.dart';
import 'package:cloth_ecommerce_app/src/views/forgotpassword_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//local packages
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';
import 'views/screen.dart';
import 'views/search_view.dart';

class ClothEcommerceApp extends StatelessWidget {
  const ClothEcommerceApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
          ],
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: customTheme,
          darkTheme: customDarkTheme,
          themeMode: settingsController.themeMode,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case HomeScreen.routeName:
                    return const HomeScreen();
                  case SearchView.routeName:
                    return const SearchView();
                  case LoginScreen.routeName: // Route for LoginPage
                    return const LoginScreen();
                  case SignUpScreen.routeName: // Route for SignupPage
                    return const SignUpScreen();
                  default: // Redirect to login page if not authenticated
                    return const ForgorView();

                }
              },
            );
          },
        );
      },
    );
  }
}
