class Expense {
  String month;
  int year;
  double total;
  List<ExpenseDetail> details;

  Expense({required this.month, required this.year, required this.total, required this.details});
}

class ExpenseDetail {
  String title;
  double value;

  ExpenseDetail({required this.title, required this.value});
}
