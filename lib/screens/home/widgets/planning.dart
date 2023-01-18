import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gasteei/screens/home/widgets/goals.dart';

class Planning extends StatefulWidget {
  const Planning({super.key});

  @override
  State<Planning> createState() => _PlanningState();
}

class _PlanningState extends State<Planning> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Row(
                children: [
                  const Gap(10),
                  Text("Planejamento",
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                            fontSize: 30,
                            color: Theme.of(context).colorScheme.secondary,
                          )),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 13,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: const Icon(
                        Icons.close_rounded,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Gap(30),
                ],
              ),
              const Goals()
            ],
          ),
        ),
      ],
    );
  }
}
