import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gasteei/models/revenue.dart';
import 'package:gasteei/repositories/revenue_repository.dart';
import 'package:gasteei/screens/home/widgets/card_month_view.dart';
import 'package:intl/intl.dart';

class Revenues extends StatefulWidget {
  final bool canSee;

  const Revenues({super.key, required this.canSee});

  @override
  State<Revenues> createState() => _RevenuesState();
}

class _RevenuesState extends State<Revenues> {
  var revenueRepository = RevenueRepository();
  List<Revenue> revenues = [];

  @override
  void initState() {
    super.initState();
    revenues = revenueRepository.loadRevenues();
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
              Text("Receitas", style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 30)),
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
          itemCount: revenues.length,
          options: CarouselOptions(
            height: 200,
            initialPage: 0,
          ),
          itemBuilder: (context, index, realIndex) {
            final revenue = revenues[index];

            return revenueItem(revenue, "pt_BR", widget.canSee, false);
          },
        )
      ],
    );
  }

  Widget revenueItem(Revenue revenue, String locale, bool canSee, bool isActualMonth) {
    NumberFormat formatter = NumberFormat.simpleCurrency(locale: locale, decimalDigits: 2);
    var formattedValue = formatter.format(revenue.value);

    return CardMonthView(
        value: revenue.isPositive ? "+ $formattedValue" : "- $formattedValue",
        headline2: "Última entrada",
        detailTile: "Dia ${revenue.lastEntry}",
        canSee: canSee,
        month: revenue.month,
        isActualMonth: isActualMonth);
  }
}
