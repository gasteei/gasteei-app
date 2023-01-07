import 'dart:ui';

import 'package:flutter/material.dart';

class FloatingActionButtonBlur extends StatelessWidget {
  const FloatingActionButtonBlur({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(40)),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 8.0,
                sigmaY: 8.0,
              ),
              child: SizedBox(
                height: 75,
                width: 75,
                child: FittedBox(
                  child: FloatingActionButton(
                    //backgroundColor: const Color(0xFFFF825A).withOpacity(0.78),
                    onPressed: () {},
                    child: const Icon(
                      Icons.add_rounded,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
