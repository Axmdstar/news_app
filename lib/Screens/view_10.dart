import 'package:flutter/material.dart';
import 'package:news_app/Cards/card_25.dart';
import 'package:news_app/Cards/card_26.dart';
import 'package:gap/gap.dart';
class View10 extends StatelessWidget {
  const View10({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card25(),
            Gap(30),
            Card26(),
            Gap(30),


          ],
        ),
      ),
    );
  }
}
