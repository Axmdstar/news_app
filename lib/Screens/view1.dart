import 'package:flutter/material.dart';
import 'package:news_app/Cards/card_1.dart';
import 'package:news_app/Cards/card_2.dart';
import 'package:news_app/Cards/card_3.dart';
import 'package:news_app/Cards/card_4.dart';
import 'package:news_app/Cards/card_5.dart';
import 'package:news_app/Cards/card_6.dart';
import 'package:gap/gap.dart';

class View1 extends StatelessWidget {
  const View1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card1(),
            Gap(30),
            Card2(),
            Gap(30),
            Card3(),
            Gap(30),
            Card4(),
            Gap(30),
            Card5(),
            Gap(30),
            Card6(),
          ],
        ),
      ),
    );
  }
}
