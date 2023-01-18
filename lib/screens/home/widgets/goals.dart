import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Goals extends StatefulWidget {
  const Goals({super.key});

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Gap(10),
              Text(
                "Metas",
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
                    ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Color(0xFFFF825A),
                  ),
                  padding: const EdgeInsets.only(top: 15),
                  height: 140,
                  width: 140,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Honda Fit 2012",
                            style: Theme.of(context).textTheme.headline2?.copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                          ),
                          const Gap(30),
                          Text("R\$ 40.000,00",
                              style: Theme.of(context).textTheme.headline1?.copyWith(
                                    color: Colors.white,
                                    fontSize: 16,
                                  )),
                          const Gap(10),
                          Text("R\$ 9.339,11",
                              style: Theme.of(context).textTheme.headline2?.copyWith(
                                    color: Colors.white,
                                    fontSize: 12,
                                  )),
                          const Gap(5),
                          const SizedBox(
                            width: 105,
                            height: 4,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child: LinearProgressIndicator(
                                value: 0.5,
                                backgroundColor: Color(0xFF673728),
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
