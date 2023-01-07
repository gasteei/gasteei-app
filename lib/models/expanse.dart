class Expanse {
  String month;
  int year;
  double total;
  List<ExpanseDetail> details;

  Expanse({required this.month, required this.year, required this.total, required this.details});
}

class ExpanseDetail {
  String title;
  double value;

  ExpanseDetail({required this.title, required this.value});
}
