import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gasteei/models/expense.dart';
import 'package:gasteei/repositories/expense_repository.dart';
import 'package:gasteei/screens/home/widgets/card_month_view.dart';
import 'package:intl/intl.dart';

class Expenses extends StatefulWidget {
  final bool canSee;

  const Expenses({super.key, required this.canSee});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  var expenseRepository = ExpenseRepository();
  List<Expense> expenses = [];

  @override
  void initState() {
    super.initState();
    expenses = expenseRepository.loadExpenses();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              const Gap(10),
              Text("Gastos", style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 30)),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: const CircleAvatar(
                  radius: 13,
                  child: Icon(Icons.add_rounded, size: 20),
                ),
              ),
              const Gap(30),
            ],
          ),
        ),
        CarouselSlider.builder(
          itemCount: expenses.length,
          options: CarouselOptions(
            height: 200,
            initialPage: 0,
          ),
          itemBuilder: (context, index, realIndex) {
            final expenseIndex = expenses[index];

            return expenseItem(expenseIndex, "pt_BR", widget.canSee, false);
          },
        )
      ],
    );
  }

  Widget expenseItem(Expense expense, String locale, bool canSee, bool isActualMonth) {
    NumberFormat formatter = NumberFormat.simpleCurrency(locale: locale, decimalDigits: 2);

    return CardMonthView(
        value: formatter.format(expense.total),
        headline2: "Último gasto",
        detailTile: expense.details.last.title,
        canSee: canSee,
        month: expense.month,
        isActualMonth: isActualMonth);
  }
}
