import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/core/config/theme/theme.dart';
import 'package:flutter_riverpod_base/src/feature/settings/provider/theme_provider.dart';
import 'package:flutter_riverpod_base/src/utils/router.dart';

import '../color_schemes.g.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeState = ref.watch(themeProvider);
    return MaterialApp.router(
      // theme: Themes.lightTheme(context),
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      // darkTheme: Themes.darkTheme(context),
      themeMode: themeModeState,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
const mainColors = [
  Color(0xFF0054D7), // Primary color from lightColorScheme
  Color(0xFFB3C5FF), // Primary color from darkColorScheme
  Color.fromRGBO(36, 107, 253, 1), // primaryBlue from static colors
];
