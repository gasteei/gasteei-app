import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gasteei/icons/custom_icons.dart';
import 'package:gasteei/repositories/expanse_repository.dart';
import 'package:gasteei/widgets/expanses/list_row_expanse.dart';
import 'package:intl/intl.dart';

import '../models/expanse.dart';

class ExpansesScreen extends StatefulWidget {
  const ExpansesScreen({super.key});

  @override
  State<ExpansesScreen> createState() => _ExpansesScreenState();
}

class _ExpansesScreenState extends State<ExpansesScreen> {
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
                  icon: const Icon(CustomIcons.eye),
                  onPressed: () {},
                  color: Theme.of(context).colorScheme.secondary,
                  iconSize: 19,
                ),
                IconButton(
                  icon: const Icon(CustomIcons.currency),
                  onPressed: () {},
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
            'Gastos',
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
          const Gap(37),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(children: generateListRowExpanse(ExpanseRepository.expanses).toList()),
              )
            ],
          )
        ],
      ),
    );
  }

  generateListRowExpanse(List<Expanse> expanses) {
    return expanses.map((expanse) => expanseItem(expanse));
  }

  Widget expanseItem(Expanse expanse) {
    NumberFormat formatter = NumberFormat.simpleCurrency(locale: "pt_BR", decimalDigits: 2);

    return ListRowExpanse(
      month: expanse.month,
      total: formatter.format(expanse.total),
      details: expanse.details,
    );
  }
}
