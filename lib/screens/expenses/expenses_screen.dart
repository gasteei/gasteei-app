import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:gasteei/blocs/expense_bloc.dart';
import 'package:gasteei/blocs/expense_state.dart';
import 'package:gasteei/icons/custom_icons.dart';
import 'package:gasteei/screens/expenses/widgets/list_row_expense.dart';
import 'package:intl/intl.dart';

import '../../blocs/expense_event.dart';
import '../../models/expense.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  late final ExpenseBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ExpenseBloc();
    bloc.add(LoadExpenseEvent());
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
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
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is ExpenseInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ExpenseSuccessState) {
            final expenseList = state.expenses;
            return ListView(
              children: [
                const Divider(),
                const Gap(37),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(children: generateListRowExpense(expenseList).toList()),
                    )
                  ],
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  generateListRowExpense(List<Expense> expenses) {
    return expenses.map((expense) => expenseItem(expense));
  }

  Widget expenseItem(Expense expense) {
    NumberFormat formatter = NumberFormat.simpleCurrency(locale: "pt_BR", decimalDigits: 2);

    return ListRowExpense(
      month: expense.month,
      total: formatter.format(expense.total),
      details: expense.details,
    );
  }
}
