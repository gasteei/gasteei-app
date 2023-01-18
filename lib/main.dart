import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gasteei/core/app_state.dart';
import 'package:gasteei/screens/setting_view_screen.dart';
import 'package:gasteei/themes/theme_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppState appState = AppState();

  void getCurrentAppTheme() async {
    appState.setDarkTheme = await appState.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppState()),
      ],
      child: Consumer<AppState>(builder: (context, appState, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: Styles.themeData(appState.getDarkTheme, context),
          home: const SettingViewScreen(),
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
