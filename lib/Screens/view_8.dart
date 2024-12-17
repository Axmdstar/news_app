import 'package:flutter/material.dart';
import 'package:news_app/Cards/card_21.dart';
import 'package:news_app/Cards/card_22.dart';
import 'package:gap/gap.dart';
class View8 extends StatelessWidget {
  const View8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card21(),
            Gap(30),
            Card22()

          ],
        ),
      ),
    );

  }
}
