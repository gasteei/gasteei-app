import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardMonthView extends StatelessWidget {
  final String value;
  final String headline2;
  final String detailTile;
  final bool canSee;
  final String month;
  final bool isActualMonth;

  const CardMonthView({
    super.key,
    required this.value,
    required this.headline2,
    required this.detailTile,
    required this.canSee,
    required this.month,
    required this.isActualMonth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 200,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Gap(10),
                Text(
                  month,
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ],
            ),
            const Gap(7),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              height: 150,
              decoration: isActualMonth
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF0583F2),
                          const Color(0xFF0583F2).withOpacity(0.70),
                        ],
                      ),
                    )
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Theme.of(context).colorScheme.onPrimary,
                          Theme.of(context).colorScheme.onPrimary.withOpacity(0.71),
                        ],
                      ),
                    ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Gap(10),
                      canSee
                          ? Text(
                              value,
                              style: Theme.of(context).textTheme.headline1?.copyWith(
                                    color: Colors.white,
                                    fontSize: 35,
                                  ),
                            )
                          : Text("••••••••",
                              style: Theme.of(context).textTheme.headline1?.copyWith(
                                    color: Colors.white,
                                    fontSize: 35,
                                  )),
                      const Gap(20),
                      Text(
                        headline2,
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      Text(
                        detailTile,
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
