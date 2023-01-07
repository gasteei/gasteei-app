import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:gasteei/icons/custom_icons.dart';
import 'package:gasteei/repositories/expanse_repository.dart';
import 'package:gasteei/widgets/home/card_month_view.dart';
import 'package:intl/intl.dart';

import '../models/expanse.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> locales = <String>["pt_BR", "en_US", "ja_JP", "en_GB"];
  String currency = "pt_BR";
  bool _canSee = false;
  int index = 0;

  void _onPressedIcon() {
    setState(() {
      _canSee = !_canSee;
    });
  }

  void _onChangeLocale() {
    index++;

    if (index == 4) {
      setState(() {
        index = 0;
      });
    }

    setState(() {
      currency = locales[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Row(
              children: [
                IconButton(
                  icon: _canSee ? const Icon(CustomIcons.eye) : const Icon(CustomIcons.eyeSlash),
                  onPressed: _onPressedIcon,
                  color: Theme.of(context).colorScheme.secondary,
                  iconSize: 19,
                ),
                IconButton(
                  icon: const Icon(CustomIcons.currency),
                  onPressed: _onChangeLocale,
                  color: Theme.of(context).colorScheme.secondary,
                  iconSize: 19,
                ),
                IconButton(
                  icon: const Icon(CustomIcons.notification),
                  onPressed: () {},
                  color: Theme.of(context).colorScheme.secondary,
                  iconSize: 19,
                ),
              ],
            ),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            'Home',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        toolbarHeight: 202,
        titleSpacing: 0,
        elevation: 0,
      ),
      body: ListView(
        children: [
          const Divider(),
          const Gap(35),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Container(
              margin: const EdgeInsets.only(left: 45),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Gastos",
                        style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 30),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 35),
                child: Row(
                  children: generateMonthCardList(ExpanseRepository.expanses, currency).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  generateMonthCardList(List<Expanse> expanses, String locale) {
    return expanses.map((expanse) => expanseItem(expanse, locale));
  }

  Widget expanseItem(Expanse expanse, String locale) {
    NumberFormat formatter = NumberFormat.simpleCurrency(locale: locale, decimalDigits: 2);

    return CardMonthView(
        expanse: formatter.format(expanse.total),
        headline2: "Último gasto",
        headline3: expanse.details.last.title,
        canSee: _canSee,
        titleFirstText: "Gastos",
        titleSecondText: expanse.month);
  }
}
