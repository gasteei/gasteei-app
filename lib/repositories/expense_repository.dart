import 'package:gasteei/models/expense.dart';

class ExpenseRepository {
  final List<Expense> _expenses = [];

  List<Expense> loadExpenses() {
    _expenses.addAll([
      Expense(month: "Janeiro", year: 2022, total: 2000.00, details: <ExpenseDetail>[
        ExpenseDetail(title: "NuBank", value: 100.00),
        ExpenseDetail(title: "Aluguel", value: 1700.00),
        ExpenseDetail(title: "Apartamento", value: 1100.00),
      ]),
      Expense(month: "Fevereiro", year: 2022, total: 3000.00, details: <ExpenseDetail>[
        ExpenseDetail(title: "Aluguel", value: 1700.00),
        ExpenseDetail(title: "Apartamento", value: 1100.00),
        ExpenseDetail(title: "NuBank", value: 100.00),
      ]),
      Expense(month: "Março", year: 2022, total: 5000.00, details: <ExpenseDetail>[
        ExpenseDetail(title: "NuBank", value: 100.00),
        ExpenseDetail(title: "Apartamento", value: 1100.00),
        ExpenseDetail(title: "Aluguel", value: 1700.00),
      ]),
      Expense(month: "Abril", year: 2022, total: 6000.00, details: <ExpenseDetail>[
        ExpenseDetail(title: "NuBank", value: 100.00),
        ExpenseDetail(title: "Apartamento", value: 1100.00),
        ExpenseDetail(title: "Aluguel", value: 1700.00),
      ]),
      Expense(month: "Maio", year: 2022, total: 1000.00, details: <ExpenseDetail>[
        ExpenseDetail(title: "NuBank", value: 100.00),
        ExpenseDetail(title: "Apartamento", value: 1100.00),
        ExpenseDetail(title: "Aluguel", value: 1700.00),
      ]),
      Expense(month: "Junho", year: 2022, total: 100.00, details: <ExpenseDetail>[
        ExpenseDetail(title: "NuBank", value: 100.00),
        ExpenseDetail(title: "Apartamento", value: 1100.00),
        ExpenseDetail(title: "Aluguel", value: 1700.00),
      ]),
      Expense(month: "Julho", year: 2022, total: 3000.00, details: <ExpenseDetail>[
        ExpenseDetail(title: "NuBank", value: 100.00),
        ExpenseDetail(title: "Apartamento", value: 1100.00),
        ExpenseDetail(title: "Aluguel", value: 1700.00),
      ]),
      Expense(month: "Agosto", year: 2022, total: 2524.00, details: <ExpenseDetail>[
        ExpenseDetail(title: "NuBank", value: 100.00),
        ExpenseDetail(title: "Apartamento", value: 1100.00),
        ExpenseDetail(title: "Aluguel", value: 1700.00),
      ]),
      Expense(month: "Setembro", year: 2022, total: 8907.00, details: <ExpenseDetail>[
        ExpenseDetail(title: "NuBank", value: 100.00),
        ExpenseDetail(title: "Apartamento", value: 7658.00),
        ExpenseDetail(title: "Aluguel", value: 1700.00),
      ]),
      Expense(month: "Outubro", year: 2022, total: 20540.00, details: <ExpenseDetail>[
        ExpenseDetail(title: "NuBank", value: 100.00),
        ExpenseDetail(title: "Apartamento", value: 1100.00),
        ExpenseDetail(title: "Aluguel", value: 1700.00),
      ]),
      Expense(month: "Novembro", year: 2022, total: 305409.00, details: <ExpenseDetail>[
        ExpenseDetail(title: "NuBank", value: 100.00),
        ExpenseDetail(title: "Apartamento", value: 1100.00),
        ExpenseDetail(title: "Aluguel", value: 1700.00),
      ]),
      Expense(month: "Dezembro", year: 2022, total: 5054091.00, details: <ExpenseDetail>[
        ExpenseDetail(title: "NuBank", value: 100.00),
        ExpenseDetail(title: "Apartamento", value: 3001.00),
        ExpenseDetail(title: "Aluguel", value: 1700.00),
      ])
    ]);
    return _expenses;
  }

  List<Expense> addExpense(Expense expense) {
    _expenses.add(expense);
    return _expenses;
  }

  List<Expense> removeExpense(Expense expense) {
    _expenses.remove(expense);
    return _expenses;
  }
}
