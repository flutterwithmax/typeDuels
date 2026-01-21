import 'package:flutter/material.dart';
import 'package:monkeytypemobile/core/theme/themes.dart';
import 'package:monkeytypemobile/router/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'sapi',
      debugShowCheckedModeBanner: false,
      routerConfig: router,

      themeMode: ThemeMode.dark,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
