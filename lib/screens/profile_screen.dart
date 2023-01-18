import 'package:flutter/material.dart';
import 'package:gasteei/core/app_state.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      body: Center(
        child: SwitchListTile(
          title: const Text("Theme"),
          secondary: Icon(appState.getDarkTheme ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
          onChanged: (bool value) {
            setState(() {
              appState.setDarkTheme = value;
            });
          },
          value: appState.getDarkTheme,
        ),
      ),
    );
  }
}
