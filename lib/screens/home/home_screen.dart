import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gasteei/core/app_state.dart';
import 'package:gasteei/icons/custom_icons.dart';
import 'package:gasteei/main.dart';
import 'package:gasteei/screens/home/widgets/expenses.dart';
import 'package:gasteei/screens/home/widgets/planning.dart';
import 'package:provider/provider.dart';

import 'widgets/revenues.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final providerState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Row(
              children: [
                IconButton(
                  icon: providerState.canSee ? const Icon(CustomIcons.eye) : const Icon(CustomIcons.eyeSlash),
                  onPressed: providerState.switchView,
                  color: Theme.of(context).colorScheme.secondary,
                  iconSize: 23,
                ),
                IconButton(
                  icon: const Icon(CustomIcons.currency),
                  onPressed: () {},
                  color: Theme.of(context).colorScheme.secondary,
                  iconSize: 23,
                ),
                IconButton(
                  icon: const Icon(CustomIcons.notification),
                  onPressed: () {},
                  color: Theme.of(context).colorScheme.secondary,
                  iconSize: 23,
                ),
              ],
            ),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            'Olá,\nBianca',
            style: Theme.of(context).textTheme.headline1?.copyWith(height: 1),
          ),
        ),
        toolbarHeight: 202,
        titleSpacing: 0,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
            
            children: <Widget>[
              Column(
                children: [
                  const Gap(35),
                  Revenues(canSee: providerState.canSee),
                  const Gap(50),
                  Expenses(canSee: providerState.canSee),
                  const Gap(50),
                  const Planning()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
