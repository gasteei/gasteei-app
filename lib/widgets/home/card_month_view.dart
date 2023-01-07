import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gasteei/widgets/censure.dart';

class CardMonthView extends StatelessWidget {
  final String expanse;
  final String headline2;
  final String headline3;
  final bool canSee;
  final String titleFirstText;
  final String titleSecondText;
  const CardMonthView(
      {super.key,
      required this.expanse,
      required this.headline2,
      required this.headline3,
      required this.canSee,
      required this.titleFirstText,
      required this.titleSecondText});

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
                // const Gap(9),
                // Text(
                //   titleFirstText,
                //   style: Theme.of(context).textTheme.headline2,
                // ),
                const Gap(10),
                Text(
                  titleSecondText,
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
              decoration: BoxDecoration(
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
                      canSee
                          ? Text(
                              expanse,
                              style: Theme.of(context).textTheme.headline1?.copyWith(
                                    color: Colors.white,
                                  ),
                            )
                          : const Censure(),
                      canSee ? const Gap(25) : const Gap(35),
                      Text(
                        headline2,
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      Text(
                        headline3,
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
