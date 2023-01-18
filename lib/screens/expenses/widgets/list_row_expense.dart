import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gasteei/models/expense.dart';
import 'package:intl/intl.dart';

class ListRowExpense extends StatelessWidget {
  final String month;
  final String total;
  final List<ExpenseDetail> details;

  const ListRowExpense({super.key, required this.month, required this.total, required this.details});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Text(month.substring(0, 3), style: Theme.of(context).textTheme.headline2?.copyWith(color: const Color(0xFFAFAFAF))),
            ),
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(horizontal: 15),
                    title: Text(total, style: Theme.of(context).textTheme.headline2?.copyWith(color: Colors.white)),
                    children: generateListRowExpenseDetails(details, context).toList()),
              ),
            ),
          ],
        ),
      ],
    );
  }

  generateListRowExpenseDetails(List<ExpenseDetail> expenseDetails, BuildContext context) {
    return expenseDetails.map((detail) => expenseItemDetail(detail, context));
  }

  Widget expenseItemDetail(ExpenseDetail detail, context) {
    NumberFormat formatter = NumberFormat.simpleCurrency(locale: "pt_BR", decimalDigits: 2);

    return Container(
      padding: const EdgeInsets.only(right: 30, bottom: 16, left: 16),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                detail.title,
                style: Theme.of(context).textTheme.headline4,
              ),
              const Spacer(),
              Text(formatter.format(detail.value), style: Theme.of(context).textTheme.headline4?.copyWith(fontWeight: FontWeight.w400)),
            ],
          ),
        ],
      ),
    );
  }
}
